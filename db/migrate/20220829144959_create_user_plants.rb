class CreateUserPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plants do |t|
      t.date :planted_day
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
