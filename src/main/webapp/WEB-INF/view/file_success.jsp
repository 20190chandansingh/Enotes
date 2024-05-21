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

<div>
<h1>File uploaded successful</h1>
<img src='<c:url value="resources/img/${imgname}"></c:url>'>
</div>
</body>
</html>