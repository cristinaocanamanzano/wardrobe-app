# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :combinations
  mount_uploader :image, ImageUploader
end
