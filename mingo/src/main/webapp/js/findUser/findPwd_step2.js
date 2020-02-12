
//폼 전체 유효성, 공백 체크
	function findPwd_step2(){
		
		var pwdChk = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //영문,숫자 혼합하여 6~20자리 이내
		
		//비밀번호 공백
		if($("#password").val().trim() == ""){
			alert("비밀번호를 입력해 주세요.");
			$('#password').focus();
			return false;
		}
		
		// 비밀번호 유효성체크
		if(!pwdChk.test($("#password").val())){ 
			alert("비밀번호를 형식에 맞게 입력해주세요.") 
			$("#password").val(""); 
			$("#password").focus(); 
			return false;
		}
	
		//비밀번호 일치 공백
		if($("#password_confirm").val().trim() == ""){
			alert("비밀번호를다시한번 입력해 주세요.");
			$("#password_confirm").focus();
			return false;
		}
		//비밀번호 일치여부 확인
		if ($("#password").val().trim() != $("#password_confirm").val().trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#password_confirm").val("");
			$("#password_confirm").focus();
			return false;
		}
		$("#findPwd_step2").submit();
	}
	 $(function() {
		    $("#password_confirm").keyup(function(e){
		    	if(e.keyCode == 13)  $(".finish_button").trigger("click");
		    });
	   	});