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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/rankStyle.css">
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="r-wrapper1">
        <div class="r-filter">
            <div class="r-filter-header">
                <span class="r-filter-header-name">시</span>
                <span class="r-filter-header-name">군</span>
                <span class="r-filter-header-name">구</span>
                <span class="r-filter-header-name">브랜드</span>
                <span class="r-filter-header-name">기타</span>
            </div>
            <div class="r-filter-option">
                <ul class="list-group list-group-flush r-filter-a">
                    <li class="list-group-item">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="customRadio" name="example1" value="customEx">
                            <label class="custom-control-label" for="customRadio">Custom radio</label>
                          </div>
                          
                    </li>
                    <li class="list-group-item">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="customRadio" name="example1" value="customEx">
                            <label class="custom-control-label" for="customRadio">Custom radio</label>
                          </div>
                          
                    </li>
                    <li class="list-group-item">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="customRadio" name="example1" value="customEx">
                            <label class="custom-control-label" for="customRadio">Custom radio</label>
                          </div>
                          
                    </li>
                    <li class="list-group-item">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" id="customRadio" name="example1" value="customEx">
                            <label class="custom-control-label" for="customRadio">Custom radio</label>
                          </div>
                          
                    </li>
                  </ul>
                  <ul class="list-group list-group-flush r-filter-b">
                    <li class="list-group-item">First item</li>
                    <li class="list-group-item">Second item</li>
                    <li class="list-group-item">Third item</li>
                  </ul>
                  <ul class="list-group list-group-flush r-filter-c">
                    <li class="list-group-item">First item</li>
                    <li class="list-group-item">Second item</li>
                    <li class="list-group-item">Third item</li>
                  </ul>
                  <ul class="list-group list-group-flush r-filter-d">
                    <li class="list-group-item">First item</li>
                    <li class="list-group-item">Second item</li>
                    <li class="list-group-item">Third item</li>
                  </ul>
                  <ul class="list-group list-group-flush r-filter-e">
                    <li class="list-group-item">First item</li>
                    <li class="list-group-item">Second item</li>
                    <li class="list-group-item">Third item</li>
                  </ul>
                  
            </div>
        </div>
    </div>
        <div class="r-content">
            <table class="table table-bordered table-hover table-strip" >
                <thead>
                  <tr>
                    <th> # </th>
                    <th>사진</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>브랜드</th>
                    <th>평점</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><img src="./img/cafe.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td><img src="./img/cafe2.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td><img src="./img/cafe3.jpg" style="width:100px;"></td>
                    <td>스타벅스 자양3점</td>
                    <td>서울시 광진구 자양4동 123-12</td>
                    <td>스타벅스</td>
                    <td>3.9</td>
                  </tr>
                  
                </tbody>
              </table>
        </div>



    

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>