/*작성자:최수진 */
	//폼 전체 유효성, 공백 체크
	function modifyFormFn(){
		var nameChk = RegExp(/^[가-힣]{2,6}$/);  //2~6글자의 한글만
		var birthdayChk = RegExp(/^(19|20)[0-9]{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		var nicknameChk = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/); // 한글과 영어, 숫자만 사용 2~10자
		
		
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
		
		//닉네임 공백 
		if($("#nickname").val().trim() == ""){
			alert("닉네임을 입력해 주세요.");
			$("#nickname").focus();
			return false;
		}
		if(!nicknameChk.test($("#nickname").val())){ 
			alert("닉네임을 형식에 맞게 입력해주세요.") 
			$("#nickname").val(""); 
			$("#nickname").focus(); 
			return false;
		}
		
		var con = true;
		$.ajax({
			url : "/nicknameCheck.do",
			data : {nickname:$("#nickname").val()},
			type : "POST",
			async : false,
			success : function(data) {
				
				if (data.trim() == "0") {
				} else {
					alert("중복된 닉네임입니다.");
					$("#nickname").val("");
					$("#nickname").focus();
					con = false;
				}
			}
		});
		if (con == false) {
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
		
		
		//phone_num 유효성
		if(!birthdayChk.test($("#birthday").val())){ 
			alert("생년월일을 형식에 맞게 입력해주세요.") 
			$("#birthday").val(""); 
			$("#birthday").focus(); 
			return false;
		}
	}
			
	//닉네임 중복체크,유효성체크
	$(function(){
		var nicknameChk = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
		$('.nick-btn-check').click(function(){
			if($('#nickname').val().trim() == ""){
				alert('닉네임을 입력해 주세요.');
				return false;
			}if ($("#nickname").val().length <= 1) {
					alert("닉네임을 2글자이상 입력해주세요.");
					return false;
					
			}if(!nicknameChk.test($("#nickname").val())){ 
				alert("닉네임을 형식에 맞게 입력해주세요.") 
				$("#nickname").val(""); 
				$("#nickname").focus(); 
				return false;

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
							$("#nickname").val(""); 
							$("#nickname").focus();
							return false;
						}
					}
				});
			}
		});
	});
	//주소 찾기 버튼
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                $("#sample4_postcode").attr('readonly','readonly');
                $("#sample4_jibunAddress").attr('readonly','readonly');
            }
        }).open();
    }

	

