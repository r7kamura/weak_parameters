class MultiActionsController < ApplicationController
  validates :index, :create do
    string :name, required: true
  end

  def index
    head 200
  end

  def create
    head 201
  end

  private

  def render_error
    head 403
  end
end
