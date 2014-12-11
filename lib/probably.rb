$:.unshift File.dirname(__FILE__)

require 'probably/delayed_invocation'

module Probably
  def probably(target = nil)
    DelayedInvocation.new(target || self)
  end
end
