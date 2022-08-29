class CreatePersonalTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_tasks do |t|
      t.text :description
      t.references :user_plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
