require "test/unit"
require './proof_of_concept.rb'

class ProofOfConceptTest < Test::Unit::TestCase
  def setup
    @poc = ProofOfConcept.new
  end

  def test_validate_color
    assert_equal true, @poc.validate_color("#FF0000")
    assert_equal true, @poc.validate_color("#000000")
    assert_equal false, @poc.validate_color("#YEUVIE")
    assert_equal false, @poc.validate_color("oiajsf1298123")
    assert_equal false, @poc.validate_color("#F800")
    assert_equal false, @poc.validate_color("12398")
  end

  def test_color
    assert_nothing_raised do
      @poc.color = "#FF0000"
    end

    assert_equal "#FF0000", @poc.color
  end
end
