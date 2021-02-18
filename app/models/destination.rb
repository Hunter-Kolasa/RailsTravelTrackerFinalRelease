class Destination < ApplicationRecord
    has_many :vacation_destinations
    has_many :vacations, through: :vacation_destinations
    validates_presence_of :city, :country

    scope :recent_destinations, -> {order("updated_at DESC").limit(10) }
end
