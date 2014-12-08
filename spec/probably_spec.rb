require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')

require 'probably'

class Object
  include Probably
end

describe Probably, "Basic Behaviour" do
  it "triggers methods when the source is not nil" do
    expect(5.probably.succ.or(0)).to eq 6
    expect(0.probably.succ.or(7)).to eq 1
    expect(5.probably.succ.succ.or(1)).to eq 7

    expect("test string".probably.split.count.or(1)).to eq 2
    expect("internationalization".probably.split('n').count.or(1)).to eq 4
  end

  it "returns 'or' value when nil occurs in the calls chain" do
    expect(nil.probably.succ.succ.or(5)).to eq 5
    expect(nil.probably.split.count.or(0)).to eq 0
  end
end
