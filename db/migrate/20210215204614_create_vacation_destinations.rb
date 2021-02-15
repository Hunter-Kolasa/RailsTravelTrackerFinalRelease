class CreateVacationDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacation_destinations do |t|
      t.belongs_to :vacation, null: false, foreign_key: true
      t.belongs_to :destination, null: false, foreign_key: true

      t.timestamps
    end
  end
end
