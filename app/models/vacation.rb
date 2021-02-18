class Vacation < ApplicationRecord
    belongs_to :user
    has_many :vacation_destinations
    has_many :destinations, through: :vacation_destinations
    accepts_nested_attributes_for :destinations,  reject_if: proc { |attributes| attributes['city'].blank? || attributes['country'].blank? }

    validates_presence_of :title, :date
    validates_associated :destinations

    # scope :upcoming_vacations, -> { where("date > DateTime.now")}
end
