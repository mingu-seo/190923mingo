<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.BoardVO"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html lang="en">

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
function modifyboard() {
		//id가 smarteditor인 textarea에 에디터에서 대입
	    editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	    // 제목 공백시 경고창
	    if($('#title').val().trim() == ""){
			alert('제목을 입력해주세요.');
			$('#title').focus();
			return false;
		}
	    //수정 경고창
		if (confirm("수정하시겠습니까?")){
			modifyform.submit();	
		}
		
	}


</script>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="board-wrapper">
        <%@ include file="/WEB-INF/view/board/boardSideMenu.jsp" %>
        <form action="updateBoard.do" method="post" name="modifyform">
        
        <input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>" /> 
				<input type="hidden" name="page" value="<%=request.getParameter("page")%>" />
				<input type="hidden" name="type" value="${type }" />       
        <div class=" board-group shadow ml-4">
            <div class="mb-4 board-name">
	            <c:set var="btype" value="${type }"/>
	            <c:forEach items="${boardNames}" var="i" >
	            		<c:if test="${i.type == btype }">
	            			${i.name }
	            		</c:if>
	            </c:forEach>
               <span style="font-size: 0.5em;">수정하기</span>
            </div>
            
            <input type="text" class="form-control mb-3" name="title" id="title" value="<%=vo.getTitle()%>">
           
            <textarea id="smarteditor" class="mt-2 p-2" rows="20" name="contents" style="font-size:1em;width:100%;border:1px solid #e1e1e1;" ><%=vo.getContents()%></textarea>
           
            <div style="text-align: center;">
                <button type="button" class="btn btn-secondary"onclick="location.href='listBoard.do?type=${type}' ">취소</button>
                <button type="button" class="btn btn-secondary"onclick="javascript:modifyboard()">수정완료</button>
            </div>
        </div>
   		</form>
		</div>
    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>