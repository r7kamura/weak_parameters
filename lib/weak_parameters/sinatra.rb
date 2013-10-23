module WeakParameters
  module Sinatra
    def validates(params, &block)
      validator = WeakParameters::Validator.new(params, &block)
      req = Rack::Request.new(request.env)
      WeakParameters.stats[req.request_method][req.env["PATH_INFO"]] = validator
      WeakParameters.stats[req.request_method][req.env["PATH_INFO"]].validate
    end
  end
end
