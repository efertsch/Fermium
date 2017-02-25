$(document).ready(function() {
  // $("#comment-form").hide();
  addQuestion();
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // ajaxifyComment();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


var addQuestion = function(){
  $("#new-question-link").on('click', function(event){
    event.preventDefault();
    
    $link = $(this);
    $link.hide();
    var url = $link.attr("href");

    $.ajax({
      url: url
    })

    .done(function(response){
      $("#home-page").append(response);
    })
    .fail(function(){
      alert("THAT SHIT'S BROKEN")
    });

  });
};





var ajaxifyComment = function(){
  $("#question-info").on('click', function(e){
    e.preventDefault()
    // $("form").show();
    $("#comment-button").hide();
    var the_method = 'post'
    var the_route = '/questions/:id/comments'

    $.ajax({
      method: the_method,
      route: the_route
    }).done(function(response){
      erb :'questions/comment'
    })
  })
}
