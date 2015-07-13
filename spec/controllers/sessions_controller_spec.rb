require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    describe "User has loged in" do
      before do
        @user = create(:user)
        post :create, :session => {:email => @user.email, :password => @user.password}
      end
      it "should redirect the user to the user url" do
        expect(response).to redirect_to user_url(@user)
      end
    end
    describe "User hasn't loged in yet" do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #create" do
    before do
      @user = create(:user)
      @session_attr = {:email => @user.email, :password => @user.password}
    end

  	it "should successfully create a session" do
      expect(session[:user_id]).to be_nil
      post :create, :session => @session_attr
      expect(session[:user_id]).to eq @user.id
    end

    it "should redirect the user to the user url" do
      post :create, :session => @session_attr
      expect(response).to redirect_to user_url(@user)
    end
  end

  describe "DELETE #destroy" do
    before do
      @user = create(:user)
      post :create, :session => {:email => @user.email, :password => @user.password}
    end

    it "should clear the session" do
      expect(session[:user_id]).to_not be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to the home page" do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
