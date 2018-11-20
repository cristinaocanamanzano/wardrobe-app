class CombinationsController < ApplicationController
  def index
    @user = current_user
    @combinations = current_user.combinations
    @items = current_user.items
  end

  def create
   @user = current_user
   @combination = @user.combinations.create(combination_params)
   redirect_to items_url
  end

  def destroy
    @combination = Combination.find(params[:id])
    @combination.destroy
    redirect_to combinations_url, notice: 'Your combination has been deleted'
  end

  private

  def combination_params
    params.require(:combination).permit(:item_1_id, :item_2_id)
  end
end
