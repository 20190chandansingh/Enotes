<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/resources/component/all_link.jsp"%>
</head>
<body>
<div class="container text-center">
<h1>Upload file</h1>
<form action="fileupload" enctype="multipart/form.data" method="post">
<div class="mb-3 col-md-6 offset-md-3 mt-4">
<input type="file" name="img" class="form-control"></div>
<div class="mb-3 col-md-4 offset-md-4 mt-4">
<button class=" btn btn-primary">Upload</button>
</div></form></div>
</body>
</html>