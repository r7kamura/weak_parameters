module WeakParameters
  class BaseValidator
    attr_reader :params, :key, :options

    def initialize(params, key, options = {})
      @params = params
      @key = key
      @options = options
    end

    def validate
      raise_error if required? && nil? || exist? && invalid_type?
    end

    def required?
      !!options[:required]
    end

    def type
      self.class.name.split("::").last.sub(/Validator$/, "").underscore.to_sym
    end

    private

    def nil?
      value.nil?
    end

    def exist?
      !nil?
    end

    def value
      params[key]
    end

    def raise_error
      raise WeakParameters::ValidationError, error_message
    end

    def error_message
      "params[#{key.inspect}] is required"
    end

    def valid_type?
      true
    end

    def invalid_type?
      !valid_type?
    end
  end
end
