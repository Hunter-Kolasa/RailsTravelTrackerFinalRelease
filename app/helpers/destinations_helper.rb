module DestinationsHelper
    

    def city_state_country(destination)
        destination.city + ", " + destination.state + " " + destination.country
    end
end
