class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    #(username: params[:username], password: params[:password], email: params[:email])
    #(user_params)
    if @user.save
      redirect_to new_users_path
    else
      render :new
    end
  end
  
  def user_params
  	params.require(:user).permit(:username, :email, :password)
  end
 end
