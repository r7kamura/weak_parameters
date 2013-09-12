module WeakParameters
  class StringValidator < WeakParameters::BaseValidator
    def valid_type?
      value.is_a?(String)
    end
  end
end
