function init_toc() {
	var toc = document.getElementById('toc');
	var content = document.getElementById('content');
	var hx = content.getElementsByTagName('*');
	var hx_len = hx.length;
	var anchor, tag, the_text;

	for (var i = 0, j = hx_len; i < j; i++) {
		tag = hx[i].tagName.toLowerCase();

		if (tag === 'h2' || tag === 'h3' || tag === 'h4' || tag === 'h5') {
			the_text = $.trim(hx[i].innerHTML);
			anchor = '_' + the_text.replace(/\s+|\-/g, '_').replace(/[^A-Z0-9_]/gi, '').replace(/_+/g, '_').toLowerCase();

			hx[i].id = anchor;
			hx[i].innerHTML += '<a href="#' + anchor + '" class="anchor-link" title="Permalink"></a>';
			toc.innerHTML += '<li class="' + tag + '"><a href="#' + anchor + '">' + the_text + '</a></li>';
		}
	}

	toc.style.display = 'block';
}

function init_show_more() {
	if (!$('a.show_more').length) {
		return;
	}

	$('a.show_more').click(function() {
		var div = $(this).parents('table:first').next('div');

		if (div.is(':hidden')) {
			div.slideDown('fast');
			$(this).text('Hide example');
		}
		else {
			div.slideUp('fast');
			$(this).text('View example');
		}

		this.blur();
		return false;
	});
}

function init_contents() {
	init_toc();
	init_show_more();
}