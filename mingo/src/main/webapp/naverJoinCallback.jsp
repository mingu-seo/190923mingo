<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%
	
	String clientId = "QI9nhKdLYdgGZ21jz2ay";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "VhI9eyo4Bc";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("YOUR_CALLBACK_URL", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	JSONObject obj = new JSONObject();
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		if(responseCode==200) {
			//out.println(res.toString());
			JSONParser parser = new JSONParser();
			obj = (JSONObject) parser.parse(res.toString());
			access_token = (String) obj.get("access_token");
		}
	} catch (Exception e) {
		out.println(e);
	}
	
	// 사용자 정보 조회
	String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
	try {
		String userUrl = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(userUrl);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", header);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if(responseCode==200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		//out.println(res.toString());
		JSONParser parser = new JSONParser();
		obj = (JSONObject) parser.parse(res.toString());
	} catch (Exception e) {
		System.out.println(e);
	}
	
		JSONObject resJson = (JSONObject) obj.get("response");
		%>
		
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	 function gogo() {
		$.ajax({
			url:"/emailCheck.do",
			data: {email:$("#email").val()},
			type: "post",
			success: function(data){
				if(data.trim() =="0"){
					frm.submit();
				}else {
					alert("이미 사용중인 이메일입니다.");
					window.close(); 
				}
			}
		});
	}
	</script>
	
<body onload="gogo();">
	<form  id="frm" name="frm" action="/naverJoinProcess.do">
	
	<input type ="hidden" value = "<%=(String)resJson.get("name")%>"  name ="nickname" id="nickname"><br/> <!-- 네이버에서 받은 이름을 db에 닉네임으로 저장 -->
	<input type ="hidden" value = "<%=(String)resJson.get("email")%>"  name ="email" id="email" ><br/>
	<%
	int gender=0;
	if(((String)resJson.get("gender")).equals("F")){
		gender = 1;

	}else {
		gender = 2;
	}
	%>
	<input type ="hidden" value = "<%=gender %>"  name ="gender" id="gender" ><br/>
	<input type ="hidden" value = "1" name="type" >
	
	</form>
</body>	