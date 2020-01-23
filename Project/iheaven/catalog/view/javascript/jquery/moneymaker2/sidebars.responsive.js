$(document).ready(function () {
	if ($('#column-left').length) {
		$('#column-left').removeClass('hidden-xs');
		$('.toggle-column-left .btn').click(function () {
			if (!$('#column-left').hasClass('active')) {
				$('body > .container > .row').css('left', "0");
				$('body > .container > .row').css('right', "inherit");
				$("body > .container > .row").velocity({
					left: "72%",
				}, 300);
				$('body>div.toggle-column-left .btn').css('opacity', "1");
				$("body>div.toggle-column-left .btn i").removeClass('fa-angle-down');
				$("body>div.toggle-column-left .btn i").addClass('fa-angle-up');
				if ($("#column-left").height() >= $("#content").height()) {
					$("#content").velocity({
						marginBottom: ($("#column-left").height() - $("#content").height()) + "px",
					}, 300);
				}
				$('#column-left').toggleClass('active');
				$('body>div.toggle-column-right').velocity("fadeOut", {duration: 300, mobileHA: false});
			} else {
				$("body > .container > .row").velocity({
					left: "0%",
				}, 300);
				$('body>div.toggle-column-left .btn').css('opacity', "0.85");
				$("body>div.toggle-column-left .btn i").removeClass('fa-angle-up');
				$("body>div.toggle-column-left .btn i").addClass('fa-angle-down');

				if ($("#column-left").height() >= $("#content").height()) {
					$("#content").velocity({
						marginBottom: "0px",
					}, 300);
				}
				$('#column-left').toggleClass('active');
				if ( $('#column-right').length ) {
					toggleRightColumn();
				}
			}

		});
	}
	if ($('#column-right').length) {
		$('#column-right').removeClass('hidden-xs');
		$('.toggle-column-right .btn').click(function () {
			if (!$('#column-right').hasClass('active')) {
				$('body > .container > .row').css('left', "inherit");
				$('body > .container > .row').css('right', "0");
				$("body > .container > .row").velocity({
					right: "72%",
				}, 300);
				$('body>div.toggle-column-right .btn').css('opacity', "1");
				$("body>div.toggle-column-right .btn i").removeClass('fa-angle-up');
				$("body>div.toggle-column-right .btn i").addClass('fa-angle-down');
				if ($("#column-right").height() >= $("#content").height()) {
					$("#content").velocity({
						marginBottom: ($("#column-right").height() - $("#content").height()) + "px",
					}, 300);
				}
				$('#column-right').toggleClass('active');
				$('body>div.toggle-column-left').velocity("fadeOut", {duration: 300, mobileHA: false});
			} else {
				$("body > .container > .row").velocity({
					right: "0%",
				}, 300);
				$('body>div.toggle-column-right .btn').css('opacity', "0.85");
				$("body>div.toggle-column-right .btn i").removeClass('fa-angle-down');
				$("body>div.toggle-column-right .btn i").addClass('fa-angle-up');

				if ($("#column-right").height() >= $("#content").height()) {
					$("#content").velocity({
						marginBottom: "0px",
					}, 300);
				}
				$('#column-right').toggleClass('active');
				if ( $('#column-left').length ) {
					toggleLeftColumn();
				}
			}
		});
	}
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
	if ($('#column-left').length || $('#column-right').length) {
		$(window).on("load resize scroll click", function() {
			if (!$('.hidden-xs').is(":visible") ) {
				if ($('#column-left').length) {
					waitForFinalEvent(function () {
						toggleLeftColumn();
					}, 300, "toggleLeftColumn");
				}
				if ($('#column-right').length) {
					waitForFinalEvent(function () {
						toggleRightColumn();
					}, 300, "toggleRightColumn");
				}
			}
		});
	}
	function toggleLeftColumn() {
		if (!$('#column-left').hasClass('active')&&(($(window).scrollTop()>($("#column-left").height()+$("#column-left").offset().top)-150)||(($(window).scrollTop()+$(window).height()-150)<$("#column-left").offset().top)))
			$('body>div.toggle-column-left').velocity("fadeOut", {duration: 300, mobileHA: false});
		else if (!$('body>div.toggle-column-left').is(":visible") && !$('#column-right').hasClass('active')) {
			$('body>div.toggle-column-left').removeClass('hidden-xs');
			$('body>div.toggle-column-left').velocity("fadeIn", {duration: 300, mobileHA: false});
		}
	}
	function toggleRightColumn() {
		if (!$('#column-right').hasClass('active')&&(($(window).scrollTop()>($("#column-right").height()+$("#column-right").offset().top)-150)||(($(window).scrollTop()+$(window).height()-150)<$("#column-right").offset().top)))
			$('body>div.toggle-column-right').velocity("fadeOut", {duration: 300, mobileHA: false});
		else if (!$('body>div.toggle-column-right').is(":visible") && !$('#column-left').hasClass('active')) {
			$('body>div.toggle-column-right').removeClass('hidden-xs');
			$('body>div.toggle-column-right').velocity("fadeIn", {duration: 300, mobileHA: false});
		}
	}
});