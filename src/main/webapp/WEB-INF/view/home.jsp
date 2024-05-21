<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/resources/component/all_link.jsp"%>

</head>
<body>
<%@include file="/WEB-INF/resources/component/navbar.jsp"%>

<div class="container-fluid p-0 m-0">
<img alt="notes_img" src="<c:url value="/resources/img/note2.jpg" />" width="100%" height="550px">
</div>
	<!-- start navbar -->
	
	<!-- end navbar -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>