module WeakParameters
  class HashValidator < WeakParameters::BaseValidator
    private

    def valid_type?
      type = if Object.const_defined?(:ActionController) && ActionController.const_defined?(:StrongParameters)
               ActionController::Parameters
             else
               Hash
             end
      value.is_a?(type)
    end

    def error_message
      "params[#{key.inspect}] must be a valid Hash"
    end
  end
end
