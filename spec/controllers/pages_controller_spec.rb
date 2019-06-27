require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  before(:each) do
    @user = User.create(username: 'username', password: 'password')
  end

  describe "GET #home" do
    it "returns http success if logged in" do
      session[:user_id] = @user.id
      get :home
      expect(response).to have_http_status(:success)
    end

    it "redirects without logged in user" do
      get :home
      expect(response).to redirect_to(login_path)
    end
  end
end
