class UsersController < ApplicationController
  def new
    @user = User.new
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
  
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    if @user.update(username: params[:username], password: params[:password], email: params[:email])
      redirect to edit_user_path(@user)
    else
      render :edit
  end
  
  def user_params
  	params.require(:user).permit(:username, :email, :password)
  end
  
  def update_params
  	params.require(:user).permit(:username, :email, :password)
  end
 end
 end
