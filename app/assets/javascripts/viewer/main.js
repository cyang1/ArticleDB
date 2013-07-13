function clearSelection() {
	if (window.getSelection) {
	  if (window.getSelection().empty) {  // Chrome
	    window.getSelection().empty();
	  } else if (window.getSelection().removeAllRanges) {  // Firefox
	    window.getSelection().removeAllRanges();
	  }
	} else if (document.selection) {  // IE?
	  document.selection.empty();
	}
}



$(document).ready(function() {

  $('#addCommentContainer').hide();

  $('#showAddCommentContainer').click(function() {
  	var selection = window.getSelection();
  	if (selection.type == "Range") {
      $('#addCommentContainer').show();
  		var start = $(selection.baseNode.parentElement);
  		var end = $(selection.extentNode.parentElement);
      var startOffset = selection.baseOffset;
      var endOffset = selection.extentOffset;
  		addMark(start, selection.baseOffset, end, selection.extentOffset, false);
  		clearSelection();
  	}
    $('#submitComment').click(function(e) {
        e.preventDefault();
        $.ajax({
          url: "/marks",
          data: {mark: {article_id:ARTICLE_ID, comment:$('textarea').val(), highlight_start_line:start.text(), highlight_start_offset:startOffset, highlight_end_line:end.text(), highlight_end_offset:endOffset}},
          type: "POST",
          dataType: "JSON"
        }).success(function(data){
          $('textarea').val("");
          $('#addCommentContainer').hide();
          console.log(data);
        }).error(function(error) {
          console.log(error);
        });

      
    });

    $(document).click(function (e) {
      if($("#addCommentContainer").is(":visible") && !$("#addCommentContainer").is(e.target) && !$(e.target).parents("#addCommentContainer").size()) {
          $("#addCommentContainer").fadeOut("fast");
          var iter = start;
          while (iter.text() != end.text()) {
            iter.html(iter.text());
            iter = iter.next();
          }
          end.html(end.text());
          $('textarea').val("");
      }
    });
    return false;
  });

});