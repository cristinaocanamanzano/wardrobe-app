# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :combinations
  # belongs_to :combination
  mount_uploader :image, ImageUploader
end
