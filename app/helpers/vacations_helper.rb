module VacationsHelper
    def nice_date(raw_date)
        raw_date.strftime("%A, %B %e, %Y")
    end

    def update?
        !@vacation.id.nil?
    end

    def destinations?
        @vacation.destination_ids.any?
    end

    def vacation_destinations?
        @vacation.vacation_destinations.any?
    end

end
