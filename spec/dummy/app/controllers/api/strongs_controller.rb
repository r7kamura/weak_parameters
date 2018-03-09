module Api
  class StrongsController < APIController
    include WithStrong

    validates :create_per_validation_block_option, block_option: { strong: true } do
      any :strong_object
      string :strong_name, required: true, except: %w[invalid wrong]
      integer :strong_type, only: 0..3
      integer :strong_number, only: [0, 1]
      boolean :strong_flag
      hash :strong_config
      array :strong_tags
      float :strong_rate
      date :strong_date
      time :strong_time
      file :strong_attachment
      integer :strong_custom, only: 0..1, handler: :render_error
      string :strong_zip_code do |value|
        value =~ /\A\d{3}-\d{4}\z/
      end
      object :strong_nested, required: true do
        integer :strong_number, only: [0, 1]
      end
      list :strong_numbers, :integer, description: 'some numbers'
      object :strong_body do
        list :items, :object, description: 'some items' do
          string :name
          integer :strong_price
        end
      end
    end

    def create_per_validation_block_option
      head 201
    end
  end
end
