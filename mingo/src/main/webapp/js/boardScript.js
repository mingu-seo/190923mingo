/**
 *     20-02-07 홍동우가 작성
 */

$(document).ready(function(){
	
	var options1 = $('select[name="s1"] option');
	var options2 = $('select[name="s2"] option');
	
	
	//검색후 옵션 1 유지
	for( let i=0; i < options1.length; i++){
		if( s1 == i)
			$(options1[i]).attr('selected','selected');
		else
			$(options1[i]).removeAttr('selected');
	}
	//검색후 옵션 2 유지
	for( let i=0; i < options2.length; i++){
		if( s2 == i)
			$(options2[i]).attr('selected','selected');
		else
			$(options2[i]).removeAttr('selected');
	}
	//검색후 키워드 유지
	$('input[name="k"]').val(k);
	
	
});

function filterSearch(){
	$('#filter-form').submit();
}