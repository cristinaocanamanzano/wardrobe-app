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
      # image_tag(garment.image_url.to_s, width: 300)
    end

     main_colour = @item_collection[0].colour
     secondary_colour = @item_collection[1].colour

     @message = return_match_message(main_colour, secondary_colour)
  end

  def return_match_message(item1, item2)
    color_rules = {"blue": ["red", "white", "gold","orange"]}
    item1 = item1.to_sym
    if color_rules.has_key?(item1)
      if color_rules[item1].include?(item2)
        message = "You go girl!"
      else
        message = "Fashion victim alert!!"
      end
    end
  end

end
