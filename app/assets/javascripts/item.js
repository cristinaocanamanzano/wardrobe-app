
function compareClothes(){
  var topColour = $('#tops-carousel .slick-current').attr('data-colour');
  var bottomColour = $('#bottoms-carousel .slick-current').attr('data-colour');
  $('#matcher-message').html(Colour.matcher(topColour, bottomColour));
}

function compareOccasion(){
  var topOccasion = $('#tops-carousel .slick-current').attr('data-occasion');
  var bottomOccasion = $('#bottoms-carousel .slick-current').attr('data-occasion');
  $('#occasion-message').html(isMatchOccasion(topOccasion, bottomOccasion));
}

function isMatchOccasion(top, bottom){
  if (top === bottom) {
    var positive_message = ["Occasion match! Dope, these items are meant for the same occasion", "Occasion match! Classic" , "Occasion match! Check it, it's the bomb."]
     return positive_message[Math.floor(Math.random() * positive_message.length)]
  } else {
    var negative_message = ["No occasion match. Bummer, You have put a formal and an informal item together", "No occasion match. Fashion Victim."]
    return negative_message[Math.floor(Math.random() * negative_message.length)]
  }

}


document.addEventListener("turbolinks:load", function(){

  $('#tops-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){
    compareClothes();
    compareOccasion();
  });

  $('#bottoms-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){
    compareClothes();
    compareOccasion();
  });


$('.slider').slick({
    arrows: true,
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    focusOnSelect: true,
    accessability: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1
        }
      }
    ]
  });
});
