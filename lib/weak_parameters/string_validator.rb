module WeakParameters
  class StringValidator < WeakParameters::BaseValidator
    def valid_type?
      value.is_a?(String)
    end

    def error_message
      "params[#{key.inspect}] must be a valid String"
    end
  end
end
