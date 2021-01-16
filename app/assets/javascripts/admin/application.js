$(document).ready(function(){
	$('#myModal').on('show.bs.modal', function (e) {
  		if (!data) return e.preventDefault(); // stops modal from being shown

		if($(this).attr('title')) {
			$('#myModal .modal-header h3').text($(this).attr('title'));
		} else {
			$('#myModal .modal-header h3').text('사용자정보');
		}
	});


	if($('ul.current').parent().find('a.dropmenu span:last').hasClass('glyphicon-chevron-down'))
		$('ul.current').parent().find('a.dropmenu span:last').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');

	$(".sl_search_form ul li a").click(function(){
		var search_type=$.uri.setUri($(this).attr('href')).param("search_type");
		$('.sl_search_form select[name="search_type"]').val(search_type).change();
		$(".sl_search_form:first button:first").html($(this).text()+' &nbsp; <span class="caret"></span>').parent().removeClass('open');
		$('.sl_search_form input[name="search_value"]').focus();
		//$("#sl_search_form ul.dropdown-menu").hide();
		return false;
	});

	$(".search_type").change(function(){
		var search_type_text=$('.sl_search_form ul li a:contains("'+$(this).find('option[value="'+$(this).val()+'"]').text()+'")').text();
		$("#sl_search_form:first button:first").html(search_type_text+' &nbsp; <span class="caret"></span>').parent().removeClass('open');
	//	$(".search_type").val($(this).val());
		$(this).parent().parent().find('input[type="search"]:first').focus();
	});

	//$('.export_form').submit(function(){
	//	setTimeout(function(){$('.export_form input[type="submit"]').removeAttr('disabled')}, 30);
	//});
});


 function setDateInput(obj) {
  if (obj != undefined) {
   var datediff = -(parseInt(obj));
   var newDate = new Date();
   var now = new Date();
   newDate.setDate(now.getDate()+datediff);
   var newYear = newDate.getFullYear();
   var newMonth = newDate.getMonth()+1;
   if (newMonth.toString().length == 1) newMonth = "0" + newMonth;

   endMonth=now.getMonth() +1;
   if (endMonth.toString().length == 1) endMonth = "0" + endMonth;

   var newDay = newDate.getDate();
   if (newDay.toString().length == 1) newDay = "0" + newDay;
   var txtSDate = newMonth + "/" + newDay +'/'+newYear;
   endDay=now.getDate();
   if (endDay.length == 1) endDay = "0" + endDay;
   var txtEDate = endMonth + "/" + endDay + '/' + now.getFullYear();
   $('input[name="start_date"]').val(txtSDate);
   $('input[name="end_date"]').val(txtEDate);
  } else {alert("잠시 후 이용해 주시기 바랍니다."); return false;}
 }
