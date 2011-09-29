require 'bundler/setup'
require 'twitter'

class ProofOfConcept
  def color
    @color or "Nothing"
  end
  
  def color=(new_color)
    new_color = new_color[/#[a-fA-F0-9]{6}/]
    if validate_color new_color
      @color = new_color 
    else
      raise "Bad color: #{new_color}"
    end
  end
  
  def validate_color(color)
    not (color =~ /^#[a-fA-F0-9]{6}$/).nil?
  end

  def to_s
    color
  end

  def check_twitter
    Twitter.configure do |config|
      config.consumer_key = "DKhWrTEKrZQ054TVfNbCg"
      config.consumer_secret = "agr2Lye5Q2lzRmMjlhfBgnXuNhEeM5X7BkTwWhcaE"
      config.oauth_token = "378213207-sQQJeD6WN3TIT2lmVbnxbSS4Vz8yev3OqtbNmRBw"
      config.oauth_token_secret = "VGNWzXd6NS0FUhxlvFAeik2FQSw3aHBv5N6jxZ1pW4"
    end

    client = Twitter::Client.new
#.user_timeline("pausch_bridge").last.text
    dms = client.mentions.first.text
    #Twitter.user_timeline("pausch_bridge").first.text
  end

  # MAIN WEBSERVER
  def self.app 
    poc = self.new

    proc do |env|
      poc.color = poc.check_twitter

      [
        200,          # Status code
        {             # Response headers
          'Content-Type' => 'text/html',
        },
        ["<html><head><style type='text/css'>body {background-color:
#{poc.color};}</style></head><body>#{poc.check_twitter}</body></html>"]        # Response body
      ]
    end
  end
end
