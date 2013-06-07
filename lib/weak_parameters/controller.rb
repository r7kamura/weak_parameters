module WeakParameters
  module Controller
    def validates(action_name, &block)
      before_filter only: action_name do
        validator = WeakParameters::Validator.new(params, &block)
        WeakParameters.stats[controller_name][action_name] = validator
        WeakParameters.stats[controller_name][action_name].validate
      end
    end
  end
end
