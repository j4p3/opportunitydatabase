require 'spec_helper'

describe SessionsController do

  describe "GET 'create'" do
    let(:fake_user) do
      o = Object.new
      o.stub(:id).and_return(1)
      o
    end
    it "returns http success" do
      User.should_receive(:from_omniauth).and_return(fake_user)
      get 'create'
      response.should redirect_to root_url
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should redirect_to root_url
    end
  end

end
