class CreateVacations < ActiveRecord::Migration[6.0]
  def change
    create_table :vacations do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.belongs_to :user

      t.timestamps
    end
  end
end
