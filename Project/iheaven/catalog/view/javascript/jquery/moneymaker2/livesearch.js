var waitForFinalEvent = (function () {
	var timers = {};
	return function (callback, ms, uniqueId) {
		if (!uniqueId) {
			uniqueId = "uniqueIdLS";
		}
		if (timers[uniqueId]) {
			clearTimeout (timers[uniqueId]);
		}
		timers[uniqueId] = setTimeout(callback, ms);
	};
})();

function doLiveSearch( ev, keywords ) {
	waitForFinalEvent(function() {
		if (ev.keyCode == 38 || ev.keyCode == 40) {
			return false;
		}
		$('#livesearch_search_results').remove();
		updown = -1;
		if (keywords == '' || keywords.length < 3) {
			return false;
		}
		keywords = encodeURI(keywords);
		$.ajax({
			url: $('base').attr('href') + 'index.php?route=common/search/ajaxsearch&search=' + keywords,
			dataType: 'json',
			success: function (result) {
				if ((result.length > 0)&&($('#search').hasClass('open')||($('#search').hasClass('navbar-form')))) {
					if (result.length > 8) {
						var showMoreText = result[result.length - 1];
						result.pop();
					}
					var eList = document.createElement('ul');
					eList.id = 'livesearch_search_results';
					eList.className = 'dropdown-menu keep-open';
					eList.style.opacity = 0;
					var eListElem;
					var eLink;
					for (var i in result) {
						eListElem = document.createElement('li');
						eLink = document.createElement('a');
						eLink.className = 'clearfix';
						eImg = document.createElement('img');
						eImg.className = 'pull-left';
						eCode = document.createElement('span');
						eCode.className = 'pull-right';
						ePrice = document.createElement('p');
						ePrice.className = 'list-group-item-text';
						eHead = document.createElement('h4');
						eHead.className = 'list-group-item-heading';
						eHead.textContent = result[i].name;
						eCode.textContent = "#" + result[i].code;
						eImg.src = result[i].image;
						if (result[i].image.length > 0) {
							eLink.appendChild(eImg);
						}
						if (result[i].code.length > 0) {
							eLink.appendChild(eCode);
						}
						eLink.appendChild(eHead);
						if (result[i].price.length > 0) {
							if (result[i].special.length > 0) {
								ePriceOld = document.createElement('s');
								ePriceOld.textContent = result[i].price;
								ePrice.appendChild(ePriceOld);
								ePriceNew = document.createElement('b');
								ePriceNew.textContent = " " + result[i].special;
								ePrice.appendChild(ePriceNew);
							} else {
								ePrice.textContent = result[i].price;
							}
							eLink.appendChild(ePrice);
						}
						if (typeof(result[i].href) != 'undefined') {
							eLink.href = result[i].href;
						}
						else {
							eLink.href = $('base').attr('href') + 'index.php?route=product/product&product_id=' + result[i].product_id + '&search=' + keywords;
						}
						eListElem.appendChild(eLink);
						eList.appendChild(eListElem);
					}
					if (typeof(showMoreText) != 'undefined') {
						eListElem = document.createElement('li');
						eLink = document.createElement('a');
						eLink.className = 'clearfix';
						eHead = document.createElement('h4');
						eHead.className = 'list-group-item-heading text-primary text-center';
						eHead.textContent = showMoreText;
						eLink.appendChild(eHead);
						eLink.href = $('base').attr('href') + 'index.php?route=product/search&search=' + keywords;
						eListElem.appendChild(eLink);
						eList.appendChild(eListElem);
					}
					if ($('#livesearch_search_results').length > 0) {
						$('#livesearch_search_results').remove();
					}
					$('#search ul.keep-open').after(eList);
					function doFade() {
						eList.style.opacity = parseFloat(eList.style.opacity) + 0.05;
						if (parseFloat(eList.style.opacity) < 1) {
							setTimeout(doFade, 10);
						}
					}
					doFade();
				}
			}
		});
		return true;
	}, 500, "doLiveSearch");
}

function upDownEvent( ev ) {
	var elem = document.getElementById('livesearch_search_results');
	var fkey = $('#search').find('[name=search]').first();
	if( elem ) {
		var length = elem.childNodes.length - 1;
		if( updown != -1 && typeof(elem.childNodes[updown]) != 'undefined' ) {
			$(elem.childNodes[updown]).removeClass('list-group-item-info');
		}
		if( ev.keyCode == 38 ) {
			updown = ( updown > 0 ) ? --updown : updown;
		}
		else if( ev.keyCode == 40 ) {
			updown = ( updown < length ) ? ++updown : updown;
		}
		if( updown >= 0 && updown <= length ) {
			$(elem.childNodes[updown]).addClass('list-group-item-info');
			var text = elem.childNodes[updown].getElementsByTagName("h4")[0].text;
			if( typeof(text) == 'undefined' ) {
				text = elem.childNodes[updown].getElementsByTagName("h4")[0].innerText;
			}
			$('#search').find('[name=search]').first().val( new String(text).replace(/(\s\(.*?\))$/, '') );
		}
	}
	return false;
}
var updown = -1;
$(document).ready(function(){
	$('#search').find('[name=search]').first().keyup(function(ev){
		doLiveSearch(ev, this.value);
	}).focus(function(ev){
		doLiveSearch(ev, this.value);
	}).keydown(function(ev){
		upDownEvent( ev );
		}).blur(function(){
			$('#livesearch_search_results').velocity("fadeOut", { duration: 250 });
	});

	$(document).bind('keydown', function(ev) {
		try {
			if( ev.keyCode == 13 && $('.list-group-item-info').length > 0 ) {
				document.location.href = $('.list-group-item-info a').first().attr('href');
			}
		}
		catch(e) {}
	});
});