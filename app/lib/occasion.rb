class Occasion

  #OCCASION_RULES = [{"formal": "informal"}]

  def return_match_message_2(occasion_1, occasion_2)

    if occasion_1 == occasion_2
      return "Dope: These items are meant for the same occasion"
    else
      return "Bummer: You have put a formal and an informal item together"
    end
  end

end
