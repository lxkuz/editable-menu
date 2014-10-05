$(document).ready(function() {
	// placeholder on password
	$('.pswplh')
		.wrap('<div class="pswplh-wrap"></div>')
		.parent()
		.append('<span class="pswplh-text">'+$('.pswplh').attr('placeholder')+'</span>');
	$('.pswplh-text').on('click', function() {
		$(this).siblings('.pswplh').focus();
	});
	$('.pswplh').blur(function() {
        if(this.value=='') {
			$(this).siblings('.pswplh-text').show();
        } else {
			$(this).siblings('.pswplh-text').hide();
        }
	});
	$('.pswplh').focus(function() {
		$(this).siblings('.pswplh-text').hide();
	});
});
    