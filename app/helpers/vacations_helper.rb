module VacationsHelper
    def current_vacation
        @vacation ||= @current_user.vacations.find_by(id: params[:id])
    end
    def nice_date(raw_date)
        raw_date.strftime("%A, %B %e, %Y")
    end
    def remove_destination(destination_id, vacation_id)
    end


end
