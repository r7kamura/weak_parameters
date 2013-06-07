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
      validators << WeakParameters::BaseValidator.new(params, key, options)
    end

    def integer(key, options = {})
      validators << WeakParameters::IntegerValidator.new(params, key, options)
    end
  end
end
