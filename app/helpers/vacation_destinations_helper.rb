module VacationDestinationsHelper
    def vacation_destinations?
        
        @vacation.vacation_destinations.ids.any?
    end
end