require "spec_helper"

describe "Strong with rails-api", type: :request do
  let(:params) do
    {
      object: [1],
      strong_object: [1],
      name: "name",
      strong_name: "name",
      number: 0,
      strong_number: 0,
      type: 1,
      strong_type: 1,
      flag: true,
      strong_flag: true,
      config: { a: 1 },
      strong_config: { a: 1, b: { c: 2 } },
      tags: [1],
      strong_tags: [1],
      rate: 0.01,
      strong_rate: 0.01,
      date: Date.current.strftime('%Y-%m-%d'),
      strong_date: Date.current.strftime('%Y-%m-%d'),
      time: Time.current.strftime('%Y-%m-%d %H:%M:%S'),
      strong_time: Time.current.strftime('%Y-%m-%d %H:%M:%S'),
      attachment: Rack::Test::UploadedFile.new(__FILE__),
      strong_attachment: Rack::Test::UploadedFile.new(__FILE__),
      zip_code: "123-4567",
      strong_zip_code: "123-4567",
      custom: 0,
      strong_custom: 0,
      nested: {
        number: 0
      },
      strong_nested: {
        strong_number: 0
      },
      numbers: [1, 2, 3],
      strong_numbers: [1, 2, 3],
      body: {
        items: [
          { name: "foo", price: 100 },
          { name: "bar", price: 100 }
        ]
      },
      strong_body: {
        items: [
          { name: "foo", strong_price: 100 },
          { name: "bar", strong_price: 100 }
        ]
      }
    }
  end

  describe "#permitted_params" do
    it "returns permitted_params" do
      post "/api/strongs", params: params
      expect(controller.permitted_params).to have_key "strong_object"
      expect(controller.permitted_params).not_to have_key "object"

      expect(controller.permitted_params).to have_key "strong_name"
      expect(controller.permitted_params).not_to have_key "name"

      expect(controller.permitted_params).to have_key "strong_number"
      expect(controller.permitted_params).not_to have_key "number"

      expect(controller.permitted_params).to have_key "strong_type"
      expect(controller.permitted_params).not_to have_key "type"

      expect(controller.permitted_params).to have_key "strong_flag"
      expect(controller.permitted_params).not_to have_key "flag"

      expect(controller.permitted_params).to have_key "strong_config"
      expect(controller.permitted_params).not_to have_key "config"

      expect(controller.permitted_params).to have_key "strong_tags"
      expect(controller.permitted_params).not_to have_key "tags"

      expect(controller.permitted_params).to have_key "strong_rate"
      expect(controller.permitted_params).not_to have_key "rate"

      expect(controller.permitted_params).to have_key "strong_date"
      expect(controller.permitted_params).not_to have_key "date"

      expect(controller.permitted_params).to have_key "strong_time"
      expect(controller.permitted_params).not_to have_key "time"

      expect(controller.permitted_params).to have_key "strong_attachment"
      expect(controller.permitted_params).not_to have_key "attachment"

      expect(controller.permitted_params).to have_key "strong_zip_code"
      expect(controller.permitted_params).not_to have_key "zip_code"

      expect(controller.permitted_params).to have_key "strong_custom"
      expect(controller.permitted_params).not_to have_key "custom"

      expect(controller.permitted_params).to have_key "strong_nested"
      expect(controller.permitted_params).not_to have_key "nested"

      expect(controller.permitted_params).to have_key "strong_numbers"
      expect(controller.permitted_params).not_to have_key "numbers"

      expect(controller.permitted_params).to have_key "strong_body"
      expect(controller.permitted_params).not_to have_key "body"

      expect(controller.permitted_params[:strong_body]).to have_key "items"

      expect(controller.permitted_params[:strong_body][:items].first).to have_key "strong_price"
      expect(controller.permitted_params[:strong_body][:items].first).not_to have_key "name"
    end
  end
end
