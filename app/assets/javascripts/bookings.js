// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
//
// var searchResults;
// function renderSearch(){
//   $('body').on('click','.search-button',function(event) {
//     console.log('search was clicked');
//
//     event.preventDefault();
//     $.ajax({
//       url: homepage,
//       data: {
//         format: 'json'
//       },
//       success: function(data) {
//         searchResults = data;
//         console.log(data);
//         $('.render-search-results')
//           .empty()
//           .append(renderResultsString);
//         // $('.render-search-results').empty().append(data);
//       }
//     });
//   });
//   console.log(searchResults);
//   return searchResults;
// };
//
// $(document).on('page:load ready',renderSearch());
