$(document).ready(function() {

  $(".clicker").on("click", function(event){
    event.preventDefault();
    var $this = $(this);
    $(this).next().removeClass("hidden");
  })

  $('#comment-question').on('submit', function(event) {
    event.preventDefault();
    var comment_post = $(this).serialize();
    var url = $(this).attr('action')
    var ajaxRequest = $.ajax({
      url: url,
      type: 'post',
      data: comment_post
    });

    ajaxRequest.done(function(response){
      console.log($(this));
      $('.comments-wrapper').append(response)
      $('#comment-question textarea').val("")
      $('#comment-question').parent().addClass("hidden");

    });
  });

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
