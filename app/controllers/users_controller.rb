class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  #get request going to render out the user form
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username:params[:username])
      if !@user
        @error = "I'm sorry, that username is incorrect"
        render :new
      elsif !user.authenticate(params[:password])
        @error =  "Password was Incorrect"
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
