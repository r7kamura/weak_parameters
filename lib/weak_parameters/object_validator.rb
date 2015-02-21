module WeakParameters
  class ObjectValidator < WeakParameters::HashValidator
    attr_reader :validators
    def initialize(controller, key, validators, options = {})
      super controller, key, options
      @validators = validators
    end

    def validate(*args)
      super

      if valid? && exist?
        validators.each do |validator|
          validator.validate(*path)
        end
      end
    end

    private

    def valid?
      case
      when required? && nil?
        false
      when exist? && invalid_type?
        false
      when exist? && exceptional?
        false
      else
        true
      end
    end

    def error_message
      keys = path.map { |k| "[#{k.inspect}]" }.join ''
      "params#{keys} must be a valid Hash"
    end
  end
end
