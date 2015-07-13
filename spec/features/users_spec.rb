require 'rails_helper'

RSpec.feature "User manager", :type => :feature do
	background do
		@user_attributes = attributes_for(:user)
	end

	scenario "sign up - create new user" do
		visit root_path
		click_link 'Sign up now!'
		expect(page).to have_text("New User")
		find('#user_email').set(@user_attributes[:email])
		find('#user_password').set(@user_attributes[:password])
		find('#user_password_confirmation').set(@user_attributes[:password_confirmation])
		click_button 'Submit'
		expect(page).to have_text(@user_attributes[:email])
	end

	scenario "Login" do
		user = User.create(@user_attributes)
		visit root_path
		click_link "Log in"
		expect(page).to have_text("Log in")
		find('#session_email').set(@user_attributes[:email])
		find('#session_password').set(@user_attributes[:password])
		click_button 'Log in'
		expect(page).to have_text("Logged in !!!")
		expect(page).to have_text("Listing Statuses")
	end

	scenario "Logout" do
		user = User.create(@user_attributes)
		log_in(user)
		click_link "Logout"
		expect(page).to have_text("Logged out !!!")
	end
end