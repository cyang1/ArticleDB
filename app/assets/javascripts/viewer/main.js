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

function addMarks() {
		var marks = [["sons to other brands. Finally, regret is specifically related to", 22, "that led to an unfortunate outcome", 4]];

	for (var i in marks) {
		var mark = marks[i];
		console.log(mark[0]);
		console.log(document.body);
		var start = $('*:contains("'+mark[0]+'")');
		console.log(start.last().text());
		
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
  		var iter = start;
  		var range = [];
  		while (iter.text() != end.text()) {
  			range.push(iter);
  			iter = iter.next();
  		}
  		range.push(end);
  		if (range.length == 1) { // same line
  			var div = range[0];
				var text = div.text();
				var firstUnhighlighted = text.substring(0, selection.baseOffset);
				var highlighted = text.substring(selection.baseOffset, selection.extentOffset);
				var lastUnhighlighted = text.substring(selection.extentOffset);
				div.html(firstUnhighlighted+'<span class="highlight">'+highlighted+'</span>'+lastUnhighlighted);
  		} else { // multi line
  			for (var i in range) {
  				var div = range[i];
  				if (div == start) {
  					var text = div.text();
  					var highlighted = text.substring(selection.baseOffset);
  					var unhighlighted = text.substring(0, selection.baseOffset);
  					div.html(unhighlighted+'<span class="highlight">'+highlighted+'</span>');
  				} else if (div == end) {
  					var text = div.text();
  					var highlighted = text.substring(0, selection.extentOffset);
  					var unhighlighted = text.substring(selection.extentOffset);
  					div.html('<span class="highlight">'+highlighted+'</span>'+unhighlighted);
  				} else {
  					div.wrapInner('<span class="highlight" />');
  				}
  			}
  		}
  		clearSelection();
  	}
  });

	addMarks();
	
});