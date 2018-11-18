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
                  return 'match';

          }
        } else {
          return 'FASHION VICTIM';
        }
     }
   }
   return({
     matcher: return_match_message,
     rules: COLOUR_RULES
   })
})();
