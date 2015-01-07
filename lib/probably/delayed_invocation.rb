class DelayedInvocation
  def initialize(target)
    @target = target
    @methods = []
    @args = []
    @blocks = []
  end

  def method_missing(name, *args, &block)
    @methods << name
    @args << args
    @blocks << (block.nil? ? nil : block)
    self
  end

  def or(value)
    @methods.reduce(@target) do |t, m|
      block = @blocks.shift
      unless block.nil?
        t.__send__(m, *(@args.shift), &block)
      else
        t.__send__(m, *(@args.shift))
      end
    end
  rescue
    if block_given?
      yield
    else
      value
    end
  end
end

