class ClothesSelectionController < ApplicationController

  def show
    @clothes = params[:dress]
  end

end
