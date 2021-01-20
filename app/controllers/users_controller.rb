class UsersController < ApplicationController

  #get request going to render out the user form
  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
      if @user == nil 
        render :new
      else 
        session[:user_id] = @user.id
        redirect_to movies_path 
      end 
  end 


  private 

  def user_params
    params.require(:user).permit(:username,:password)
  end 
end
