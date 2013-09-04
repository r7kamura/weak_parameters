module WeakParameters
  class BooleanValidator < WeakParameters::BaseValidator
    private

    def valid_type?
      %w[0 1 false true].include?(value.to_s)
    end

    def error_message
      "params[#{key.inspect}] must be a valid Boolean"
    end
  end
end
