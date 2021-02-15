class VacationsController < ApplicationController
    before_action :current_user, only: [:create, :show]
    
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
        @vacation = Vacation.find_by(id: params[:id])
    end

    def edit
        @vacation = Vacation.find_by(id: params[:id])
    end

    def update
        @vacation = Vacation.find_by(id: params[:id])
        
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

    def destination_params
        @vacation.destination_ids.merge!
    end
end
