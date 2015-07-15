require 'rails_helper'

RSpec.feature "Search", :type => :feature do
	background do
		REGEX_TAG = /(?:\s|^)(?:#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$)))(\w+)(?=\s|$)/i
		@user = create(:user)
		@status = create(:status)
		@user.statuses << @status
		@tags = (@status.content.scan REGEX_TAG).join(" ").split(' ')
		@tags.each do |tag|
			Hashtag.create(:name => tag)
		end
	end

	scenario "Search status by hahstag" do
		# verify result
		@tags.each do |tag|
			visit user_statuses_path(@user)
			click_link("#" + tag)
			expect(page).to have_text("Listing Statuses by #" + tag)
		end
	end
end