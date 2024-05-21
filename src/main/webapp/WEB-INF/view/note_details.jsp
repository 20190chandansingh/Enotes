<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Note Details</title>
    <%@include file="/WEB-INF/resources/component/all_link.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/resources/component/navbar.jsp"%>
    <div class="container p-3">
        <h2>${note.title}</h2>
        <p>${note.description}</p>
        <p><strong>Published Date:</strong> ${note.date}</p>
        
        <!-- Back button with styling -->
        <a href="${pageContext.request.contextPath}/user/viewNotes" class="btn btn-secondary">Back to Notes</a>
    </div>
</body>
</html>
