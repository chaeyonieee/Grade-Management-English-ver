<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<c:set var="contextPath" value="${pageContext.request.contextPath}" />

			<% request.setCharacterEncoding("utf-8"); %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>헤더</title>
					<style>
						.td1 {
							text-align: center;
						font-weight:bold;
							font-size: 30px;
						}

						.td2 {
						
							font-size: 18px;
							width: 150px;
						}

						.head1 {
							text-decoration: none;
							font-size: 20px;
							color: #0066cc;
						}

						@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

					</style>
				</head>

				<body>
					<table boder="0" width="100%">
						<tr>
							<td style="height:180px">
								<a href="${contextPath }/member/main.do">
									<img src="/image/momin.gif" width="166px" height="166px" />
								</a>
							</td>

							<td class="td1">
								Student Grade Management Program
							</td>

							<td class="td2">
								<c:choose>
									<c:when test="${isLogOn == true && member != null }">
										Welcome. ${member.name }!<br>
										<a class="head1" href="${contextPath }/member/logout.do">Log Out<br></a>
									</c:when>
									<c:otherwise>
										<a class="head1" href="${contextPath }/member/loginForm.do">Login</a>
									</c:otherwise>
								</c:choose>

								<c:if test="${isLogOn==true and member.id =='admin' }">
									<a class="head1" href="${contextPath}/admin/adminMain.do">Administrator Mode</a>
								</c:if>
							</td>
					</table>
				</body>

				</html>