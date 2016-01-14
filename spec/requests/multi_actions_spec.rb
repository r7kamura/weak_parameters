require "spec_helper"

describe "MultiActions", type: :request do
  describe "GET /multi_actions" do
    it "should return 400" do
      get "/multi_actions"
      response.status.should == 400
    end
  end

  describe "POST /multi_actions" do
    it "should return 400" do
      post "/multi_actions"
      response.status.should == 400
    end
  end
end
