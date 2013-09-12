module WeakParameters
  class Validator
    attr_reader :block, :params

    def initialize(params, &block)
      @params = params
      instance_eval(&block)
    end

    def validate
      validators.each(&:validate)
    end

    def validators
      @validators ||= []
    end

    private

    def any(key, options = {}, &block)
      validators << WeakParameters::AnyValidator.new(params, key, options, &block)
    end

    def string(key, options = {}, &block)
      validators << WeakParameters::StringValidator.new(params, key, options, &block)
    end

    def integer(key, options = {}, &block)
      validators << WeakParameters::IntegerValidator.new(params, key, options, &block)
    end

    def boolean(key, options = {}, &block)
      validators << WeakParameters::BooleanValidator.new(params, key, options, &block)
    end

    def hash(key, options = {}, &block)
      validators << WeakParameters::HashValidator.new(params, key, options, &block)
    end

    def array(key, options = {}, &block)
      validators << WeakParameters::ArrayValidator.new(params, key, options, &block)
    end

    def float(key, options = {})
      validators << WeakParameters::FloatValidator.new(params, key, options, &block)
    end
  end
end
