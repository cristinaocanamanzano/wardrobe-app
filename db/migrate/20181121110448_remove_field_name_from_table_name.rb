class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.2]
  def change
    remove_column :table_names, :user_name, :string
  end
end
