var sido_code=-1;
var sigungu_code=-1;
var dong_code = -1;
var brand_code=-1;
var af=0;
var ak='';
var brandList = ['전체','스타벅스','투썸플레이스','이디야','커피빈','할리스커피','탐앤탐스','카페베네','빽다방','엔제리너스','기타'];
$(document).ready(function(){
	/* 툴팁을 위한 초기화 */
	$('[data-toggle="tooltip"]').tooltip();
	
	/* 브랜드 옵션 초기화 */
	var brandItems = filterSetting();
	$('.r-filter-d').html(brandItems);
	
	//처음에 왔을때 리스트 trigger
	listCafeRank(1);
	//시도 라디오 버튼 변경시 Ajax호출
	$('input[type=radio][name=sido_code]').change(function() {
	    var value = $(this).val();
	    sido_code =value;
	    //시도 버튼 누를시 시군구 버튼, 행정동 버튼 초기화,키워드 초기화
	    sigungu_code = -1;
	    dong_code = -1;
	    $('input[type=text][name=ak]').val('');
	    $('.r-filter-c').empty();
	    
	    listCafeRank(1);
	    
	    $.ajax({
			url: 'getSigunguRadioList.do',
			async: true,
			data: { sido_code : value },
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			$('.r-filter-b').html(data);
			
			//리스트가 채워지면 change 이벤트를 바인드 시킨다
			$('input[type=radio][name=sigungu_code]').change(function(){
				var value = $(this).val();
			    sigungu_code =value;
			    //시군구 버튼 누를시 행정동 버튼 초기화,키워드 초기화
			    dong_code = -1;
			    $('input[type=text][name=ak]').val('');
			    listCafeRank(1);
			    
			    $.ajax({
					url: 'getDongRadioList.do',
					async: true,
					data: { sigungu_code : value },
					dataType : 'HTML',
				}).done(function(data){
					data = data.trim();
					$('.r-filter-c').html(data);
					
					//리스트가 채워지면 change 이벤트를 바인드 시킨다
					$('input[type=radio][name=dong_code]').change(function(){
						var value = $(this).val();
					    dong_code=value;
					    //초기화
					    $('input[type=text][name=ak]').val('');
					    listCafeRank(1);
					    
					});
				});
			    
			});
		});
	});
	
	$('input[type=radio][name=brand_code]').change(function(){
		var value = $(this).val();
	    brand_code=value;
	    //키워드 초기화
	    $('input[type=text][name=ak]').val('');
	    listCafeRank(1);
	    
	});
	
	
});

function deleteCafe(id){
	var chk =  confirm("초기화하면 카페가 초기상태로 돌아가며, 카페관련 데이터(메뉴,서비스 등)들은 모두 삭제됩니다. 정말 삭제하시겠습니까?");
	if (chk){
				location.href="deleteCafeAdmin.do?cafe_id="+id;  
				alert('초기화되었습니다');
	}else{event.preventDefault();}
}
//필터링 단추를 바탕으로 ajax를 호출시켜 리스트를 띄운다
function listCafeRank(page){
	$('.r-content').empty();
	$('#test').addClass('spinner-border text-primary');
    $('#test').parent().addClass('is-loading2');

    af = $('select[name=af] option').index($('select[name=af] option:selected'));
    ak = $('input[type=text][name=ak]').val();
    /* 카페 랭킹 리스트 가져오기 */
	$.ajax({
		url: 'getCafeRankList2.do',
		async: true,
		data: { sido_code : sido_code,
				sigungu_code : sigungu_code, 
				dong_code : dong_code,
				brand_code : brand_code,
				af: af,
				ak: ak,
				page : page
				},
		dataType : 'HTML',
	}).done(function(data){
		$('#test').removeClass('spinner-border text-primary');
        $('#test').parent().removeClass('is-loading2');
		$('.r-content').html(data);
	});
	
	
	
	print();
	
}

/* 테스트용 출력 함수 */
function print(){
	console.log("sido_code="+sido_code +", sigungu_code="+sigungu_code+"," +
			" dong_code="+dong_code+", brand_code="+brand_code+", af="+af+", ak="+ak);
}
function filterSetting(){
	var datas='';
	for( var i=0; i<brandList.length; i++){
		if( i==0 ){
			var data='';
			data +='<li class="list-group-item">';
			data +='<div class="custom-control custom-radio">';
			data +='<input checked="checked" type="radio" class="custom-control-input" id="brand"'+i;
			data +=' name="brand_code" value="-1"> <label ';
			data +='class="custom-control-label" for="brand"'+i+'>'+brandList[i]+'</label>';
			data +='</div>';
			data +='</li>';
			datas += data;
		}else{
			var data='';
			data +='<li class="list-group-item">';
			data +='<div class="custom-control custom-radio">';
			data +='<input type="radio" class="custom-control-input" id="brand'+i+'"';
			data +='name="brand_code" value="'+i+'"> <label ';
			data +='class="custom-control-label" for="brand'+i+'">'+brandList[i]+'</label>';
			data +='</div>';
			data +='</li>';
			datas += data;
		}
		
	}
	return datas;
}