class SessionsController < ApplicationController
  def new
  	if current_user
      redirect_to current_user
    end
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Logged in !!!'
      session[:user_id] = user.id
      redirect_to user_statuses_path(user)
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
    flash[:success] = "Logged out !!!"
    redirect_to root_url
  end
end
