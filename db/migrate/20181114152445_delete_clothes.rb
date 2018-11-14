class DeleteClothes < ActiveRecord::Migration[5.2]
  def change
    drop_table :clothes
  end
end
