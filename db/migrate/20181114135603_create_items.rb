class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :colour
      t.string :image

      t.timestamps
    end
  end
end
