class RecipesController < ApplicationController
  validates :create do
    string :name, required: true, except: %w[invalid wrong]
    integer :type, only: 0..3
    integer :number, only: [0, 1]
    boolean :flag
    hash :config
    array :tags
  end

  def create
    head 201
  end
end
