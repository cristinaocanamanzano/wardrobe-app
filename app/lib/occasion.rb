class Occasion

  #OCCASION_RULES = [{"formal": "informal"}]

  def return_match_message_2(occasion_1, occasion_2)

    if occasion_1 == occasion_2
      return "These items are meant for the same occasion"
    else
      return "You have put a formal and an informal item together"
    end
  end

end
