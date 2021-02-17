class Destination < ApplicationRecord
    has_many :vacation_destinations
    has_many :vacations, through: :vacation_destinations
    validates_presence_of :city, :country, :message => 'Oops! Destinations require at least a city and country!' 
    
end
