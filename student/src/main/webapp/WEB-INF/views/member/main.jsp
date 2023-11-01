<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<c:set var="contextPath" value="${pageContext.request.contextPath}" />

			<% request.setCharacterEncoding("utf-8"); %>

				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>메인 페이지</title>
					<script src="http://code.jquery.com/jquery-latest.js"></script>
					<style>
						.main1 {
						
							text-decoration: none;
							color: #0066cc;
							text-align: center;
							font-size: 20px;
						}

						.main2 {
	
							font-size: 40px;
							text-align: center;
						}

						.main3 {
					
							font-size: 25px;
							text-align: center;
						}

						@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

					</style>
				</head>

				<body>
					<br><br><br><br><br><br>
					<div class="main2">
						<c:choose>
							<c:when test="${isLogOn == true && member != null }">
								This is the main page<br><br>
								<h3 class="main3">Please select the menu of your choice</h3><br>
							</c:when>
							<c:otherwise>
								This is the main page<br><br>
								<h3 class="main3">Please use after logging in or signing up.</h3><br>
								<a class="main1" href="${contextPath}/member/memberForm.do">Sign Up Now</a>
							</c:otherwise>
						</c:choose>
					</div>
				</body>

				</html>