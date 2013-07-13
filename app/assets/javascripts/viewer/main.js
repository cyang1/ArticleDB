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
  $('#add_mark').click(function() {
  	var selection = window.getSelection();
  	if (selection.type == "Range") {
  		console.log(selection.baseNode);
  		console.log(selection.baseOffset);
  		console.log(selection.extentNode);
  		console.log(selection.extentOffset);
  		var start = $(selection.baseNode.parentElement);
  		var end = $(selection.extentNode.parentElement);
  		addMark(start, selection.baseOffset, end, selection.extentOffset, true);
  		clearSelection();
  	}
  });

});