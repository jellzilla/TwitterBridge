require 'bundler/setup'
require 'twitter'

class ProofOfConcept
  def color
    @color or "Nothing"
  end
  
  def color=(new_color)
    if validate_color new_color
      @color = new_color 
    else
      raise "Bad color"
    end
  end
  
  def validate_color(color)
    not (color =~ /^#[a-fA-F0-9]{6}$/).nil?
  end

  def to_s
    color
  end

  def check_twitter
    case rand 5
    when 0
      "#FF0000"
    when 1
      "#00FF00"
    when 2
      "#0000FF"
    when 3
      "#000000"
    when 4
      "#FFFFFF"
    end
  end

  # MAIN WEBSERVER
  def self.app 
    poc = self.new

    proc do |env|
      [
        200,          # Status code
        {             # Response headers
          'Content-Type' => 'text/plain',
        },
        [poc.color]        # Response body
      ]
    end
  end
end
