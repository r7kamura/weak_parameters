module WeakParameters
  class FloatValidator < WeakParameters::BaseValidator
    def valid_type?
      /\A-?\d+(?:\.\d+)?\z/ === params[key].to_s
    end

    def error_message
      "params[#{key.inspect}] must be a valid Float"
    end

    private

    def value
      super.presence.try(:to_f)
    end
  end
end
