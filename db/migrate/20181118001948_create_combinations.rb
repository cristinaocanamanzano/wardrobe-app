class CreateCombinations < ActiveRecord::Migration[5.2]
  def change
    create_table :combinations do |t|
      t.integer :item_1_id
      t.integer :item_2_id

      t.timestamps
    end
  end
end
