class DestinationsController < ApplicationController
    before_action :get_destination, only: [:show, :edit, :update]
    
    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            flash[:success] = "Destination Created!"
    
            redirect_to destination_path(@destination)
        else
            render :new
        end
    end

    def show
        @destination = Destination.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    private

    def get_destination
        @destination = Destination.find_by(params[:id])
    end

    def destination_params
        params.require(:destination).permit!
    end
end
