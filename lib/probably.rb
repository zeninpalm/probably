$:.unshift File.dirname(__FILE__)

require 'probably/delayed_invocation'

module Probably
  def probably
    DelayedInvocation.new(self)
  end
end
