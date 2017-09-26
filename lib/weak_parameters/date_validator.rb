module WeakParameters
  class DateValidator < WeakParameters::BaseValidator
    private

    DEFALUT_FORMATS = %w[%Y-%m-%d]

    def valid_type?
      date_formats.any? do |date_format|
        break false if invalid_format?(date_format)
        Date._strptime(value, date_format)
      end
    end

    def date_formats
      return %w[%Y-%m-%d] if options[:only].blank?
      options[:only].is_a?(Array) ? options[:only] : [options[:only]]
    end

    def invalid_format?(date_format)
      date_format =~ /(%H|%M|%S)/
    end

    def error_message
      "params[#{key.inspect}] must be a valid Date"
    end
  end
end
