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

//   function doStuff() {
//    addMarks;
// }
// setInterval(doStuff, 1000);


  $('#addCommentContainer').hide();

  $('#showAddCommentContainer').click(function() {
  	var selection = window.getSelection();
  	var start;
    var end;
    var startOffset;
    var endOffset;

    if (selection.type == "Range") {
      $('#addCommentContainer').show();
  		start = $(selection.baseNode.parentElement);
  		end = $(selection.extentNode.parentElement);
      startOffset = selection.baseOffset;
      endOffset = selection.extentOffset;
  		addMark(start, selection.baseOffset, end, selection.extentOffset, "");
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
          addMark(start, startOffset, end, endOffset, FIRST_NAME, $('textarea').val());
          $('textarea').val("");
          $('#addCommentContainer').hide();
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