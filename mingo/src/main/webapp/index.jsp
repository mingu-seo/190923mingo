<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>




    <!--스와이퍼 관련 파일 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <script src="https://unpkg.com/swiper/js/swiper.js"></script>
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

    <!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>



    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="/mingo/css/styleByHong.css">
    <script src="/mingo/js/scriptByHong.js"></script>
</head>

<body>

    <div class="container-fluid fixed-top bg-dark" style="opacity: 0.9;">
        <div class="container">
            <nav class="navbar navbar-expand-sm navbar-dark">
                <a class="navbar-brand" href="#"><i class="fa fa-coffee"
                        style="font-size:1.5em;font-weight:bold;">&nbsp;Mingo</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">카페</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">랭킹/통계</a>
                        </li>


                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">로그인</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <header class="jumbotron jumbotron-fluid text-center bg-cover m-0">
        <div class="container search-area">
            <form class="form pl-4 pr-4">
                <div class="form-row">
                    <div class="col-sm-10">
                        <div class="form-row">
                            <div class="col-4 pb-1 pt-1"><select class="form-control rounded-edge">
                                    <option>서울시</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>경기도</option>
                                    <option>인천</option>
                                </select></div>
                            <div class="col-4 pb-1 pt-1"><select class="form-control rounded-edge">
                                    <option>광진구</option>
                                    <option>금천구</option>
                                </select></div>
                            <div class="col-4 pb-1 pt-1"><select class="form-control rounded-edge">
                                    <option>자양4동</option>
                                    <option>노유동</option>
                                </select></div>


                        </div>
                        <div class="form-row">
                            <div class="col-12 pb-1 pt-1"><input type="text" class="form-control rounded-edge"></div>
                        </div>
                    </div>
                    <div class="col-sm-2 pb-1 pt-1">
                        <input type="submit" value="검색" class="form-control rounded-edge" style="height: 100%;">
                    </div>
                </div>
            </form>
        </div>

    </header>

    <div class="container-fluid bg-light">
        <div class="container bg-light">
            <div class="row">
                <div class="col-lg-7 mb-5 bg-light mt-4 ">
                    <div class="container rank-header shadow-sm">
                        <h1 class="mt-2">종합순위</h1>

                    </div>
                    <div class="container rank-filter pt-1 pb-1 shadow-sm">
                        <button type="button" class="btn btn-secondary">별점순</button>
                        <button type="button" class="btn btn-secondary">리뷰순</button>
                        <button type="button" class="btn btn-secondary">브랜드순</button>
                    </div>
                    <div class="list-group list-group-flush rank-contents shadow-sm">

                        <a href="#" class="list-group-item p-1">
                            <div class="rank-num rounded-lg">1</div>
                            <div class="rank-img rounded-circle"><img src="http://placehold.it/80x80"></div>
                            <div class="rank-info">
                                <div class="rank-name">밍고카페</div>
                                <div class="float-right ml-3" style="font-size: 0.8em; margin-top:3px;">(133개)</div>
                                <div class="rank-score">8.3</div><br>
                                <div class="rank-address">서울시 광진구 자양3동</div>
                                <div class="rank-star">★★★★☆</div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item p-1">
                            <div class="rank-num rounded-lg">2</div>
                            <div class="rank-img rounded-circle"><img src="http://placehold.it/80x80"></div>
                            <div class="rank-info">
                                <div class="rank-name">밍고카페</div>
                                <div class="float-right ml-3" style="font-size: 0.8em; margin-top:3px;">(133개)</div>
                                <div class="rank-score">8.3</div><br>
                                <div class="rank-address">서울시 광진구 자양3동</div>
                                <div class="rank-star">★★★★☆</div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item p-1">
                            <div class="rank-num rounded-lg">3</div>
                            <div class="rank-img rounded-circle"><img src="http://placehold.it/80x80"></div>
                            <div class="rank-info">
                                <div class="rank-name">밍고카페</div>
                                <div class="float-right ml-3" style="font-size: 0.8em; margin-top:3px;">(133개)</div>
                                <div class="rank-score">8.3</div><br>
                                <div class="rank-address">서울시 광진구 자양3동</div>
                                <div class="rank-star">★★★★☆</div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item p-1">
                            <div class="rank-num rounded-lg">4</div>
                            <div class="rank-img rounded-circle"><img src="http://placehold.it/80x80"></div>
                            <div class="rank-info">
                                <div class="rank-name">밍고카페</div>
                                <div class="float-right ml-3" style="font-size: 0.8em; margin-top:3px;">(133개)</div>
                                <div class="rank-score">8.3</div><br>
                                <div class="rank-address">서울시 광진구 자양3동</div>
                                <div class="rank-star">★★★★☆</div>
                            </div>
                        </a>
                        <a href="#" class="list-group-item p-1">
                            <div class="rank-num rounded-lg">5</div>
                            <div class="rank-img rounded-circle"><img src="http://placehold.it/80x80"></div>
                            <div class="rank-info">
                                <div class="rank-name">밍고카페</div>
                                <div class="float-right ml-3" style="font-size: 0.8em; margin-top:3px;">(133개)</div>
                                <div class="rank-score">8.3</div><br>
                                <div class="rank-address">서울시 광진구 자양3동</div>
                                <div class="rank-star">★★★★☆</div>
                            </div>
                        </a>

                    </div>
                </div>
                <div class="col-lg-5 bg-success mb-5 mt-4 latest-review shadow-sm">
                    <div class="row review-header p-3">
                        <img src="./img/profile.png" class="rounded-circle">
                        <div>홍길동님</div>
                        <div>홍길동님</div>
                        <div>홍길동님</div>
                        <div>홍길동님</div>
                        <div>홍길동님</div>

                    </div>
                    <div class="row bg-warning review-img">
                        <img src="http://placehold.it/200x200">
                    </div>
                    <div class="row bg-success review-content">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti magnam eum earum, doloribus,
                        delectus odio sit ipsam maiores tenetur possimus iusto officia illo, tempora repudiandae qui
                        quis dolorum deserunt. Nesciunt est dolorem magni ab dolorum exercitationem repudiandae commodi
                        perspiciatis, atque similique. Sunt molestias repudiandae quisquam. Tempore dignissimos saepe
                        voluptatibus explicabo culpa, unde odit perspiciatis porro praesentium enim doloremque quaerat
                        ipsum obcaecati quisquam fugiat dolorum voluptatum non cupiditate! Minus tenetur est, harum
                        delectus enim facere nihil nam voluptatem? Minus asperiores aliquam accusantium vero praesentium
                        reprehenderit repellendus corrupti tempore quae voluptatum! Est, aperiam accusamus! Officia,
                        fuga ex quis ipsa accusantium omnis quam.
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-7 mb-5 board-area">
                    <div class="container bg-light board p-2 shadow-sm">
                        <div class="container">
                            <span style="font-size:1.8em;">자유게시판</span>
                            <a href="#" class="fa fa-plus-square-o detail-icon" style="font-size:3em;float:right;"></a>
                        </div>
                        <ul class="list-group list-group-flush board-ul w-100">
                            <li class="list-group-item p-0"><a href="#">자유1</a></li>
                            <li class="list-group-item p-0"><a href="#">자유2</a></li>
                            <li class="list-group-item p-0"><a href="#">자유3</a></li>
                            <li class="list-group-item p-0"><a href="#">자유4</a></li>
                            <li class="list-group-item p-0"><a href="#">자유5</a></li>
                            <li class="list-group-item p-0"><a href="#">자유6</a></li>
                            <li class="list-group-item p-0"><a href="#">자유7</a></li>
                            <li class="list-group-item p-0"><a href="#">자유8</a></li>

                        </ul>
                    </div>
                    <div class="container bg-light board p-2 shadow-sm">
                        <div class="container">
                            <span style="font-size: 1.8em;">정보게시판</span>
                            <a href="#" class="fa fa-plus-square-o detail-icon" style="font-size:3em;float:right;"></a>
                        </div>
                        <ul class="list-group list-group-flush board-ul w-100">
                            <li class="list-group-item p-0"><a href="#">정보1</a></li>
                            <li class="list-group-item p-0"><a href="#">정보2</a></li>
                            <li class="list-group-item p-0"><a href="#">정보3</a></li>
                            <li class="list-group-item p-0"><a href="#">정보4</a></li>
                            <li class="list-group-item p-0"><a href="#">정보5</a></li>
                            <li class="list-group-item p-0"><a href="#">정보6</a></li>
                            <li class="list-group-item p-0"><a href="#">정보7</a></li>
                            <li class="list-group-item p-0"><a href="#">정보8</a></li>

                        </ul>
                    </div>
                </div>

                <div class="col-lg-5 mb-5 p-0 swiper-container bg-light">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper" style="margin-top:10px;">
                        <!-- Slides -->
                        <div class="swiper-slide" style="background-image: url('/mingo/img/cafe.jpg');"></div>
                        <div class="swiper-slide" style="background-image: url('/mingo/img/cafe2.jpg');"></div>
                        <div class="swiper-slide" style="background-image: url('/mingo/img/cafe3.jpg');"></div>

                    </div>
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>

                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>

                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <div class="footer clearfix mb-2">
                <a href="#" class="fa fa-coffee" style="font-size:3em;float:left;font-weight: bold;">&nbsp;Mingo</a>
                <a href="#" class="fa fa-twitter" style="font-size:3em;float:right"></a>
                <a href="#" class="fa fa-facebook" style="font-size:3em;float:right;margin-right:20px;"></a>
                <a href="#" class="fa fa-youtube" style="font-size:3em;float:right;margin-right:20px;"></a>
            </div>
            <p style="font-size:1.1em">
                서울특별시 금천구 대륭테크노타운 3차 8F | 대표이사:홍길동 | 사업자등록번호:123-45-12345<br>
                통신판매업신고번호: 2019-서울금천-12345 | 대표메일: honggildong@naver.com<br>
                Copyright. All Rights Reserved.
            </p>
        </div>

    </div>
</body>

</html>
