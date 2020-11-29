// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function(){
  $("#new_users_question").submit(function(){
    if(!$( "input[name*='users_question[users_questions_answers_attributes]']:checked").length) {
      display_message($('#not_submit_answer_id_message').val());
      return false;
    }
  });



  function hide_subs() {
    $('#new_users_question input.main_answer').each(function(){
      if(!$(this).prop('checked')) {
        $(this).parent().parent().find('.sub_question,.custom_answer').hide(); // find('input').prop('checked',false).parent().removeClass('checked');
      }
    });
  }

hide_subs();

var cookie=getCookie('login_id');

if(cookie) {
  $("#user_login_id").val(cookie);
  $("#remember_me").prop('checked',true);
}

/*
$("#sl_login_form").submit(function(){
  var loginID=$.trim($("#user_login_id").val());
  var password=$.trim($("#user_password").val());
  var token=$(this).find('input[name="authenticity_token"]').val();

  if(loginID=='') {
    display_message($("#message_no_email").val());
    return false;
  }

  if(password=='') {
    display_message($("#message_no_password").val());
    return false;
  }

  if($("#remember_me").is(":checked")) {
    setCookie('login_id',loginID);
  }
	});
*/
  $('#new_users_question input.main_answer').change(function(){
    hide_subs();

    if($(this).attr('type')=='radio') {
      $('#new_users_question input.main_answer').parent().removeClass('checked');
    } else {
      if($(this).hasClass('only')) {
        $('#new_users_question input.main_answer').parent().removeClass('checked');
        $('input').prop('checked',false);
        $(this).prop('checked',true)
        $(this).parent().addClass('checked');
      } else {
        $('input.only').prop('checked',false).parent().removeClass('checked');
        $(this).parent().addClass('checked');
      }
    }

    if($(this).prop('checked')) {
        $(this).parent().addClass('checked');

        if($(this).parent().parent().find('div.sub_question').length) {
          $(this).parent().parent().find('div.sub_question').slideDown().find('input:checked').parent().addClass('checked');
        }

        if($(this).parent().parent().find('div.custom_answer').length)
          $(this).parent().parent().find('div.custom_answer').slideDown();
    } else {
        $(this).parent().removeClass('checked');

        if($(this).parent().parent().find('div.sub_question').length)
          $(this).parent().parent().find('div.sub_question').slideUp();

        if($(this).parent().parent().find('div.custom_answer').length)
          $(this).parent().parent().find('div.custom_answer').slideUp();
    }
  });

  $('#new_users_question input:checked').parent().addClass('checked');

  $('#new_users_question .sub_question input[type="checkbox"],#new_users_question .sub_question input[type="radio"]').change(function(){
    $('#new_users_question .sub_question input').parent().removeClass('checked');

    if($(this).prop('checked')) {
        $(this).parent().addClass('checked');
    }
  });
});


function display_message(message,alert_type) {
	if(!alert_type)
		alert_type='danger';

  if($("#sl_message").length) {
    $("#sl_message").remove();
  }

  $(".sub_main").prepend('<div id="sl_message" class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><h4>'+$('#error_title_message').val()+'</h4><p></p></div>')

  $("#sl_message").removeAttr('class');
	$("#sl_message").addClass('alert').addClass('alert-'+alert_type).show();
	$("#sl_message p").empty();
	$("#sl_message p").text(message);
}


/**
 * 쿠키값 추출
 * @param cookieName 쿠키명
 */
function getCookie( cookieName )
{
 var search = cookieName + "=";
 var cookie = document.cookie;

 // 현재 쿠키가 존재할 경우
 if( cookie.length > 0 )
 {
  // 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
  startIndex = cookie.indexOf( cookieName );
  // 만약 존재한다면
  if( startIndex != -1 )
  {
   // 값을 얻어내기 위해 시작 인덱스 조절
   startIndex += cookieName.length;

   // 값을 얻어내기 위해 종료 인덱스 추출
   endIndex = cookie.indexOf( ";", startIndex );

   // 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
   if( endIndex == -1) endIndex = cookie.length;

   // 쿠키값을 추출하여 리턴
   return cookie.substring( startIndex + 1, endIndex ) ;
  }
  else
  {
   // 쿠키 내에 해당 쿠키가 존재하지 않을 경우
   return false;
  }
 }
 else
 {
  // 쿠키 자체가 없을 경우
  return false;
 }
}


/**
 * 쿠키 설정
 * @param cookieName 쿠키명
 * @param cookieValue 쿠키값
 * @param expireDay 쿠키 유효날짜
 */
function setCookie( cookieName, cookieValue, expireDate )
{
 var today = new Date();
 today.setDate( today.getDate() + parseInt( expireDate ) );
 document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString() + ";";
}


/**
 * 쿠키 삭제
 * @param cookieName 삭제할 쿠키명
*/
function deleteCookie( cookieName )
{
 var expireDate = new Date();

 //어제 날짜를 쿠키 소멸 날짜로 설정한다.
 expireDate.setDate( expireDate.getDate() - 1 );
 document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}
