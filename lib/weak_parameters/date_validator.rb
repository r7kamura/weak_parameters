module WeakParameters
  class DateValidator < WeakParameters::BaseValidator
    private

    # Examples
    # validates :create do
    #   date :date, date_formats: %w[%Y%m%d %m-%d-%Y %Y/%m/%d %Y.%m.%d]
    # end
    #
    def valid_type?
      date_formats = options[:date_formats] || %w[%Y-%m-%d]
      date_formats.any? { |date_format| Date._strptime(value, date_format) }
    end

    def error_message
      "params[#{key.inspect}] must be a valid Date"
    end
  end
end
