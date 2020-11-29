//= require admin/application

$(document).ready(function(){
	$(".btn-maximize").click(function(){
		var i=$(this).find('i:first');
		if(i.hasClass('glyphicon-chevron-down')) {
			i.removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
			$(this).parent().parent().parent().find('.box-content').slideDown();
		} else {
			i.removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			$(this).parent().parent().parent().find('.box-content').slideUp();
		}
		return false;
	});

	$(".btn-close").click(function(){
		$(this).parent().parent().parent().remove();
		return false;
	});

	$('input.check_all').change(function(){
		if($(this).prop('checked')) {
			$('#users_table form input[type="checkbox"]').remove();
			$('#users_table tbody input[type="checkbox"]').prop('checked',true).change();
		} else {
			$('#users_table tbody input[type="checkbox"]').prop('checked',false).change();
		}
	});

	$('#users_table tbody input:checkbox').change(checked_check);

	function checked_check(){
		if($(this).prop('checked')) {
			$('#users_table tfoot form').append('<input type="hidden" name="user_ids[]" value="'+$(this).val()+'" />');
		} else {
			$('#users_table tfoot form input[value="'+$(this).val()+'"]').remove();
		}
	}

	$("#multi_delete_form").submit(function(){
			confirm_message=$('#users_table tbody td:last a:last').attr('data-confirm');

			if(!confirm(confirm_message))
				return false;
	});

	$('#users_table tbody input:checkbox').each(checked_check);

	$('input[name="date_p"]').change(function(){
		if($(this).val()=='false') {
   			$('input[name="start_date"]').val('');
   			$('input[name="end_date"]').val('');
		} else {
			setDateInput($(this).val());
		}
	});
});
