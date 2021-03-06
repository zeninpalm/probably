require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')

require 'probably'

describe Probably, "Basic Behaviour" do
  context "basic syntax" do
    before do
      class Object
        include Probably
      end
    end

    it "triggers methods when the source is not nil" do
      expect(5.probably.succ.or(0)).to eq 6
      expect(0.probably.succ.or(7)).to eq 1
      expect(5.probably.succ.succ.or(1)).to eq 7

      expect("test string".probably.split.count.or(1)).to eq 2
      expect("internationalization".probably.split('n').count.or(1)).to eq 4

      expect(15.probably.succ.or(10).pred).to eq 15
      expect([1, 2, 3].probably.reduce(0) {|sum, i| sum = sum + i }.or(17)).to eq 6
    end

    it "returns 'or' value when nil occurs in the calls chain" do
      expect(nil.probably.succ.succ.or(5)).to eq 5
      expect(nil.probably.split.count.or(0)).to eq 0
    end

    it "return 'or' value when exception occurs" do
      expect(15.probably.split.or(12)).to eq 12
      expect(false.probably.succ.or(true)).to eq true
    end
  end

  context "more natural syntax" do
    before do
      class Object
        include Probably
      end
    end

    it "triggers methods when the source is not nil" do
      expect(probably(5).succ.or(0)).to eq 6
      expect(probably(0).succ.or(7)).to eq 1
      expect(probably(5).succ.succ.or(1)).to eq 7

      expect(probably("test string").split.count.or(1)).to eq 2
      expect(probably("internationalization").split('n').count.or(1)).to eq 4

      expect(probably(15).succ.or(10).pred).to eq 15
      expect(probably([1, 2, 3]).reduce(0) {|sum, i| sum = sum + i }.or(17)).to eq 6
    end

    it "returns 'or' value when nil occurs in the calls chain" do
      expect(probably(nil).succ.succ.or(5)).to eq 5
      expect(probably(nil).split.count.or(0)).to eq 0
    end

    it "return 'or' value when exception occurs" do
      expect(probably(15).split.or(12)).to eq 12
      expect(probably(false).succ.or(true)).to eq true
    end

  end
end
