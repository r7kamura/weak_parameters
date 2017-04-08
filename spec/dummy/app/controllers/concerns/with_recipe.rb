module WithRecipe
  extend ActiveSupport::Concern

  included do
    validates :create do
      any :object
      string :name, required: true, except: %w[invalid wrong]
      integer :type, only: 0..3
      integer :number, only: [0, 1]
      boolean :flag
      hash :config
      array :tags
      float :rate
      file :attachment
      integer :custom, only: 0..1, handler: :render_error
      string :zip_code do |value|
        zip_pattern(value)
      end
      object :nested, required: true do
        integer :number, only: [0, 1]
      end

      list :numbers, :integer, required: true, description: 'some numbers'

      object :body do
        list :items, :object, description: 'some items' do
          string :name
          integer :price
        end
      end
    end
  end

  def create
    head 201
  end

  private

  def render_error
    head 403
  end

  def zip_pattern(value)
    value =~ /\A\d{3}-\d{4}\z/
  end
end
