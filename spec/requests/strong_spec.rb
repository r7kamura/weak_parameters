require "spec_helper"

describe "Strong", type: :request do
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
      post "/strongs", params
      controller.permitted_params.should have_key "strong_object"
      controller.permitted_params.should_not have_key "object"

      controller.permitted_params.should have_key "strong_name"
      controller.permitted_params.should_not have_key "name"

      controller.permitted_params.should have_key "strong_number"
      controller.permitted_params.should_not have_key "number"

      controller.permitted_params.should have_key "strong_type"
      controller.permitted_params.should_not have_key "type"

      controller.permitted_params.should have_key "strong_flag"
      controller.permitted_params.should_not have_key "flag"

      controller.permitted_params.should have_key "strong_config"
      controller.permitted_params.should_not have_key "config"

      controller.permitted_params.should have_key "strong_tags"
      controller.permitted_params.should_not have_key "tags"

      controller.permitted_params.should_not have_key "strong_rate"
      controller.permitted_params.should_not have_key "rate"

      controller.permitted_params.should have_key "strong_attachment"
      controller.permitted_params.should_not have_key "attachment"

      controller.permitted_params.should have_key "strong_zip_code"
      controller.permitted_params.should_not have_key "zip_code"

      controller.permitted_params.should have_key "strong_custom"
      controller.permitted_params.should_not have_key "custom"

      controller.permitted_params.should have_key "strong_nested"
      controller.permitted_params.should_not have_key "nested"

      controller.permitted_params.should have_key "strong_numbers"
      controller.permitted_params.should_not have_key "numbers"

      controller.permitted_params.should have_key "strong_body"
      controller.permitted_params.should_not have_key "body"

      controller.permitted_params[:strong_body].should have_key "items"

      controller.permitted_params[:strong_body][:items].first.should have_key "strong_price"
      controller.permitted_params[:strong_body][:items].first.should_not have_key "name"
    end
  end
end
