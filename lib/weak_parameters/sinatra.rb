require "weak_parameters/base"
require "weak_parameters/middleware"

# Provides `validates` DSL to controllers to validate params.
#
# Examples
#
#   # POST /recipes { name: "alice" }              #=> 201
#   # POST /recipes { name: "alice", type: 1 }     #=> 201
#   # POST /recipes { name: "alice", type: "bob" } #=> 400
#   # POST /recipes { type: 1 }                    #=> 400
#   class App < Sinatra::Base
#     include WeakParameters::Sinatra
#     use WeakParameters::Middleware
#
#     post 'recipes' do
#       validates do
#         string :name, required: true
#         integer :type
#       end
#
#       Recipe.create(params).to_xml
#     end
#     def validation_error exception
#       [400, { "Content-Type" => "text/html; charset=utf-8" }, [ "exception.message"]]
#     end
#   end
#
#   # WeakParameters.stats has its definitions.
#   WeakParameters::stats[:recipes][:create].validators[0].key       #=> :name
#   WeakParameters::stats[:recipes][:create].validators[0].required? #=> true
#   WeakParameters::stats[:recipes][:create].validators[1].key       #=> :type
#   WeakParameters::stats[:recipes][:create].validators[1].required? #=> false
#

module WeakParameters
  module Sinatra
    def validates(&block)
      validator = WeakParameters::Validator.new(self, &block)
      req = Rack::Request.new(request.env)
      WeakParameters.stats[req.request_method][req.env["PATH_INFO"]] = validator
      WeakParameters.stats[req.request_method][req.env["PATH_INFO"]].validate
    end
  end
end
