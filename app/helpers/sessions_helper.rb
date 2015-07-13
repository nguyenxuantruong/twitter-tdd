module SessionsHelper

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
  	puts "@current_user logged_in 444444", @current_user.inspect
    !@current_user.nil?
  end
end
