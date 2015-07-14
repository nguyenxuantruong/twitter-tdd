class StatusesController < ApplicationController
  include StatusesHelper

	before_action :require_login, only: [:new]

  def new
  	@user = User.find(params[:user_id])
  	@status = Status.new(:user => @user)
  end

  # POST /users/:user_id/status
  def create
    @status = Status.new(status_params)
    @status.user_id = params[:user_id]
    respond_to do |format|
      if @status.save
        # add hashtag into @post
        add_hashtag(@status, status_params[:content])
      	flash[:success] = "Status was successfully created."
        format.html { redirect_to user_statuses_path }
      else
        format.html { render :new }
      end
    end
  end

  def index
  	@user = User.find(params[:user_id])
  	@statuses = @user.statuses
  end

  private
  def status_params
  	params.require(:status).permit(:content)
  end

  def require_login
  	if current_user.nil?
  		redirect_to login_path, :flash => { :danger => "You must be logged in before post a status" }
  	end
  end
end
