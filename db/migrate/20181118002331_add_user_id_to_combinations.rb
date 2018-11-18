class AddUserIdToCombinations < ActiveRecord::Migration[5.2]
  def change
    add_column :combinations, :user_id, :integer
  end
end
