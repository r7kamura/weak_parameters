module WeakParameters
  class IntegerValidator < WeakParameters::BaseValidator
    def valid_type?
      /\A-?\d+\z/ === params[key].to_s
    end

    def error_message
      "params[#{key.inspect}] must be a valid Integer"
    end

    private

    def value
      super.presence.try(:to_i)
    end
  end
end
