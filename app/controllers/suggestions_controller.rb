class SuggestionsController < ApplicationController
  def index
    @user = current_user
    items = current_user.items
    combinations = @user.combinations
    tops =  combinations.pluck(:item_1_id)
    bottoms =  combinations.pluck(:item_2_id)

    @computer_choice_top = tops.sample
    @computer_choice_bottom = bottoms.sample
    @top = items.find(@computer_choice_top)
    @bottom = items.find(@computer_choice_bottom)
  end
end
