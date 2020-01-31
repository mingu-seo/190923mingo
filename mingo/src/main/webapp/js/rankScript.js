
var brandList = ['전체','스타벅스','투썸플레이스','이디야','커피빈','할리스커피','탐앤탐스','카페베네','빽다방','엔제리너스','기타'];
$(document).ready(function(){
	$('input[type=radio][name=sido_code]').change(function() {
	    var value = $(this).val();
	    //지역 라디오 버튼 변경시 Ajax호출
	   
	    $.ajax({
			url: 'getSigunguRadioList.do',
			async: true,
			data: { sido_code : value },
			dataType : 'HTML',
		}).done(function(data){
			data = data.trim();
			$('.r-filter-b').html(data);
		});
	
	});
	var brandItems = filterSetting();
	
	$('.r-filter-c').html(brandItems);
	
	
});



	
		
		


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