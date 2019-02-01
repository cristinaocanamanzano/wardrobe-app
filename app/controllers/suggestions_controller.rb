class SuggestionsController < ApplicationController
  def index
    @user = current_user
    items = current_user.items
    combinations = @user.combinations
    random_combination = combinations.sample
    if random_combination
      @top_id = random_combination.item_1_id
      @bottom_id = random_combination.item_2_id
      @top = items.find(@top_id)
      @bottom = items.find(@bottom_id)
    end
  end
end
