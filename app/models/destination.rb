class Destination < ApplicationRecord
    has_many :vacation_destinations
    has_many :vacations, through: :vacation_destinations
end