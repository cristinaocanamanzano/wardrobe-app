var Colour = (function(){
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
                ];
  return_match_message =  function(item1, item2) {
        for (var i = 0; i <= COLOUR_RULES.length; i+=1) {
          if (COLOUR_RULES[i].hasOwnProperty(item1)) {
              if (COLOUR_RULES[i][item1].includes(item2)){
                var positive_message = ["It's a colour match! Snaps, those colours are totally classic together...", "It's a colour match! Courageous fashion effort, those colours look great together.", "It's a colour match! Phat."]
                return positive_message[Math.floor(Math.random() * positive_message.length)]

        } else {
          var negative_message = ["No colour match. As If! Those colours are 'whatever' together...", "No colour match. Please, those colours are totally buggin' together. Try again.", "No colour match. At best it's a Monet", "No colour match. Totally toe up."]
          return negative_message[Math.floor(Math.random() * negative_message.length)]
        }
     }
   }
}

   return({
     matcher: return_match_message,
     rules: COLOUR_RULES
   })
})();
