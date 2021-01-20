class SessionsController < ApplicationController

    def signup
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to movies_path
    end

    def logout 
        session.clear
        redirect_to root_path
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end 
end 