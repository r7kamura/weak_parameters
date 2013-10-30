require "action_controller"
require "weak_parameters/controller"

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

ActionController::Base.extend WeakParameters::Controller

