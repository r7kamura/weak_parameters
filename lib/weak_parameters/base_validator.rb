module WeakParameters
  class BaseValidator
    attr_reader :params, :key, :options, :block

    def initialize(params, key, options = {}, &block)
      @params = params
      @key = key
      @options = options
      @block = block
    end

    def validate
      raise_error unless valid?
    end

    def required?
      !!options[:required]
    end

    def type
      self.class.name.split("::").last.sub(/Validator$/, "").underscore.to_sym
    end

    private

    def valid?
      case
      when required? && nil?
        false
      when exist? && invalid_type?
        false
      when exist? && exceptional?
        false
      when exist? && block && !block.call(value)
        false
      else
        true
      end
    end

    def nil?
      value.nil?
    end

    def exist?
      !nil?
    end

    def exceptional?
      case
      when options[:only].try(:exclude?, value)
        true
      when options[:except].try(:include?, value)
        true
      else
        false
      end
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
