module WeakParameters
  class FileValidator < WeakParameters::BaseValidator
    private

    VALID_TYPES = [
      StringIO,
      IO,
      ActionDispatch::Http::UploadedFile,
      Rack::Test::UploadedFile,
    ]

    def valid_type?
      VALID_TYPES.any? {|type| value.is_a?(type) }
    end

    def error_message
      "params[#{key.inspect}] must be a valid File"
    end
  end
end
