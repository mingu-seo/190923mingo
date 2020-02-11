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
	/*
		var naver_id_login = new naver_id_login("QI9nhKdLYdgGZ21jz2ay", "http://localhost:8080/goMain.do");	// Client ID, CallBack URL 삽입
										// 단 'localhost'가 포함된 CallBack URL
		var state = naver_id_login.getUniqState();
	
		naver_id_login.setButton("white", 2, 40);
		naver_id_login.setDomain("http://localhost:8080/loginForm.do");	//  URL
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	
		function loginWithNaver(){
			var url = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=QI9nhKdLYdgGZ21jz2ay&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FgoMain.do&state=272398599811248173130281399471286788127"; 
			var name =	"naverLogin"; 
			var option =	"width = 500, height = 500, top = 100, left = 200, location = no"
				window.open(url, name, option);
		}
	
		 Kakao.init('5056c3b1e52c786b89a189f847dbcbc7');
		    function loginWithKakao() {
		      // 로그인 창을 띄웁니다.
		      Kakao.Auth.login({
		        success: function(authObj) {
		          alert(JSON.stringify(authObj));
		        },
		        fail: function(err) {
		          alert(JSON.stringify(err));
		        }
		      });
		    };
		    */
		 Kakao.init('5056c3b1e52c786b89a189f847dbcbc7');
		 function loginWithKakao() {
			 Kakao.Auth.login({
			        success: function(authObj) {
			          //alert(JSON.stringify(authObj));
			          Kakao.API.request({
			              url: '/v2/user/me',
			              success: function(res) {
			                //alert(JSON.stringify(res));
			            	  console.log(JSON.stringify(res));
			            	  var j = res['properties'];
			            	  
			            	  // 로그인 ajax처리
			              },
			              fail: function(error) {
			                alert(JSON.stringify(error));
			              }
			            });
			        },
			        fail: function(err) {
			          alert(JSON.stringify(err));
			        }
			      });
		 }