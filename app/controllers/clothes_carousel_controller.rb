# frozen_string_literal: true

class ClothesCarouselController < ApplicationController
  def show
    @user = current_user
    @items = @user.items
    @tops = @items.select { |item| item.clothes_type == 'top' }
    @bottoms = @items.select { |item| item.clothes_type == 'bottom' }
  end
end
