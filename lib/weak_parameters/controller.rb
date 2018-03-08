module WeakParameters
  module Controller
    def validates(action_name, options = {}, &block)
      before_action only: action_name do
        validator = WeakParameters::Validator.new(self, options, &block)
        WeakParameters.stats[params[:controller]][params[:action]] = validator
        WeakParameters.stats[params[:controller]][params[:action]].validate
        if Object.const_defined?(:ActionController) && ActionController.const_defined?(:StrongParameters)
          @permitted_params = validator.strong_params.permit!
        end
      end
      define_method(:permitted_params) { @permitted_params }
    end
  end
end
