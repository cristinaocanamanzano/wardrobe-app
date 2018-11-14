# frozen_string_literal: true

class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
end
