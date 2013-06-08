module WeakParameters
  class BooleanValidator < WeakParameters::BaseValidator
    def type
      :boolean
    end

    private

    def valid_type?
      %w[0 1 false true].include?(value)
    end

    def error_message
      "params[#{key.inspect}] must be 0, 1, false or true"
    end
  end
end
