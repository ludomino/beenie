class AddColumnAdviceToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :advice, :text
  end
end
