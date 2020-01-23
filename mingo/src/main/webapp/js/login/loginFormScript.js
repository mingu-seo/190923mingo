/*작성자:최수진 */

	$(document).ready(function() {
      $('.loginbutton').click(function() {
    	  if ($("#email").val().trim() == "") {
    		  alert("이메일을 입력해 주세요");
    		  $("#email").focus();
    		  return false;
    	  }
    	  
    	  if ($("#password").val().trim() == "") {
    		  alert("비밀번호를 입력해 주세요");
    		  $("#password").focus();
    		  return false;
    	  }
    	  $("#login").submit();

      });

    });




	
	
	