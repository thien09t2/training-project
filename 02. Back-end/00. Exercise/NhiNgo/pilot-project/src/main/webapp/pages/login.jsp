<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>

<title>Sign In</title>
<jsp:include page="../common/head.jsp" />

<link rel="stylesheet" href="<c:url value='/css/login.css'/> ">
</head>
<body>
	<header class="container-fluid">
		<div class="container">
			<div class="main-logo">JAVA PILOT PROJECT</div>
		</div>
	</header>

	<div class="container-fluid">
		<div class="container form-area">
			<div class="signup">
				<c:if test="${not empty errMessage}">
					<div class="message-area">
						<div class="err-message-invalid">Login Failed!</div>
					</div>
				</c:if>
				<form action="/login" role="form" enctype="multipart/form-data" class="signup-form" autocomplete="off" method="POST">
					<h3 class="signup-heading">Welcome to Manager Page</h3>
					<div class="modal-body">
						<div class="form-group">
							<input type="text" id="userName" name="userName"
								class="form-input" placeholder="Username" required>
						</div>
						<div class="form-group">
							<input type="password" id="password" name="password"
								class="form-input" placeholder="Password" required>
						</div>
						<div class="form-tos">
							<input type="checkbox" name="rememberMe" id="#tox">Remember me
						</div>
						<div class="form-group">
							<button type="submit" class="form-submit" id="logInBtn">
								<span class="form-submit-text">Log In</span> 
							</button>
						</div>
						<hr>
						<p id="askToSwitchText">
								Not have an account yet ?
						</p>
						<div class="form-group">
							<a href="/signup" class="btn form-submit switch-sign-link switch-sign-link--underline">
                    			<span class="form-submit-text">Register new Account</span>
                			</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>

	<script src="<c:url value='/js/login.js'/>"></script>
</body>
</html>