class ClothesSelectionController < ApplicationController

  def show
    url = request.original_url
    array_1 = url.split("?")
    items_string = array_1[1]
    @items_array = items_string.split("&")

  end

end
