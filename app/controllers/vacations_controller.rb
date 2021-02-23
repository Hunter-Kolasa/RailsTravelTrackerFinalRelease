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
            flash.now[:messages] = @vacation.errors.full_messages[0]
            render :new
        end
    end

    def show  
    end

    def edit  
    end

    def update
        
        @vacation.destination_ids = @vacation.destination_ids.uniq
        if @vacation.update(vacation_params)
            redirect_to @vacation
        else
            flash.now[:messages] = @vacation.errors.full_messages[0]
            render :edit
        end 
    end

    def destroy
        @vacation.destinations.clear
        @vacation.destroy
        flash[:success] = "Vacation Deleted!"
        redirect_to current_user
    end

    private

    def vacation_params
        params.require(:vacation).permit(:title, :description)
    end

    def get_vacation
        @vacation = Vacation.find_by(id: params[:id])
    end

    # def update_destinations
    #     @vacation.destinations.each do |d|
    #         unless params[:vacation][:destination_ids].include?(d.id)
    #             @vacation.destinations.find_by(id: d.id).slice
    #         end
    #     end
        
    #     @vacation.destination_ids = @vacation.destination_ids.uniq
    # end

    def authenticate
        unless current_user?(@vacation.user)
          flash[:danger] = "This isn't yours!"
          render :show
        end
    end
end
