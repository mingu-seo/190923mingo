
//폼 전체 유효성, 공백 체크
	function findPwd_step1(){
		var emailChk = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		var birthdayChk = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		var phonenumChk = RegExp(/^[0-9]{11,11}$/); //숫자만11자리
		
		//이메일 공백 
		if($('#email').val().trim() == ""){
			alert('이메일을 입력해주세요.');
			$('#email').focus();
			return false;
		}
		//이메일 유효성 체크
		if(!emailChk.test($("#email").val())){ 
			alert("이메일을 형식에 맞게 입력해주세요") 
			$("#email").val(""); 
			$("#email").focus(); 
			return false;
		}
		//생일 공백 
		if($("#birthday").val().trim() == ""){
			alert("생년월일을 입력해 주세요.");
			$("#birthday").focus();
			return false;
		}
		//생일 유효성
		if(!birthdayChk.test($("#birthday").val())){ 
			alert("생년월일을 형식에 맞게 입력해주세요.") 
			$("#birthday").val(""); 
			$("#birthday").focus(); 
			return false;
		}
		//핸드폰번호 공백 
		if($("#phone_num").val().trim() == ""){
			alert("생년월일을 입력해 주세요.");
			$("#phone_num").focus();
			return false;
		}
		//핸드폰번호 유효성
		if(!phonenumChk.test($("#phone_num").val())){ 
			alert("생년월일을 형식에 맞게 입력해주세요.") 
			$("#phone_num").val(""); 
			$("#phone_num").focus(); 
			return false;
		}
		$("#findPwdForm").submit();
	}