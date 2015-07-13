module LoginMacros
	def log_in(user)
		visit root_path
		click_link "Log in"
		expect(page).to have_text("Log in")
		find('#session_email').set(user.email)
		find('#session_password').set(user.password)
		click_button 'Log in'
	end
end