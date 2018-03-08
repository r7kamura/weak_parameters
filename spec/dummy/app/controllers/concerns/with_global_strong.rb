module WithGlobalStrong
  extend ActiveSupport::Concern

  included do
    validates :create do
      any :strong_object, strong: true
      string :strong_name, required: true, strong: true, except: %w[invalid wrong]
      integer :strong_type, strong: true, only: 0..3
      integer :strong_number, strong: true, only: [0, 1]
      boolean :strong_flag, strong: true
      hash :strong_config, strong: true
      array :strong_tags, strong: true
      float :strong_rate, strong: true
      date :strong_date, strong: true
      time :strong_time, strong: true
      file :strong_attachment, strong: true
      integer :strong_custom, strong: true, only: 0..1, handler: :render_error
      string :strong_zip_code, strong: true do |value|
        value =~ /\A\d{3}-\d{4}\z/
      end
      object :strong_nested, required: true do
        integer :strong_number, strong: true, only: [0, 1]
      end
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
