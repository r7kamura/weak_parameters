module WeakParameters
  class IntegerValidator < WeakParameters::BaseValidator
    def validate
      super
      raise_integer_error if !nil? && !integer?
    end

    def type
      :integer
    end

    private

    def integer?
      /\A-?\d+\z/ === value
    end

    def raise_integer_error
      raise WeakParameters::ValidationError, "params[#{key.inspect}] must be an Integer"
    end
  end
end
