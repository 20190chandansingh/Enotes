<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/resources/component/all_link.jsp"%>

</head>
<body>
<%@include file="/WEB-INF/resources/component/navbar.jsp"%>
<div class="container mt-5">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-header text-center fs-3">
						<h3>Edit Notes</h3>
					</div>
					<div class="card-body">
						<form action="updateNotes" method="post">
							<div class="mb-3">
								<label>Enter Title</label><input type="text" name="fullName"
									class="form-control" value="${notes.title}">

							</div>
							<div class="mb-3">
								<label>Enter Description</label>
								<textarea rows="6" cols="" class="form-control"
									name="description">${notes.description}</textarea>
							</div>
							<input type="hidden" name="id" value="${notes.id}">
							<button class="btn btn-primary col-md-12">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>