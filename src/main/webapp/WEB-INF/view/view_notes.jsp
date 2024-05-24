<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Notes</title>
    <%@include file="/WEB-INF/resources/component/all_link.jsp"%>
    <style>
        /* Custom CSS for clickable titles */
        .note-title {
            cursor: pointer;
            color: #0366d6; /* Blue color for link appearance */
            text-decoration: underline;
        }
        .note-title:hover {
            text-decoration: none; /* Remove underline on hover */
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/resources/component/navbar.jsp"%>
    <div class="container-fluid p-2">
       <!--<h4 class="text-center">View All Notes</h4>--> 
        
        <c:if test="${not empty msg}">
            <p class="fs-5 fw-bold text-success text-center">${msg}</p>
            <c:remove var="msg" />
        </c:if>
        
          <!-- Search Form -->
        <form action="viewNotes" method="get" class="mb-3">
            <div class="input-group">
               <input type="text" name="search" class="form-control" style="width: 100px; height: 40px;" placeholder="Search notes..." value="${param.search}">
               
                <button class="btn btn-outline-secondary" type="submit">Search</button>
            </div>
        </form>
        <div class="row">
            <c:forEach items="${list}" var="n">
                <div class="col-md-10 offset-md-1 mt-2">
                    <div class="card">
                        <div class="card-body">
                            <!-- Clickable title with CSS classes -->
                            <h5 class="text-left note-title" onclick="window.location.href='viewNoteDetails?id=${n.id}'">${n.title}</h5>
                           <%--  <div class="text-right">
                                <img alt="" src="<c:url value="/resources/img/notebook2.jpg" />" width="30px" height="30px">
                            </div>--%>
                            <div class="text-right">
                            <img alt="" src="<c:url value="/resources/img/notebook2.jpg" />" width="30px" height="40px">
                                <a href="editNotes?id=${n.id}" class="btn btn-primary btn-sm">Edit</a>
                                <a href="deleteNotes?id=${n.id}" class="btn btn-danger btn-sm">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
