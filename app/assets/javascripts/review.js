$(document).ready(function (){
  $("#submit").click(function(e) {
    e.preventDefault()
    console.log("hello")
    var review = $("#review").val();
    var title = $("#title").val();
    console.log(review)
    console.log(title)
    $.ajax({
      url: "/reviews",
      type: 'POST',
      data: {title: title, review: review, trailer_id: $(".trailer_id").attr('id') },

    success: function(data) {
      var data_title = "<p>" + data.title + "</p>";
      var data_review = "<p>" + data.review + "</p>";
      var data_created_at = "<p>" + data.created_at + "</p>";
      $('.trailer_id').append(data_title);
      $('.trailer_id').append(data_review);
      $('.trailer_id').append(data_created_at);
    }
  });
});

});
