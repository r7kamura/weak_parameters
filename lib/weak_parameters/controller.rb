module WeakParameters
  module Controller
    def validates(action_name, &block)
      prepend_before_filter only: action_name do
        validator = WeakParameters::Validator.new(self, &block)
        WeakParameters.stats[params[:controller]][params[:action]] = validator
        WeakParameters.stats[params[:controller]][params[:action]].validate
      end
    end
  end
end
