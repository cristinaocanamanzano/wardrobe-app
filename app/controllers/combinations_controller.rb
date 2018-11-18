class CombinationsController < ApplicationController
  def create
   @user = current_user
   @combination = @user.combinations.create(combination_params)
   redirect_to items_url
  end

  private

  def combination_params
    params.require(:combination).permit(:item_1_id, :item_2_id)
  end
end
