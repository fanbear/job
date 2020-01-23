$(document).ready(function () {
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
	$(window).on("scroll", function() {
		waitForFinalEvent(function(){
			toggleScrollToTop();
		}, 100, "toggleScrollToTop");
	});
	function toggleScrollToTop() {
		if ($('.hidden-xs').is(":visible")) {
			if (($(window).scrollTop() > 200)&&(!$('.toggle-scroll-top').is(":visible"))) {
				$('.toggle-scroll-top').velocity("fadeIn", {duration: 250});
			} else if ($(window).scrollTop() < 200) {
				$('.toggle-scroll-top').velocity("fadeOut", {duration: 250});
			}
		}
	}
	$('.toggle-scroll-top').click(function(){
		$("html, body").velocity("scroll", { duration: 700, offset: '-110'})
		return false;
	});
});