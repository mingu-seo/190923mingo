<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="board-wrapper">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-file-text-o ml-2 " style="font-size:2em;">&nbsp;&nbsp;게시판</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">자유게시판</a>
            <a href="#" class="list-group-item">정보게시판</a>
            <a href="#" class="list-group-item">취업게시판</a>

        </div>
        <div class=" board-group shadow ml-4">
            <div class="mb-4 board-name">
               자유게시판
            </div>
            <div class="board-title p-2">
                안녕하세요?
            </div>
            <div class="board-title-info  p-2" style="overflow:hidden;">
                <div class="float-left">홍길동</div>
                <div class="float-right">조회 17 | 추천 | 2020.01.03 13:12</div>
            </div>
            <div class="p-3"> Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis quidem numquam aut, ea debitis aperiam neque. Praesentium nulla a, quia autem blanditiis, ducimus, harum fugiat quis voluptatibus qui et porro dolore itaque numquam iure quibusdam esse! Quae possimus maiores esse nostrum. Aliquid molestiae maiores unde voluptates dolor. Optio corrupti quis aut est maxime totam cum necessitatibus delectus, corporis facere non iusto facilis consectetur, minus inventore officiis exercitationem quas ducimus, libero cumque perferendis voluptatem. Culpa vel dolorem, reiciendis alias velit commodi dolore aperiam eius doloribus? Et, natus dolores, iste sapiente vel distinctio facilis earum illum minus, quos eos error minima illo?</div>
            <div class="mybtn-group">
                <button type="button" class="btn btn-secondary float-left">목록보기</button>
                <button type="button" class="btn float-right mybtn-good"><i class="fa fa-thumbs-o-down" style="font-size:1.5em;">1</i></button>
                <button type="button" class="btn float-right mybtn-bad"><i class="fa fa-thumbs-o-up" style="font-size:1.5em;">0</i></button>
                
            </div>
            <div class="pb-3" style="border-bottom: 1px solid #a1a1a1;">
                <i class="fa fa-comment-o mr-2" style="font-size:1.5em;"></i>댓글 3개
            </div>
            <div class="reply">
                <div class="reply-name">홍길동</div>
                <div class="reply-content">반갑습니다1</div>
                <div class="reply-date">2020.01.03 13:20</div>
                <button type="button" class="btn btn-secondary ">답글</button>
            </div>
            <div class="reply pl-5">
                <span class="clamp"></span>
                <div class="reply-name">김길동</div>
                <div class="reply-name" style="color:red;">@홍길동</div>
                <div class="reply-content">re:반갑습니다2</div>
                <div>2020.01.03 13:22</div>
                <button type="button" class="btn btn-secondary ">삭제</button>
            </div>
            <div class="reply  mb-5">
                <div class="reply-name">김길동</div>
                <div class="reply-content">반갑습니다2</div>
                <div class="reply-date">2020.01.03 13:22</div>
                <button type="button" class="btn btn-secondary ">답글</button>
            </div>
            <div class="reply-form p-3">
                <div class="reply-name">홍동우</div>
                <textarea class="mt-2" rows="4"  style="font-size:0.9em;width:100%;border:1px solid #e1e1e1;" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
                <div><button type="button" class="btn btn-secondary">등록</button></div>
            </div>
        </div>
    </div>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>