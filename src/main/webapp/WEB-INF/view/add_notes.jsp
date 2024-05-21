<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/resources/component/all_link.jsp"%>
<%--<script type="text/javascript"
	 src="<c:url  value="/resources/js/javascript.js" />"></script>--%>
</head>
<body>
<%@ include file="/WEB-INF/resources/component/navbar.jsp"%>
<div class="container mt-6">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header text-center fs-3">
                    <h3>Add Note</h3>
                    <c:if test="${not empty msg }">
                        <p class="fs-3 fw-bold text-primary">${msg}</p>
                        <c:remove var="msg" />
                    </c:if>
                    <div id="microphone-container" class="mt-3 text-center">
                        <!-- Microphone Icon -->
                        <i id="microphone-icon" class="fas fa-microphone"></i>
                    </div>
                </div>
                <div class="card-body">
                    <form action="saveNotes" method="post">
                        <div class="mb-3">
                            <label>Enter Title</label>
                            <input type="text" name="title" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Enter Description</label>
                            <textarea rows="8" cols="" class="form-control" name="description"></textarea>
                            <a class="nav-link active"
					href="file_upload"><i class="fa-solid fa-folder"></i>upload
						file</a>
                        </div>
                        <button class="btn btn-primary col-md-12">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Script for Speech Recognition -->
<script>
    const microphoneIcon = document.getElementById('microphone-icon');
    const titleInput = document.querySelector('input[name="title"]');
    const descriptionTextArea = document.querySelector('textarea[name="description"]');
    
    if ('webkitSpeechRecognition' in window) {
        const recognition = new webkitSpeechRecognition();
        
        recognition.continuous = false;
        recognition.interimResults = true;
        recognition.lang = 'en-US'; // Change language code as needed
        
        recognition.onresult = function(event) {
            const transcript = event.results[0][0].transcript;
            if (titleInput === document.activeElement) {
                titleInput.value = transcript;
            } else if (descriptionTextArea === document.activeElement) {
                descriptionTextArea.value = transcript;
            }
        };
        
        microphoneIcon.addEventListener('click', function() {
            recognition.start();
        });
    } else {
        console.error('Speech recognition not supported.');
    }
</script>
</body>
</html>
