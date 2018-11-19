class Combination < ApplicationRecord
  belongs_to :item_1, :class_name => "Item"
  belongs_to :item_2, :class_name => "Item"
  belongs_to :user
  # has_many :combinations
end
