module VacationsHelper
    def nice_date(raw_date)
        raw_date.strftime("%A, %B %e, %Y")
    end

    def update?
        !@vacation.id.nil?
    end

    def destinations?
        binding.pry
        @vacation.destination_ids.any?
    end

end
