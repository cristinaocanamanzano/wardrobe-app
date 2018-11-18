# frozen_string_literal: true

class Colour
  SELECTION = %w[navy green red yellow brown gold silver black purple pink light-blue].freeze

  COLOUR_RULES = [{ "light-blue": %w[black navy] },
                  { "navy": %w[red white gold orange pink] },
                  { "green": %w[white brown purple black green] },
                  { "red": %w[white black navy] },
                  { "yellow": %w[purple black] },
                  { "pink": %w[navy green purple grey] },
                  { "orange": %w[black purple navy] },
                  { "brown": %w[white green black purple] },
                  { "black": ['white', 'black', 'red', 'orange', 'gold', 'silver', 'light-blue'] },
                  { "white": %w[red purple pink black] },
                  { "purple": %w[white brown green silver] },
                  { "silver": %w[purple black purple red pink] },
                  { "gold": %w[navy brown black] }].freeze

  ITEM_TYPE =  %w[top bottom].freeze

  def return_match_message(item1, item2)
    item1 = item1.to_sym
    color_rules = COLOUR_RULES
    color_rules.each do |hash|
      if hash.key?(item1)
        if hash[item1].include?(item2)
          return "Rollin' with the homies!"
        else
          return 'Fashion victim alert!!'
        end
      end
    end
  end
end
