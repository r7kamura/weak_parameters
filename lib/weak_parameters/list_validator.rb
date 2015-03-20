module WeakParameters
  class ListValidator < WeakParameters::ArrayValidator
    attr_reader :validator
    def initialize(controller, key, validator)
      super controller, key, {}
      @validator = validator
    end

    def validate(*args)
      super

      if valid? && exist?
        value.each.with_index do |_, i|
          validator.validate(*path, i)
        end
      end
    end

    def strong_params(*args)
      super

      return {} unless exist?
      strong_values = value.map.with_index do |_, i|
        validator.strong_params(*path, i)[i]
      end.compact
      strong_values.present? ? { key => strong_values } : {}
    end

    def validators
      [ validator ]
    end
  end
end
