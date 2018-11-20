// function createNewFavsCombination(topId, bottomId) {
//   $.ajax({
//       type: "POST",
//       url: "/combinations",
//       data: { combination: { item_1_id: topId, item_2_id: bottomId } },
//     })
// };
//
// $( "#save-favs-button" ).click(function() {
//   var topId = $('#tops-carousel .slick-current').attr('id');
//   var bottomId = $('#bottoms-carousel .slick-current').attr('id');
//   createNewFavsCombination(topId, bottomId)
//   console.log('hello!')
// });
document.addEventListener("turbolinks:load", function(){
   $( "#save-favs-button" ).on('click', function() {
     console.log('I am here');
   })
 })
