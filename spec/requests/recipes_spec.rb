require "spec_helper"

describe "Recipes" do
  let(:params) do
    {
      name: "name",
      type: 1,
      flag: true,
      config: {},
      tags: [],
    }
  end

  describe "POST /recipes" do
    context "without required param" do
      before do
        params.delete(:name)
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with wrong integer param" do
      before do
        params[:type] = "x"
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with wrong boolean param" do
      before do
        params[:flag] = "x"
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with wrong array param" do
      before do
        params[:tags] = "x"
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with wrong hash param" do
      before do
        params[:config] = "x"
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "without non-required param" do
      before do
        params.delete(:type)
      end

      it "creates a new recipe" do
        post "/recipes", params
        response.status.should == 201
      end
    end

    context "with invalid param to :only condition" do
      before do
        params[:type] = 0
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with invalid param to :except condition" do
      before do
        params[:name] = "invalid"
      end

      it "returns 400" do
        post "/recipes", params
        response.status.should == 400
      end
    end

    context "with valid condition", :autodoc do
      it "creates a new recipe" do
        post "/recipes", params
        response.status.should == 201
      end
    end
  end
end
