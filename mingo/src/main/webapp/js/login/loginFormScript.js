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
	
//	
//		 Kakao.init('5056c3b1e52c786b89a189f847dbcbc7');
//		    function loginWithKakao() {
//		      // 로그인 창을 띄웁니다.
//		      Kakao.Auth.login({
//		        success: function(authObj) {
//		          alert(JSON.stringify(authObj));
//		        },
//		        fail: function(err) {
//		          alert(JSON.stringify(err));
//		        }
//		      });
//		    };
		    
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
			            	  var j = res['kakao_account'];
			            	  console.log(j);
			            	  var name = j['profile']['nickname'];
			            	  var email = j['email'];
			            	  var gender = j['gender'];
			            	  var genderCode =0;
			            	  if (gender == "female"){
			            		  genderCode = 1;
			            	  } else {
			            		  genderCode = 2;
			            	  }
			            	  console.log(name);
			            	  console.log(email);
			            	  console.log(genderCode);
			            	  $.ajax({
			            		  url : '/emailCheck.do',
			            		  data : {
			            			  email : email
			            		  },
			            		  success : function(data) {
			            			  console.log(data);
			            			  if (Number(data.trim()) == 0) {
			            				  alert('회원가입을 해주세요.')
		 
			            			  }else {
						            	  $.ajax({
						            		  url : '/naverLoginProcess.do',
						            		  data : {
						            			  nickname : name,
						            			  email : email,
						            			  gender : genderCode
						       
						            		  },
						            		  success : function(data) {
						            			  alert("로그인 되었습니다.");
						            			  location.href="/goMain.do";
						            		  }
						            	  });
			            			  }
			            		  }
			            	  });
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