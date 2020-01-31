
//폼 전체 유효성, 공백 체크
	function findId_step1(){
		var nameChk = RegExp(/^[가-힣]{2,6}$/);  //2~6글자의 한글만
		var birthdayChk = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[1-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		var phonenumChk = RegExp(/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/); //숫자만11자리
	
		
		//이름 공백
		if($("#name").val().trim() == ""){
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return false;
		}
		//이름 유효성 검사
		if(!nameChk.test($("#name").val())){ 
			alert("이름을 형식에 맞게 입력해주세요.") 
			$("#name").val(""); 
			$("#name").focus(); 
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
			alert("핸드폰번호를 입력해 주세요.");
			$("#phone_num").focus();
			return false;
		}
		//핸드폰번호 유효성
		if(!phonenumChk.test($("#phone_num").val())){ 
			alert("핸드폰번호를 형식에 맞게 입력해주세요.") 
			$("#phone_num").val(""); 
			$("#phone_num").focus(); 
			return false;
		}
		$("#findId_step1").submit();
	}