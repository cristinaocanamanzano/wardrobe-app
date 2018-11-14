# frozen_string_literal: true

json.extract! item, :id, :colour, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
