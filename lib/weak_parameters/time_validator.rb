module WeakParameters
  class TimeValidator < WeakParameters::DateValidator
    private

    DEFALUT_FORMATS = ['%Y-%m-%d %H:%M:%S']

    def invalid_format?(date_format)
      false
    end

    def error_message
      "params[#{key.inspect}] must be a valid Time"
    end
  end
end
