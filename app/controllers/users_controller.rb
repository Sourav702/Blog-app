class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(name: params[:name],
       email: params[:email], 
       password: params[:password], 
       password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User Successfully Created!"
      redirect_to posts_path
    else
      flash[:warning] = @user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end
end
