# frozen_string_literal: true

class CreateColours < ActiveRecord::Migration[5.2]
  def change
    create_table :colours, &:timestamps
  end
end
