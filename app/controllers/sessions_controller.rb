class SessionsController < ApplicationController

  def new

  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
      flash[:notice] = "Welcome back, #{user.email}!"
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You're signed out."
  end

end
