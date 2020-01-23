function getURLVar(key) {
	var value = [];

	var query = document.location.search.split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}
$(document).ajaxComplete(function() {
	$('.btn, .btn > span').click(function() {
		$(this).tooltip('hide');
	});
});
$(document).ready(function() {
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Search
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $('header #search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header #search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Search additional
	$('.input-group-search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $('.input-group-search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('.input-group-search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.input-group-search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	 // dropdown animation
	 var waitForFinalEvent = (function () {
			var timers = {};
			return function (callback, ms, uniqueId) {
				if (!uniqueId) {
					uniqueId = "uniqueId";
				}
				if (timers[uniqueId]) {
					clearTimeout (timers[uniqueId]);
				}
				timers[uniqueId] = setTimeout(callback, ms);
			};
		})();
		$(window).resize(function () {
			waitForFinalEvent(function(){
				animateDropdowns();
			}, 500, "animateDropdowns");
		});
		function animateDropdowns() {
			if ($('.hidden-xs').is(":visible")) {
				$('.dropdown').on('show.bs.dropdown', function (e) {
					if ($(this).parent().parent().parent().parent().hasClass('navbar-fixed-top')) {
						if ( $(this).find('.dropdown-menu').outerHeight() >= $(window ).height() ) {
							$(this).find('.dropdown-menu').css('max-height', ( $(window ).height() - $('#top').height() ));
						}
					}
					if (($('ul', this).length)&&(!$('ul:first', this).hasClass('opened'))) {
						var elm = $('ul:first', this);
						var elma = $('a:first', this);
						var off = elma.position();
						var l = off.left;
						var w = elm.width();
						elm.addClass('opened');
						var docW = $(".container").width();
						var isEntirelyVisible = (l + w <= docW);
						if (!isEntirelyVisible) {
							elm.addClass('pull-right');
						} else if (!elm.parent().hasClass('limit-btn-group')) {
							elm.removeClass('pull-right');
						}
					}
					if (!$(this).find('.dropdown-menu').first().is(":visible")) $(this).find('.dropdown-menu').first().velocity("stop").velocity("fadeIn", { duration: 300 });
				});
				$('.dropdown').on('hide.bs.dropdown', function (e) {
					e.preventDefault();
					$(this).find('.dropdown-menu').first().velocity("stop").velocity("fadeOut", { duration: 300, complete: function() { $(this).parent().removeClass('open'); } });
					$(this).find('.dropdown-menu').first().removeClass('opened');
				});
			} else {
				$('.dropdown').on('show.bs.dropdown', function (e) {
					if ($(this).find('.dropdown-menu').css('opacity')=='0') $(this).find('.dropdown-menu').css('opacity', '1');
					if ($(this).parent().parent().parent().parent().hasClass('navbar-fixed-top')) {
						$(this).find('.dropdown-menu').css('max-height', 'none');
					}
					$(".nav.navbar-nav > li ul").each(function() {
						$(this).removeClass('pull-right');
						$(this).removeClass('opened');
					});
					if (!$(this).find('.dropdown-menu').first().is(":visible")) $(this).find('.dropdown-menu').first().velocity("stop").velocity("fadeIn", { duration: 300 });
				});
				$('.dropdown').on('hide.bs.dropdown', function (e) {
					e.preventDefault();
					$(this).find('.dropdown-menu').first().velocity("stop").velocity("fadeOut", { duration: 300, complete: function() { $(this).parent().removeClass('open'); } });
					$(this).find('.dropdown-menu').first().removeClass('opened');
				});
			}
		}
		animateDropdowns();

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		$('#content .row.products > .product-grid').attr('class', 'product-layout product-list');

		$('#list-view').addClass('active');
		$('#grid-view').removeClass('active');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		var cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .row.products > .product-list').attr('class', 'product-layout product-grid');
		} else if (cols == 1) {
			$('#content .row.products > .product-list').attr('class', 'product-layout product-grid');
		} else {
			$('#content .row.products > .product-list').attr('class', 'product-layout product-grid');
		}
		$('#grid-view').addClass('active');
		$('#list-view').removeClass('active');

		localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');

		$('#list-view').addClass('active');
		$('#grid-view').removeClass('active');

		} else if (localStorage.getItem('display') == 'grid') {
		$('#grid-view').trigger('click');

		$('#grid-view').addClass('active');
		$('#list-view').removeClass('active');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

		// init tooltips
		$('[data-toggle="tooltip"]').tooltip({trigger: 'hover', container: 'body'});

	// tooltips for stickers
	$('.sticker [data-toggle=\'tooltip\']').tooltip({container: 'body'});

		// hide tooltip after click
		$('.btn, .btn > span').click(function() {
				$(this).tooltip('hide');
		});


		// don't fire tooltips on touch devices
		if(!('ontouchstart' in window)) {
			$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
			$(document).ajaxStop(function() {
				$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
			});
		}

		// disable dropdowns autoclose
		$(document).on('click', '.dropdown-menu, .dropdown-menu li', function (e) {
			$(this).hasClass('keep-open') && e.stopPropagation();
		});

		$("#cart button").click(function() {
			$("#cart > .dropdown-toggle").dropdown("toggle");
		});

		$('#infoModal').on('show.bs.modal', function (event) {
			var button = $(event.relatedTarget);
			var description = button.data('info-description');
			var title = button.data('info-title');
			var modal = $(this);
			modal.find('.modal-title').text(title);
			if (description) {
				modal.find('.modal-body').load('index.php?route=information/information/agree&information_id='+description);
			}
		})

});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						var moneymaker2_total_count = json['moneymaker2_total_count'];
						var moneymaker2_total_sum = json['moneymaker2_total_sum'];
						$('#cart > .dropdown-toggle #cart-total').html(moneymaker2_total_sum);
						$('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);
					}, 100);

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					$('#popupModal').find('.modal-body').load('index.php?route=common/cart/info ul', function() {
						$('#popupModal .modal-header .close').addClass('hidden');
						$('#popupModal .modal-body > ul').removeClass('dropdown-menu keep-open');
						$('#popupModal .modal-body > ul').addClass('list-unstyled');
						$('#popupModal .modal-footer .btn-shopping').removeClass('hidden');
						$('#popupModal .modal-footer .btn-back').addClass('hidden');
						$('#popupModal .modal-body .btn-primary').parent().parent().prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small>' + json['success'] + '</small></div></div>');
						$('#popupModal .modal-title').text(json['total']);
						$('#popupModal').modal();
					});

				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					var moneymaker2_total_count = json['moneymaker2_total_count'];
					var moneymaker2_total_sum = json['moneymaker2_total_sum'];
					$('#cart > .dropdown-toggle #cart-total').html(moneymaker2_total_sum);
					$('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					// if popup cart
					if ($('body').hasClass('modal-open')) {
						$('#popupModal').find('.modal-body ul').load('index.php?route=common/cart/info ul li', function() {
              $('#popupModal .modal-title').text(json['total']);
							$('#popupModal').modal();
						});
					}
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				//$('#cart > .dropdown-toggle').button('loading');
			},
			complete: function() {
				//$('#cart > .dropdown-toggle').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					var moneymaker2_total_count = json['moneymaker2_total_count'];
					$('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);
					$('#cart > .dropdown-toggle > span').load('index.php?route=common/cart/info .dropdown-toggle #cart-total');
				}, 100);

				//if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
				var now_location = String(document.location.pathname);
				if ((now_location == '/cart/') || (now_location == '/checkout/') || (getURLVar('route') == 'checkout/cart') || (getURLVar('route') == 'checkout/checkout')) {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					// if popup cart
					setTimeout(function () {
						if ($('body').hasClass('modal-open')) {
							$('#popupModal').find('.modal-body ul').load('index.php?route=common/cart/info ul li', function() {
								var moneymaker2_total_count = json['moneymaker2_total_count'];
								if (moneymaker2_total_count > 0) {
									$('#popupModal .modal-title').text(json['total']);
									$('#popupModal').modal();
								} else {
									$('#popupModal').find('.modal-title').load('index.php?route=common/cart/info #cart-total', function () {
										$('#popupModal').modal();
									});
								}
							});
						}
					}, 100);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					var moneymaker2_total_count = json['moneymaker2_total_count'];
					var moneymaker2_total_sum = json['moneymaker2_total_sum'];
					$('#cart > .dropdown-toggle #cart-total').html(moneymaker2_total_sum);
					$('#cart > .dropdown-toggle .fa-stack .fa-stack-1x, .navbar-cart-toggle .fa-stack .fa-stack-1x').html(moneymaker2_total_count);
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					// if popup cart
					setTimeout(function () {
						if ($('body').hasClass('modal-open')) {
							$('#popupModal').find('.modal-body ul').load('index.php?route=common/cart/info ul li', function() {
								$('#popupModal').find('.modal-title').load('index.php?route=common/cart/info #cart-total', function () {
									$('#popupModal').modal();
								});
							});
						}
					}, 100);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#popupModal .modal-body').empty();
					var title = $('#popupModal .modal-header > div.hidden').data('wishlist-title');
					var link = $('#popupModal .modal-header > div.hidden').data('wishlist-link');
					$('#popupModal .modal-header .close').removeClass('hidden');
					$('#popupModal .modal-title').text(title);
					$('#popupModal .modal-footer .btn-shopping').removeClass('hidden');
					$('#popupModal .modal-footer .btn-back').addClass('hidden');
					$('#popupModal .modal-body').prepend('<div class="buttons"><p class="text-center"><a href="' + link + '" class="btn btn-primary"><i class="fa fa-fw fa-heart"></i> ' + json['total'] + '</a></p></div>');
					$('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small>' + json['success'] + '</small></div></div>');
					$('#popupModal').modal();
				}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#compare-total').html(json['total']);
					// popup
					$('#popupModal .modal-body').empty();
					var title = $('#popupModal .modal-header > div.hidden').data('compare-title');
					var link = $('#popupModal .modal-header > div.hidden').data('compare-link');
					$('#popupModal .modal-header .close').removeClass('hidden');
					$('#popupModal .modal-title').text(title);
					$('#popupModal .modal-footer .btn-shopping').removeClass('hidden');
					$('#popupModal .modal-footer .btn-back').addClass('hidden');
					$('#popupModal .modal-body').prepend('<div class="buttons"><p class="text-center"><a href="' + link + '" class="btn btn-primary"><i class="fa fa-fw fa-area-chart"></i> ' + json['total'] + '</a></p></div>');
					$('#popupModal .modal-body').prepend('<div class="panel panel-info"><div class="panel-heading text-center"><small>' + json['success'] + '</small></div></div>');
					$('#popupModal').modal();
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			$.extend(this, option);

			$(this).attr('autocomplete', 'off');

			// Focus
			$(this).on('focus', function() {
				this.request();
			});

			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = $(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = $(this).position();

				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});

				$(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				$(this).siblings('ul.dropdown-menu').html(html);
			}

			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));

		});
	}
})(window.jQuery);
