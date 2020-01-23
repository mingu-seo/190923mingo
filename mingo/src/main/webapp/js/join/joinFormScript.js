/*작성자:최수진 */
	
	// 성별체크
	$(function() {
		$("li.gender_button").click(function() {
			$("li.gender_button").attr("aria-checked", "false");
			$(this).attr("aria-checked", "true");
		});
	});
	
	//성별체크시 여='1' 남='2'
	$(function(){
		$('.gbtn').click(function(){
			$("#gender").val($(this).index('.gbtn')+1);
		});
	});

	
	function joinForm(){
		/*var emailChk = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
*/
		
		//이메일 공백 
		if($('#email').val().trim() == ""){
			alert('이메일을 입력해주세요.');
			$('#email').focus();
			return false;
		}
//		//이메일 유효성 검사 
//		if(!emailChk.test($("#email").val())){ 
//			alert("이메일을 형식에 맞게 입력해주세요") 
//			$("#email").val(""); 
//			$("#email").focus(); 
//			return false; }

		
		var con = true;
		var data = $("#joinForm").serialize();
			console.log(data);
		$.ajax({
			url : "/emailCheck.do",
			data : {email:$("#email").val()},
			type : "POST",
			async : false,
			success : function(data) {
				
				if (data.trim() == "0") {
				} else {
					alert("중복된 아이디입니다.");
					$("#email").val("");
					$("#email").focus();
					con = false;
				}
			}
		});
		if (con == false) {
			return false;
		}
		if($("#password").val().trim() == ""){
			alert("비밀번호를 입력해 주세요.");
			$('#password').focus();
			return false;
		}
		
		if($("#password_confirm").val().trim() == ""){
			alert("비밀번호를다시한번 입력해 주세요.");
			$("#password_confirm").focus();
			return false;
		}
		if ($("#password").val().trim() != $("#password_confirm").val().trim()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#password_confirm").val("");
			$("#password_confirm").focus();
			return false;
		}
		if($("#name").val().trim() == ""){
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return false;
		}
		if($("#nickname").val().trim() == ""){
			alert("닉네임을 입력해 주세요.");
			$("#nickname").focus();
			return false;
		}
		if($("#birthday").val().trim() == ""){
			alert("생년월일을 입력해 주세요.");
			$("#birthday").focus();
			return false;
		}
		
		$("#joinForm").submit();
	}
	
	//이메일 중복체크
	$(function(){
		var emailChk = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

		$('.email-btn-check').click(function(){
			if($('#email').val().trim() == ""){
				alert('이메일을 입력해 주세요.');
			
			}if(!emailChk.test($("#email").val())){ 
					alert("이메일을 형식에 맞게 입력해주세요") 
					$("#email").val(""); 
					$("#email").focus(); 
					return false;

			}else{
				$.ajax({
					url:"/emailCheck.do",
					data: {email:$("#email").val()},
					type: "post",
					success: function(data){
						if(data.trim() =="0"){
							alert("사용가능한 이메일입니다.");
							/*$("#email").attr("readonly","readonly");*/
						}else {
							alert("이미 사용중인 이메일입니다.");
						}
					}
				});
			}
		});
	});
	
	//닉네임 중복체크
	$(function(){
		$('.nick-btn-check').click(function(){
			if($('#nickname').val().trim() == ""){
				alert('닉네임을 입력해 주세요.');
			}else{
				$.ajax({
					url:"/nicknameCheck.do",
					data: {nickname:$("#nickname").val()},
					type: "post",
					success: function(data){
						if(data.trim() =="0"){
							alert("사용가능한 닉네임입니다.");
						}else {
							alert("이미 사용중인 닉네임입니다.");
						}
					}
				});
			}
		});
	});
	
	//다시 작성 리셋
	$(function(){
	    $( "#returnbutton").click(function () {
	        $( "#joinForm" ).each(function () {
	            this.reset();
	        });
	    });
	});



