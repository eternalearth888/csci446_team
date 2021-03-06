class UserSessionsController < ApplicationController

	before_filter :require_login
	skip_before_filter :require_login, except: [:destroy]

  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:username], params[:password])
  		redirect_to(:foster, notice: 'Login successful')
  	else
  		flash.now[:alert] = "Login failed"
  		render action: "new"
  	end
  end

  def destroy
  	logout
  	redirect_to(:users, notice: 'Logged out!')
  end
end
