class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
