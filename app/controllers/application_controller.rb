class ApplicationController < ActionController::Base
    # All controllers have access to all helpers
    include SessionsHelper
    include UsersHelper
    include DestinationsHelper
    include VacationsHelper
end
