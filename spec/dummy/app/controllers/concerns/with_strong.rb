module WithStrong
  extend ActiveSupport::Concern

  included do
    validates :create do
      any :object
      any :strong_object, strong: true
      string :name, required: true, except: %w[invalid wrong]
      string :strong_name, required: true, strong: true, except: %w[invalid wrong]
      integer :type, only: 0..3
      integer :strong_type, strong: true, only: 0..3
      integer :number, only: [0, 1]
      integer :strong_number, strong: true, only: [0, 1]
      boolean :flag
      boolean :strong_flag, strong: true
      hash :config
      hash :strong_config, strong: true
      array :tags
      array :strong_tags, strong: true
      float :rate
      float :strong_rate, strong: true
      date :date
      date :strong_date, strong: true
      file :attachment
      file :strong_attachment, strong: true
      integer :custom, only: 0..1, handler: :render_error
      integer :strong_custom, strong: true, only: 0..1, handler: :render_error
      string :zip_code do |value|
        value =~ /\A\d{3}-\d{4}\z/
      end
      string :strong_zip_code, strong: true do |value|
        value =~ /\A\d{3}-\d{4}\z/
      end
      object :nested, required: true do
        integer :number, only: [0, 1]
      end
      object :strong_nested, required: true do
        integer :strong_number, strong: true, only: [0, 1]
      end

      list :numbers, :integer, description: 'some numbers'

      list :strong_numbers, :integer, strong: true, description: 'some numbers'

      object :strong_body do
        list :items, :object, description: 'some items' do
          string :name
          integer :strong_price, strong: true
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
end
