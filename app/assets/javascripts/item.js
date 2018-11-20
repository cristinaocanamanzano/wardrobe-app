
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
    return "Dope, These items are meant for the same occasion"
  } else {
    return "Bummer, You have put a formal and an informal item together"
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
