require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  before:each do
    @user = create(:user)
  end

  describe "GET #new" do
    describe "User hasn't loged in yet" do
      it "renders the :new template" do
        get :new, {:user_id => @user.id}
        expect(response).to redirect_to login_path
      end
    end

    describe "User has loged in" do
      before do
        set_user_session(@user)
      end

      it "renders the :new template" do
        get :new, {:user_id => @user.id}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #create" do
    describe "with valid params" do
      it "saves the new status in the database" do
        expect {
          post :create, {:user_id => @user.id, :status => attributes_for(:status)}    # include 2 hashtag
        }.to change(Status, :count).by(1)

        # verify adding hashtag
        expect(@user.statuses.last.hashtags.count).to eq 2
      end

      it "redirect to user profile - statuses page" do
        post :create, {:user_id => @user.id, :status => attributes_for(:status)}
        expect(response).to redirect_to user_statuses_path(@user)
      end
    end

    describe "with invalid prams" do
      it "assigns a newly created but unsaved status as @status" do
        expect{
          post :create, {:user_id => @user.id, :status => {content: ''}}
        }.to_not change(Status, :count)
      end

      it "re-renders the 'new' template" do
        post :create, {:user_id => @user.id, :status => {content: ''}}
        expect(response).to render_template("new")
      end
    end
  end
end
