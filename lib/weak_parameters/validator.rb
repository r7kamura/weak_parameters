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

    def string(key, options = {})
      validators << WeakParameters::StringValidator.new(params, key, options)
    end

    def integer(key, options = {})
      validators << WeakParameters::IntegerValidator.new(params, key, options)
    end

    def boolean(key, options = {})
      validators << WeakParameters::BooleanValidator.new(params, key, options)
    end

    def hash(key, options = {})
      validators << WeakParameters::HashValidator.new(params, key, options)
    end

    def array(key, options = {})
      validators << WeakParameters::ArrayValidator.new(params, key, options)
    end

    def float(key, options = {})
      validators << WeakParameters::FloatValidator.new(params, key, options)
    end
  end
end
