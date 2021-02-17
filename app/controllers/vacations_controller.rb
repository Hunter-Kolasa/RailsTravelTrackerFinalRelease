class VacationsController < ApplicationController
    before_action :logged_in_user
    before_action :get_vacation, except: [:new, :create]
    before_action only: [:edit, :update, :destroy] do
        authenticate
    end
    def new
        @vacation = Vacation.new
        @vacation.destinations.new
        
    end

    def create
        @vacation = @current_user.vacations.build(vacation_params)
        if @vacation.save
            flash[:success] = "Vacation Created!"
            redirect_to @vacation
        else
            render :new
        end
    end

    def show  
    end

    def edit  
    end

    def update
        update_vacation_destinations
        
        if @vacation.update(vacation_params)
            redirect_to @vacation
        else
            render :edit
        end 
    end

    private

    def vacation_params
        params.require(:vacation).permit(:title, :description, :date, :public, :destination_ids, destinations_attributes: [:id, :city, :state, :country])
    end

    def get_vacation
        @vacation = Vacation.find_by(id: params[:id])
    end

    

    def authenticate
        unless current_user?(@vacation.user)
          flash[:danger] = "This isn't yours!"
          render :show
        end
      end
end
