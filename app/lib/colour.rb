class Colour
  SELECTION = %w[blue green red yellow brown gold silver black purple pink].freeze

  COLOUR_RULES = {"blue": ["red", "white", "gold","orange"]}


    def return_match_message(item1, item2)
      item1 = item1.to_sym
      color_rules = Colour::COLOUR_RULES
      if color_rules.has_key?(item1)
        if color_rules[item1].include?(item2)
          message = "Rollin' with the homies!"
        else
          message = "Fashion victim alert!!"
        end
      end
    end
end
