require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "saves the new user in the database" do
        expect{
          post :create, {:user => attributes_for(:user)}
        }.to change(User, :count).by(1)
      end
      it "redirects to the user page" do
        post :create, {:user => attributes_for(:user)}
        expect(response).to redirect_to User.last
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        expect{
          post :create, {:user => attributes_for(:user_mismatch)}
        }.to_not change(User, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => attributes_for(:user_mismatch)}
        expect(response).to render_template("new")
      end
    end
  end
end
