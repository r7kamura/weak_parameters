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

    def validators
      [ validator ]
    end
  end
end
