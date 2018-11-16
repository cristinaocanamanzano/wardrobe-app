class Colour
  SELECTION = %w[navy green red yellow brown gold silver black purple pink light-blue].freeze

  COLOUR_RULES = [{"light-blue": ["black", "navy"]},
                  {"navy": ["red", "white", "gold","orange", "pink"]},
                  {"green": ["white", "brown", "purple", "black", "green"]},
                  {"red": ["white", "black", "navy"]},
                  {"yellow": ["purple", "black"]},
                  {"pink": ["navy", "green", "purple", "grey"]},
                  {"orange": ["black", "purple", "navy"]},
                  {"brown": ["white", "green", "black", "purple"]},
                  {"black": ["white", "black", "red", "orange", "gold", "silver", "light-blue"]},
                  {"white": ["red", "purple", "pink", "black"]},
                  {"purple": ["white", "brown", "green", "silver"]},
                  {"silver": ["purple", "black", "purple", "red", "pink"]},
                  {"gold": ["navy", "brown", "black"]}
                 ]



  def return_match_message(item1, item2)
    item1 = item1.to_sym
    color_rules = COLOUR_RULES
    color_rules.each do |hash|
      if hash.has_key?(item1)
        if hash[item1].include?(item2)
           return "Rollin' with the homies!"
        else
          return "Fashion victim alert!!"
        end
      end
    end
  end

end
