class VacationDestination < ApplicationRecord
  belongs_to :vacation
  belongs_to :destination
  validates_presence_of :date
  accepts_nested_attributes_for :destination, reject_if: proc { |attributes| attributes['city'].blank? || attributes['country'].blank? }
end
