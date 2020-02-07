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

	/*$(document).ready(function() {
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "{QI9nhKdLYdgGZ21jz2ay}",
			callbackUrl: "{/goMain.do}",
			isPopup: true,  팝업을 통한 연동처리 여부 
			loginButton: {color: "green", type: 3, height: 60}  로그인 버튼의 타입을 지정 
		}
	);
	
    설정정보를 초기화하고 연동을 준비 
	naverLogin.init();
*/
	
		var naver_id_login = new naver_id_login("QI9nhKdLYdgGZ21jz2ay", "http://localhost:8080/goMain.do");	// Client ID, CallBack URL 삽입
										// 단 'localhost'가 포함된 CallBack URL
		var state = naver_id_login.getUniqState();
	
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8080/loginForm.do");	//  URL
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();

	
	
	