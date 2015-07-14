require 'rails_helper'

RSpec.describe Status, type: :model do
  before {
  	@user = create(:user)
  	@status = create(:status, user_id: @user.id)
  }

  it "is valid with a content" do
  	expect(@status).to be_valid
  end

  it { should validate_presence_of(:content) }
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:hashtags) }
  # it { should have_and_belong_to_many(:awards) }

end
