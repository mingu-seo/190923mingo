<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="vo.BoardVO" %>
<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 페이지 상단 또는 하단에 라이브러르 추가 -->
 <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 페이지 로딩시 초기화 --> 
<script> 
//전역변수선언
var editor_object = [];
$(function(){
    
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
            //사이트 나가시겠습니까 alert창 삭제
            fOnBeforeUnload : function(){},
        }
    });
     
    
})
function completeWriting(){
	
	//id가 smarteditor인 textarea에 에디터에서 대입
    editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
     
    // 제목 공백시 경고창
    if($('#title').val().trim() == ""){
		alert('제목을 입력해주세요.');
		$('#title').focus();
		return false;
	}
    //폼 submit
    $("#frm").submit();
}


</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="board-wrapper">
        <%@ include file="/WEB-INF/view/board/boardSideMenu.jsp" %>
    <form action="writeFormBoard.do?" id="frm" >
    	<input type="hidden" name="type" value="${type }">
        <div class=" board-group shadow ml-4">
            <div class="mb-4 board-name">
		            <c:if test="${type == 1 }">
		            	자유게시판
		            </c:if>
		            <c:if test="${type == 2 }">
		            	정보게시판
		            </c:if>
		            <c:if test="${type == 3 }">
		            	취업게시판
		            </c:if>
               <span style="font-size: 0.5em;">글쓰기</span>
            </div>
            
            	<input type="text" class="form-control mb-3" name="title" id="title" placeholder="제목을 입력해 주세요.">
            		<textarea  id="smarteditor" class="p-2" rows="20" name="contents" style="margin-top:50px;font-size:1em;width:100%;border:1px solid #e1e1e1;" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
            
            <div style="text-align: center;">
                <button type="button" class="btn btn-secondary"onclick="location.href='listBoard.do?type=${type}' ">취소</button>
                <button type="button" id="savebutton" class="btn btn-secondary" onclick="completeWriting();">작성완료</button>
            </div>
        </div>
        </form>
    </div>

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>