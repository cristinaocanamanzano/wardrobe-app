class AddOccasionToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :clothes_occasion, :string
  end
end
