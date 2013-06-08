class RecipesController < ApplicationController
  validates :create do
    string :name, required: true
    integer :type
    boolean :flag
  end

  def create
    head 201
  end
end
