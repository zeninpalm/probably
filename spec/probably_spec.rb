require File.expand_path(File.dirname(__FILE__) + '/spec_helper.rb')

require 'probably'

describe Probably, "Basic Behaviour" do
  it "always asserts true" do
    expect(true).to be
  end
end
