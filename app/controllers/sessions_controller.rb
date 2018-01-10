class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    #confirm that email/password combo is correct
    @user = User.confirm(user_params)
    if @user
      login(@user) # method in sessions helper
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  def destroy
    logout # method in sessions helper
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

end
