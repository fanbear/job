$(document).ready(function() {
	$('#xd_zvonok-form input').focus(function(){
		$(this).parent().removeClass('has-error');
	});
    $('#xd_zvonok-form').submit(function(event) {
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);
		if(!formValidation(event.target)){return false;}
		var action = $(this).attr('action');
		var sendingForm = $(this);
		var submit_btn = $(this).find('button[type=submit]');
		var value_text = $(submit_btn).text();
		var waiting_text = 'SENDING';
		$.ajax({
			type: "POST",
			url: action,
			data: $(event.target).serializeArray(),
			beforeSend:function(){
				$(submit_btn).prop( 'disabled', true );
				$(submit_btn).addClass('waiting').text(waiting_text);
			},
			success: function(msg,status){
				// console.log(msg);
				var success = true;
				$(sendingForm).trigger('reset');
				$(submit_btn).removeClass('waiting');
				$(submit_btn).text(value_text);
				$(submit_btn).prop( 'disabled', false );
				$('#xd_zvonok_modal').modal('hide');
				$('#xd_zvonok_modal').on('hidden.bs.modal', function (e) {
					if (success) {
						$('#xd_zvonok_success').modal('show');
						setTimeout(function(){
							console.log('success sending!');
							$('#xd_zvonok_success').modal('hide');
						}, 4000);
						success = false;
					}
				});
			},
			error: function(){
				$(submit_btn).prop( 'disabled', false );
				$(submit_btn).removeClass('waiting').text("ERROR");
				setTimeout(function(){
					$(submit_btn).delay( 3000 ).text(value_text);
				}, 3000);
			}
		});
		event.preventDefault();
    });
});
function formValidation(formElem){
	var elements = $(formElem).find('.required');
	var errorCounter = 0;
	
	$(elements).each(function(indx,elem){
		var placeholder = $(elem).attr('placeholder');
		if($.trim($(elem).val()) == '' || $(elem).val() == placeholder){
			$(elem).parent().addClass('has-error');
			errorCounter++;
		} else {
			$(elem).parent().removeClass('has-error');
		}
	});

	$(formElem).find('input[type=tel]').each(function() {
		var pattern = new RegExp(/^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$/);
		var data_pattern = $(this).attr('data-pattern');
		var data_placeholder = $(this).attr('placeholder');
		if (!pattern.test($(this).val()) || $.trim($(this).val()) == '' ) {
			$('input[name="phone"]').parent().addClass('has-error');
			errorCounter++;
		} else {
			$(this).parent().removeClass('has-error');
		}
	});
	
	if (errorCounter > 0) {
		return false;
	} else {
		return true;
	}
}