class ApplicationController < ActionController::Base
    include SessionsHelper
    include UsersHelper
    include DestinationsHelper
    include VacationsHelper

end
