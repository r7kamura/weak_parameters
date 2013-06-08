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

    def type
      self.class.name.split("::").last.sub(/Validator$/, "").underscore.to_sym
    end

    private

    def string(key, options = {})
      validators << WeakParameters::BaseValidator.new(params, key, options)
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
  end
end
