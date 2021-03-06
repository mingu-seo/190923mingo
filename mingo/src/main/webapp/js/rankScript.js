
var brandList = ['전체','스타벅스','투썸플레이스','이디야','커피빈','할리스커피','탐앤탐스','카페베네','빽다방','엔제리너스','기타'];
$(document).ready(function(){
	/* 툴팁을 위한 초기화 */
	$('[data-toggle="tooltip"]').tooltip();
	var brandItems = filterSetting();
	
	$('.r-filter-c').html(brandItems);
	
	//처음에 왔을때 리스트 trigger
	listCafeRank(1);
	//시도 라디오 버튼 변경시 Ajax호출
	$('input[type=radio][name=sido_code]').change(function() {
	    var value = $(this).val();
	    sido_code =value;
	    //시도 버튼 누를시 시군구 버튼 초기화
	    sigungu_code = -1;
	    
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
			    sigungu_code=value;
			    listCafeRank(1);
			    
			});
		});
	});
	$('input[type=radio][name=brand_code]').change(function(){
		var value = $(this).val();
	    brand_code=value;
	    listCafeRank(1);
	    
	});
	$('input[type=radio][name=sort]').change(function(){
		var value = $(this).val();
	    sort_code=value;
	    listCafeRank(1);
	    
	});
	
	
});
//필터링 단추를 바탕으로 ajax를 호출시켜 리스트를 띄운다
function listCafeRank(page){
	$('.r-content').empty();
	$('#test').addClass('spinner-border text-primary');
    $('#test').parent().addClass('is-loading');
    
    /* 카페 랭킹 리스트 가져오기 */
	$.ajax({
		url: 'getCafeRankList.do',
		async: true,
		data: { sido_code : sido_code,
				sigungu_code : sigungu_code, 
				brand_code : brand_code,
				sort_code : sort_code,
				page : page
				},
		dataType : 'HTML',
	}).done(function(data){
		$('#test').removeClass('spinner-border text-primary');
        $('#test').parent().removeClass('is-loading');
		$('.r-content').html(data);
	});
	
	
	
	print();
	
}

/* 테스트용 출력 함수 */
function print(){
	console.log("sido_code="+sido_code +", sigungu_code="+sigungu_code+"," +
			" brand_code="+brand_code+", sort_code="+sort_code);
	console.log("page="+page+",startPage="+startPage+",endPage="+endPage+",maxPage="+maxPage);
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