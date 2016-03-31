$(document).ready(function() {
  $(".clicker").on("click", function(event){
    event.preventDefault();
    var $this = $(this);
    $(this).next().toggle();
  })

  $('.hideable').on('submit', '#comment-question', function(event) {
    event.preventDefault();
    var comment_post = $(this).serialize();
    var url = $(this).attr('action');
    var ajaxRequest = $.ajax({
      url: url,
      type: 'post',
      data: comment_post
    });

    ajaxRequest.done(function(response){
      $('.question-comments-wrapper').append(response);
      $('#comment-question textarea').val("");
      $('#comment-question').parent().toggle();

    });
  });

  $('.hideable').on('submit', '#comment-on-answer-form', function(event) {

    event.preventDefault();
    // console.log(event);
    var $this = $(this);
    comment_post = $this.serialize();
    var url = $this.attr("action");
    var ajaxRequest = $.ajax({
      url: url,
      type: 'post',
      data: comment_post
    });

    ajaxRequest.done(function(response){
      $('.answer-comments-wrapper').append(response);
      $('#comment-on-answer-form textarea').val("");
      $('#comment-on-answer-form').parent().toggle();

    });

  });

  $('#answer-question-form').on('submit', function(event) {

    event.preventDefault();
    // console.log(event);
    var $this = $(this);
    answer_post = $this.serialize();
    var url = $this.attr("action");
    var ajaxRequest = $.ajax({
      url: url,
      type: 'post',
      data: answer_post
    });

    ajaxRequest.done(function(response){
      $('.answers-wrapper').append(response);
      $('#answer-question-form textarea').val("");
      $('#answer-question-form').parent().toggle();

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
