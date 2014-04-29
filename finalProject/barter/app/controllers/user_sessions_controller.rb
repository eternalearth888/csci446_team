class UserSessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:username], params[:password])
  		redirect_to(:mines_swapper, notice: 'Login successful')
  	else
  		flash.now[:alert] = "Login failed"
  		render action: "new"
  	end
  end

  def destroy
  	logout
  	redirect_to(:mines_swapper, notice: 'Logged out')
  end
end
