<!-- 작성자:최수진 -->


$(function() {
	$("li.gender_button").click(function() {
		$("li.gender_button").attr("aria-checked", "false");
		$(this).attr("aria-checked", "true");
	});
});

