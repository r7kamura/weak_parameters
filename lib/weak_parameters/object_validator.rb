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

    def strong_params(*args)
      super

      strong_values = validators.map do |validator|
        validator.strong_params(*path)
      end.inject(ActionController::Parameters.new, &:merge)
      return {} if strong_values.blank?
      { key => strong_values }
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
