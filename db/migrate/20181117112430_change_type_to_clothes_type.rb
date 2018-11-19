# frozen_string_literal: true

class ChangeTypeToClothesType < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :type, :clothes_type
  end
end
