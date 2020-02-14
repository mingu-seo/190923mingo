<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
		<!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
		
    <!-- masonry -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

    <!-- imagesloaded-->
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>

    
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <script src="<%=request.getContextPath() %>/js/resultScript.js"></script>
    <style>
     
    	.nav-pills .my-link.active, .nav-pills .show>.my-link {
	    	color: #fff;
		    background-color: #6c757d;
		    border-radius:20px;
			}
			.my-link:focus, .my-link:hover {
    		text-decoration: none;
    		color:black;
    		background-color:#f1f1f1;
    		border-radius:20px;
			}
    </style>
    <script>
    	var sido_code = ${cafeCommand.sido_code};
    	var sigungu_code = ${cafeCommand.sigungu_code};
    	var dong_code = ${cafeCommand.dong_code};
    	var name = '${cafeCommand.name}';
    	
    	var page = ${cPageInfo.page};
    	var listCount = ${cPageInfo.listCount}
    	var maxPage = ${cPageInfo.maxPage};
	    
    </script>
</head>

<body>

  <!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
	<div class="container-fluid result-nav bg-white pb-0">
		<div class="container result-nav-wrapper p-1">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link my-link"
					data-toggle="pill" href="javascript:void(0);" onclick="listByFilter(1,this);">평점 순</a></li>
				<li class="nav-item"><a class="nav-link my-link" data-toggle="pill"
					href="javascript:void(0);" onclick="listByFilter(2,this);">리뷰 순</a></li>
				<li class="nav-item"><a class="nav-link my-link" data-toggle="pill"
					href="javascript:void(0);" onclick="listByFilter(3,this);">좋아요 순</a></li>
			</ul>
		</div>
	</div>
	<h5 style="margin-top:120px;" class='container'>검색결과 ${cPageInfo.listCount }건</h5>
	<!-- 본문 영역-->
    <div class="container grid clearfix p-0">
    	
        <c:forEach var="cafe" items="${cafeList }">
        	<div class="grid-item">
            <div class="cafe cafe-img">
            		<c:if test="${cafe.cafe_img != null}">
            			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='<%=request.getContextPath() %>/upload/cafe/${cafe.cafe_img}'></a>
            		</c:if>
                <c:if test="${cafe.cafe_img == null}">
            			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='https://placehold.it/200x200'></a>
            		</c:if>
            </div>
            <div class="cafe cafe-name ml-1 mt-2 mb-2" style="font-size:0.9em;"><a href="detailView.do?cafe_id=${cafe.cafe_id }">${cafe.name } ${cafe.branch }</a></div>
            <div class="cafe cafe-address mb-1">${cafe.cafe_address }</div>
            <div class="cafe cafe-score float-left" >평점 ${cafe.rate_avg }
            </div>
            <div class="cafe star-rating float-left mt-1 ml-2" >
            		<div style="width:${cafe.rate_avg * 20}%"></div>
            	</div>
            <div style="overflow:hidden;clear:both;">
	            <div class="cafe" style="float:left;clear:left;">리뷰 (${cafe.review_num } 개)</div>
	            <div class="cafe cafe-like float-right"><i
									class="fa fa-heart text-danger"
									style="font-size: 1em;"></i>&nbsp;${cafe.cafe_like}개
							</div>
						</div>
        	</div>
        </c:forEach>
    </div>
    <div class="d-flex justify-content-center align-items-center">
        <div id="test" ></div>
    </div>
    
    <div style="text-align: center;">
        <button class="btn btn-secondary" type="button" id="add" style="width:300px;">More...</button>
    </div>
    
    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>

</body>

</html>