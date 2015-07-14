require 'rails_helper'

RSpec.describe SearchsController, type: :controller do

  describe "GET #search_by_hashtag" do
    it "returns http success" do
      get :search_by_hashtag
      expect(response).to have_http_status(:success)
    end
  end

end
