<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

				<c:set var="contextPath" value="${pageContext.request.contextPath}" />

				<% request.setCharacterEncoding("utf-8"); %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>Insert title here</title>
						<script>
							function fn_login(isLogOn, getUserInfo, loginForm) {
								if (isLogOn != '' & isLogOn != 'false') {
									location.href = getUserInfo;
								} else {
									alert("It is available after logging in.")
									location.href = loginForm;
								}
							}
							function fn_login1(isLogOn, getUserGrade, loginForm) {
								if (isLogOn != '' & isLogOn != 'false') {
									location.href = getUserGrade;
								} else {
									alert("It is available after logging in.")
									location.href = loginForm;
								}
							}
						</script>
						<style>
							   @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

							.side1 {
								text-align: center;
							
							}

							.side2 {
								text-decoration: none;
								font-size: 20px;
								color: #0066cc;
							}

					
						</style>
					</head>

					<body>
						<div class="side1">
							<br><br>
							<c:choose>
								<c:when test="${side_menu=='admin_mode' }">
									<a href="${contextPath}/admin/listMembers.do" class="side2">Student Information and Grade Registration</a><br><br>
									<a href="${contextPath}/admin/listGrade.do" class="side2">Student Grade List</a><br><br>
								</c:when>
							</c:choose>
							<a href="javascript:fn_login('${isLogOn }', '${contextPath }/admin/getUserInfo.do','${contextPath }/member/loginForm.do')"
								class="side2">My Info</a><br><br>
							<a href="javascript:fn_login1('${isLogOn }', '${contextPath }/admin/getUserGrade.do','${contextPath }/member/loginForm.do')"
								class="side2">Check Grades</a><br><br>
						</div>
					</body>

					</html>
					<input type="hidden" name="UserId" id="UserId" value="${UserId}" />