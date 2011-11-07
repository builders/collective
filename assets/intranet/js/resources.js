// Quick Search

$('input#quicksearch-input').quicksearch('section.main article');
$('input#quicksearch-input').quicksearch('aside nav li');


// Suggestion lists
$('.tags > li').live('click', function() {
	var list = $(this.parentNode);
//	var input = $('.field-taglist input')[0];
	var input = list.prev().find('input')[0];
	var tag = this.className || $(this).text();
	
	input.focus();
	
	if (list.hasClass('singular')) {
		input.value = tag;
	} else if(list.hasClass('inline')) {
		var start = input.selectionStart;
		var end = input.selectionEnd;
		
		if(start >= 0) {
		  input.value = input.value.substring(0, start) + tag + input.value.substring(end, input.value.length);
		} else {
		  input.value += tag;
		}
		
		input.selectionStart = start + tag.length;
		input.selectionEnd = start + tag.length;
	} else {
		
		var exp = new RegExp('^' + tag + '$', 'i');
		var tags = input.value.split(/,\s*/);
		var removed = false;
		
		for (var index in tags) {
			if (tags[index].match(exp)) {
				tags.splice(index, 1);
				removed = true;
				
			} else if (tags[index] == '') {
				tags.splice(index, 1);
			}
		}
		
		if (!removed) tags.push(tag);
		
		input.value = tags.join(', ');
	}
});


// Ugly DOM maintenance
$('ul.tags > li').mousedown(silence);
function silence() { return false; }


// Upload fields
$('<em>' + 'Remove File' + '</em>').appendTo('label.file:has(a) span').click(function() {
	var s = $(this.parentNode),
	    d = '<input name="' + $(this).siblings('input').attr('name') + '" type="file">';

	setTimeout(function() { s.html(d); }, 50); // Delayed to avoid WebKit clickthrough bug
});
