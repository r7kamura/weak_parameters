require "spec_helper"

describe "Global strong", type: :request do
  let(:params) do
    {
      strong_object: [1],
      strong_name: "name",
      strong_number: 0,
      strong_type: 1,
      strong_flag: true,
      strong_config: { a: 1, b: { c: 2 } },
      strong_tags: [1],
      strong_date: Date.current.strftime('%Y-%m-%d'),
      strong_time: Time.current.strftime('%Y-%m-%d %H:%M:%S'),
      strong_attachment: Rack::Test::UploadedFile.new(__FILE__),
      strong_zip_code: "123-4567",
      strong_custom: 0,
      strong_nested: {
        strong_number: 0
      },
      strong_numbers: [1, 2, 3],
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
      post "/global_strongs", params: params
      expect(controller.permitted_params).to have_key "strong_object"
      expect(controller.permitted_params).to have_key "strong_name"
      expect(controller.permitted_params).to have_key "strong_number"
      expect(controller.permitted_params).to have_key "strong_type"
      expect(controller.permitted_params).to have_key "strong_flag"
      expect(controller.permitted_params).to have_key "strong_config"
      expect(controller.permitted_params).to have_key "strong_tags"
      expect(controller.permitted_params).to have_key "strong_date"
      expect(controller.permitted_params).to have_key "strong_time"
      expect(controller.permitted_params).to have_key "strong_attachment"
      expect(controller.permitted_params).to have_key "strong_zip_code"
      expect(controller.permitted_params).to have_key "strong_custom"
      expect(controller.permitted_params).to have_key "strong_nested"
      expect(controller.permitted_params).to have_key "strong_numbers"
      expect(controller.permitted_params).to have_key "strong_body"
      expect(controller.permitted_params[:strong_body]).to have_key "items"
      expect(controller.permitted_params[:strong_body][:items].first).to have_key "strong_price"
    end
  end
end
