require 'rails_helper'

RSpec.feature "Status manager", :type => :feature do
	background do
		@status = attributes_for(:status)
		@user_attributes = attributes_for(:user)
		@user = User.create(@user_attributes)
	end

	scenario "post new status - user hasn't logged in" do
		visit user_statuses_path(@user)
		expect(page).to have_text("Listing Statuses")
		click_link 'New Status'

		# page redirect to login page
		expect(page).to have_text("You must be logged in before post a status")
	end

	scenario "post new status - user logged in" do
		log_in(@user)

		# login successfully
		expect(page).to have_text("Logged in !!!")
		expect(page).to have_text("Listing Statuses")
		click_link 'New Status'
		expect(page).to have_text("Content")
		find('#status_content').set(@status[:content])
		click_button 'Submit'

		# post status successfully
		expect(page).to have_text(@user_attributes[:email] + " said: ")
		expect(page).to have_text(@status[:content])
	end
end