class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
