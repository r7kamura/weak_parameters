module WeakParameters
  class DateValidator < WeakParameters::BaseValidator
    private

    def parser_class
      ::Date
    end

    def valid_type?
      if options[:only]
        Array(options[:only]).any? do |format|
          begin
            parser_class.strptime(value, format)
            return false unless strictly?(format)
            true
          rescue ::ArgumentError
            false
          end
        end
      else
        begin
          parser_class.parse(value)
          return false unless strictly?
          true
        rescue ::ArgumentError
          false
        end
      end
    end

    def strictly?(format = nil)
      result = format ? ::Date._strptime(value, format) : ::Date._strptime(value)
      result && !result.key?(:leftover)
    end

    def error_message
      "params[#{key.inspect}] must be a valid Date"
    end
  end
end
