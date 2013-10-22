#require "action_controller"
require "active_support/hash_with_indifferent_access"

require "weak_parameters/base_validator"
require "weak_parameters/any_validator"
require "weak_parameters/array_validator"
require "weak_parameters/boolean_validator"
require "weak_parameters/float_validator"
require "weak_parameters/hash_validator"
require "weak_parameters/integer_validator"
require "weak_parameters/string_validator"
#require "weak_parameters/controller"
require "weak_parameters/validation_error"
require "weak_parameters/validator"
require "weak_parameters/version"

# Provides `validates` DSL to controllers to validate params.
#
# Examples
#
#   # POST /recipes { name: "alice" }              #=> 201
#   # POST /recipes { name: "alice", type: 1 }     #=> 201
#   # POST /recipes { name: "alice", type: "bob" } #=> 400
#   # POST /recipes { type: 1 }                    #=> 400
#   class RecipesController < ApplicationController
#     rescue_from WeakParameters::ValidationError do |exception|
#       render text: exception.message, status: 400
#     end
#
#     validates :create do
#       string :name, required: true
#       integer :type
#     end
#
#     def create
#       respond_with Recipe.create(params.slice(:name, :type))
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
  def self.stats
    @stats ||= ActiveSupport::HashWithIndifferentAccess.new do |hash, key|
      hash[key] = ActiveSupport::HashWithIndifferentAccess.new
    end
  end
end

#ActionController::Base.extend WeakParameters::Controller
