module WeakParameters
  class HashValidator < WeakParameters::BaseValidator
    private

    def valid_type?
      value.is_a?(Hash)
    end

    def error_message
      "params[#{key.inspect}] must be a valid Hash"
    end
  end
end
