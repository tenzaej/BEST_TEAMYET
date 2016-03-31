$(document).ready(function() {

  $(".clicker").on("click", function(event){
    event.preventDefault();
    $(".comment").toggle()
  })

  $(".au").on("click", function(event){
    event.preventDefault()
    $(this).addClass("red-arrow-up")
    $(this).removeClass("arrow-up")

    var url = $(this).attr("href")
    var ajaxRequest = $.ajax({
      type: "GET",
      url: url
    })
    ajaxRequest.done(function(response){
      var votes = $.parseJSON(response)
      $(".vote-count").text(votes.vote_count)
    })
  });

   $(".ad").on("click", function(event){
    event.preventDefault()
    $(this).addClass("red-arrow-down")
    $(this).removeClass("arrow-down")
    var url = $(this).attr("href")
    var ajaxRequest = $.ajax({
      type: "GET",
      url: url
    })
    ajaxRequest.done(function(response){
      var votes = $.parseJSON(response)
      $(".vote-count").text(votes.vote_count)
    })
  })
});
