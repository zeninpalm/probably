class DelayedInvocation
  def initialize(target)
    @target = target
    @methods = []
    @args = []
  end

  def method_missing(name, *args)
    @methods << name
    @args << args
    self
  end

  def or(value)
    @methods.reduce(@target) do |t, m|
      t.send(m, *(@args.shift))
    end
  rescue
    value
  end
end

