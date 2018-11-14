class CreateColours < ActiveRecord::Migration[5.2]
  def change
    create_table :colours do |t|

      t.timestamps
    end
  end
end
