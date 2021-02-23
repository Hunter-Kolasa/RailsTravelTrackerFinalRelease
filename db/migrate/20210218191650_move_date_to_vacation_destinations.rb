class MoveDateToVacationDestinations < ActiveRecord::Migration[6.0]
  def change
    remove_column :vacations, :date, :datetime
    add_column :vacation_destinations, :date, :datetime
  end
end
