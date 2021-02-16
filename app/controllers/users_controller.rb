class UsersController < ApplicationController
    before_action :current_user, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Success! Welcome #{@user.first_name}!"
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation,
            vacation_attributes: [:title, :description, :date, :public, :destination_ids])
    end

    

end