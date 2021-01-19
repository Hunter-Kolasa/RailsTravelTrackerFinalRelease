class UsersController < ApplicationController

  #get request going to render out the user form
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to movies_path
    else 
      render :new
    end 
  end 


  private 

  def user_params
    params.require(:user).permit(:username,:password)
  end 
end
