require "spec_helper"

describe "Recipes", type: :request do
  let(:params) do
    {
      object: [],
      name: "name",
      number: 0,
      type: 1,
      flag: true,
      config: {},
      tags: [],
      attachment: Rack::Test::UploadedFile.new(__FILE__),
      zip_code: "123-4567",
      custom: 0,
      nested: {
        number: 0
      },
      numbers: [1, 2, 3],
      body: {
        items: [
          { name: "foo", price: 100 },
          { name: "bar", price: 100 }
        ]
      }
    }
  end

  shared_examples_for "400" do
    it "returns 400" do
      post "/recipes", params
      response.status.should == 400
    end
  end

  shared_examples_for "201" do
    it "creates a new recipe" do
      post "/recipes", params
      response.status.should == 201
    end
  end

  describe "POST /recipes" do
    context "without required param" do
      before do
        params.delete(:name)
      end
      include_examples "400"
    end

    context "with wrong string param" do
      before do
        params[:name] = ["x"]
      end
      include_examples "400"
    end

    context "with wrong integer param" do
      before do
        params[:type] = "x"
      end
      include_examples "400"
    end

    context "with exceptional interger param" do
      before do
        params[:number] = true
      end
      include_examples "400"
    end

    context "with wrong boolean param" do
      before do
        params[:flag] = "x"
      end
      include_examples "400"
    end

    context "with wrong array param" do
      before do
        params[:tags] = "x"
      end
      include_examples "400"
    end

    context "with wrong hash param" do
      before do
        params[:config] = "x"
      end
      include_examples "400"
    end

    context "with wrong float param" do
      before do
        params[:rate] = "-x"
      end
      include_examples "400"
    end

    context "with wrong file param" do
      before do
        params[:attachment] = "x"
      end
      include_examples "400"
    end

    context "with block failure" do
      before do
        params[:zip_code] = "123-456"
      end
      include_examples "400"
    end

    context "with invalid param to :only condition" do
      before do
        params[:type] = 4
      end
      include_examples "400"
    end

    context "with invalid param to :except condition" do
      before do
        params[:name] = "invalid"
      end
      include_examples "400"
    end

    context "without non-required param" do
      before do
        params.delete(:type)
      end
      include_examples "201"
    end

    context "with valid condition", :autodoc do
      include_examples "201"
    end

    context "with custom handler option" do
      before do
        params[:custom] = "invalid"
      end
      it "delegates to specified method" do
        post "/recipes", params
        response.status.should == 403
      end
    end

    context "with wrong nested params" do
      before do
        params[:nested][:number] = true
      end
      include_examples "400"
    end

    context "with wrong repeated params" do
      describe 'scalar' do
        before do
          params[:numbers] = 1
        end
        include_examples "400"
      end

      describe 'wrong type' do
        before do
          params[:numbers] = ["foo"]
        end
        include_examples "400"
      end
    end

    context "with complex params" do
      before do
        params[:body][:items] << { price: "xxx" }
      end
      include_examples "400"
    end
  end
end
