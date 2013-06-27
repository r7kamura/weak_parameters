class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: %w[invalid wrong]
    integer :type, only: 1..3
    boolean :flag
    hash :config
    array :tags
  end

  def create
    head 201
  end
end
