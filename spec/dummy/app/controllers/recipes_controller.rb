class RecipesController < ApplicationController
  validates :create do
    string :name, required: true
    integer :type
    boolean :flag
    hash :config
    array :tags
  end

  def create
    head 201
  end
end
