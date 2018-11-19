
function compareClothes(){
  var topColour = $('#tops-carousel .slick-current').attr('data-colour');
  var bottomColour = $('#bottoms-carousel .slick-current').attr('data-colour');
  $('#matcher-message').html(Colour.matcher(topColour, bottomColour));
}




document.addEventListener("turbolinks:load", function(){

  $('#tops-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){
    compareClothes();
  });

  $('#bottoms-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){
    compareClothes();
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
