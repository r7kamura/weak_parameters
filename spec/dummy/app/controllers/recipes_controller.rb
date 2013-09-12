class RecipesController < ApplicationController
  validates :create do
    any :object
    string :name, required: true, except: %w[invalid wrong]
    integer :type, only: 0..3
    integer :number, only: [0, 1]
    boolean :flag
    hash :config
    array :tags
    float :rate
    string :zip_code do |value|
      value =~ /\A\d{3}-\d{4}\z/
    end
  end

  def create
    head 201
  end
end
