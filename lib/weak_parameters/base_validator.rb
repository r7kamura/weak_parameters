module WeakParameters
  class BaseValidator
    attr_reader :params, :key, :options

    def initialize(params, key, options = {})
      @params = params
      @key = key
      @options = options
    end

    def validate
      raise_required_error if required? && nil?
    end

    def required?
      !!options[:required]
    end

    def type
      :string
    end

    private

    def nil?
      value.nil?
    end

    def value
      params[key]
    end

    def raise_required_error
      raise WeakParameters::ValidationError, "params[#{key.inspect}] is required"
    end
  end
end
