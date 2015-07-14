require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  it { should have_and_belong_to_many(:statuses) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it "return statuses by hashtag" do
		f_status = create(:status)
		s_status = create(:status)
		hashtag = create(:hashtag)
		f_status.hashtags << hashtag
		s_status.hashtags << hashtag

		expect(Hashtag.statuses_by_hashtag(hashtag.name)).to eq [f_status, s_status]
  end
end


