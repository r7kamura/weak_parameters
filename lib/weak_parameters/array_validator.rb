module WeakParameters
  class ArrayValidator < WeakParameters::BaseValidator
    private

    def valid_type?
      value.is_a?(Array)
    end

    def error_message
      "params[#{key.inspect}] must be a valid Array"
    end
  end
end
