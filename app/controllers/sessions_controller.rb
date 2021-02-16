class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

    def show
        @user = User.find_by(id: params[:id])
    end
  
    def destroy
        log_out
        redirect_to root_url
    end

    def google
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.password = SecureRandom.hex(10)
        user.first_name = auth["info"]["first_name"]
        user.last_name = auth["info"]["last_name"]
      end
      if @user && @user.id
        log_in @user
        redirect_to @user
      else
        redirect_to "/login"
      end
    end
  
    private

    def auth
      request.env['omniauth.auth']
    end

end