class VacationDestinationsController < ApplicationController
    before_action :get_vacation
    def new
        @vacation_destination = @vacation.vacation_destinations.build
        @destination = Destination.new
    end

    def create
        @destination = Destination.create(vacation_destination_params[:destinations])
        @vacation_destination = VacationDestination.new(date: vacation_destination_params[:date], vacation_id: params[:vacation_id], destination_id: @destination.id)
        if @vacation_destination.save
            flash[:success] = "Destination Created!"
            redirect_to @vacation
        else
            iterate_cumulative_errors
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def vacation_destination_params
        params.require(:vacation_destination).permit!
    end
    
    def get_vacation
        @vacation = Vacation.find(params[:vacation_id])
    end

    def iterate_cumulative_errors
        @total_errors = @vacation_destination.errors.full_messages
        @total_errors << @destination.errors.full_messages
        flash.now[:messages] = @total_errors[0].to_s
    end
end
