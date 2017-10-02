module WeakParameters
  class TimeValidator < WeakParameters::DateValidator
    private

    def parser_class
      ::Time
    end

    # Time is always true! (no custom validation)
    def strictly?(format = nil)
      true
    end

    def error_message
      "params[#{key.inspect}] must be a valid Time"
    end
  end
end
