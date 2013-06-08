module WeakParameters
  class BooleanValidator < WeakParameters::BaseValidator
    def validate
      super
      raise_integer_error if !nil? && !boolean?
    end

    def type
      :boolean
    end

    private

    def boolean?
      %w[0 1 false true].include?(value)
    end

    def raise_integer_error
      raise WeakParameters::ValidationError, "params[#{key.inspect}] must be 0, 1, false or true"
    end
  end
end
