
// $( document ).ready(function() {
    //console.log( "ready!" );
// });




document.addEventListener("turbolinks:load", function(){

  $('#tops-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){

    var topColour = $('#tops-carousel .slick-current').attr('data-colour');
    var bottomColour = $('#bottoms-carousel .slick-current').attr('data-colour');
    // console.log($.get('items/' +$('#tops-carousel .slick-current').attr('id')))
    $('#matcher-message').html(Colour.matcher(topColour, bottomColour));


  });

  $('#bottoms-carousel').on('afterChange', function(event, slick, currentSlide, nextSlide){
    var topColour = $('#tops-carousel .slick-current').attr('data-colour');
    var bottomColour = $('#bottoms-carousel .slick-current').attr('data-colour');
    // console.log($.get('items/' +$('#tops-carousel .slick-current').attr('id')))
    $('#matcher-message').html(Colour.matcher(topColour, bottomColour));
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
