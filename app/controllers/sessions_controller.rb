class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(username: params[:username]).first   
    if @user && @user.authenticate(params[:password])     
      session[:user_id] = @user.id     
      flash[:notice] = "Welcome back, #{@user.username}"
      redirect_to @user
    else     
      flash[:alert] = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
  	@user = current_user
	if @user
    flash[:notice] = "Come back again soon!"
		session[:user_id] = nil
    redirect_to root_path
	end
  end


end
