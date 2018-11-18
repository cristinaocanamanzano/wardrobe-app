
class ClothesSelectionController < ApplicationController

  def show
    @item_collection = []
    url = request.original_url
    array_1 = url.split("?")
    items_string = array_1[1]
    @items_array = items_string.split("&")

    @items_array.each do |item|
       array = item.split("=")
       id_number = array[1]
       @item_collection << garment = Item.find(id_number)
    end

    main_colour = @item_collection[0].colour
    secondary_colour = @item_collection[1].colour

    occasion_1 = @item_collection[0].clothes_occasion
    occasion_2 = @item_collection[1].clothes_occasion
    puts occasion_1
    puts occasion_2

    @message_2 = Occasion.new.return_match_message_2(occasion_1, occasion_2)


    @message = Colour.new.return_match_message(main_colour, secondary_colour)
  end
end
