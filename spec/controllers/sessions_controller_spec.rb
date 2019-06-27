require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before(:each) do
    @user = User.create(username: 'username', password: 'password')
  end

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end

    it "redirects already logged in user" do
      session[:user_id] = @user.id
      get :login
      expect(response).to redirect_to(root_path)
    end
  end

end
