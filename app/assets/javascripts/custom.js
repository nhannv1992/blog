$(function() {

  function genComment(author, message) {
    var html = '';
    html = '<div class="comment"><span class="author">'+author+' : <span class="message">'+message+'</span></span></div>'
    return html;
  }

  $("#comment-form").on("click","#btnSend", function() {
    var is_logged = $("#comment-form").attr("data-userlogged");
    if(is_logged == "true") {



      //ajax post add comment to server

      var url = $(this).attr("data-url");

      $("#comment-f").validate({
        submitHandler : function() {

          var post_id = $(this).attr("data-postid"),
          message = $("#txtMessage").val(),
          userEmail = $("#txtEmail").val(),
          user_id = $("#txtId").val();

          //get comment infos
          var comment = {
            post_id : "post_id",
            user_id : user_id,
            message : message
          }

          $.ajax({
            type:"POST",
            data : comment,
            url : url,
            success : function(data) {
              if(data.status == 'true') {
                $("#comment-list .list").prepend(genComment(userEmail, message));
              }
            }
          })
        }
      });

    } else {
      alert("You must login to post comment");
    }

  })

  $("#new_post").validate();



})