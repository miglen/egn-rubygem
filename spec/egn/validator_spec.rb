require 'spec_helper'

describe Egn::Validator do

  describe "#validate" do

    it "fails for strings with incorrect size" do
      expect(Egn::Validator.validate("123456789")).to be_false
      expect(Egn::Validator.validate("12345678901")).to be_false
    end

    it "fails for incorrect dates" do

      expect(Egn::Validator.validate("6101347500")).to be_false
    end

    it "checks 500 000 of the generated numbers", :brute  do
      egns = Array.new(500_000).map{ |i| Egn.generate }
      egns.each do |egn|
        result = Egn::Validator.validate(egn)
        puts egn unless result
        expect(result).to be_true
      end
    end

  end

end
