class Vacation < ApplicationRecord
    belongs_to :user
    has_many :vacation_destinations
    has_many :destinations, through: :vacation_destinations
    accepts_nested_attributes_for :destinations

    validates :title, presence: true
    validates_associated :destinations
end
