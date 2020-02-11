<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
<% if ("parentMove".equals((String)request.getAttribute("cmd"))) { %>
	alert('${msg}');
	opener.location.href='${url}';
	window.close();
<% } else { %>
	alert('${msg}');
	location.href='${url}';
<% } %>
</script>  

