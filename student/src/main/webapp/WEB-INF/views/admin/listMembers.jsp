<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <c:set var="contextPath" value="${pageContext.request.contextPath}" />

            <% request.setCharacterEncoding("utf-8"); %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Insert title here</title>
                    <style>
                           @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

                        .memberlist1 {
                
                            font-size: 40px;
                            text-align: center;
                        }

                        .memberlist2 {
             
                            text-align: center;
                            border: 1px solid #99e6ff;
                            border-collapse: collapse;
                            border-style: hidden;
                            box-shadow: 0 0 0 1px #99e6ff;
                            border-spacing: 0;
                            border-radius: 15px;
                        }

                        .memberlist3 {
                            text-align: center;
                            width: 100px;
                            height: 150px;
       
                            border: 1px solid #99e6ff;
                            border-spacing: 0;
                            font-size: 15px;
                        }

                        .memberlist7 {
                            text-align: center;
                            width: 100px;
                            height: 50px;
                  
                            border: 1px solid #99e6ff;
                            border-spacing: 0;
                            font-size: 15px;
                        }

                        .memberlist4 {
                            text-align: center;
                            width: 100px;
                            height: 50px;
                   
                            border: 1px solid #99e6ff;
                            border-spacing: 0;
                            font-size: 20px;
                            background-color: #fcffa3;
                        }

                        .memberlist5 {
                            text-align: center;
                            width: 100px;
                            height: 50px;
                 
                            border: 1px solid #99e6ff;
                            border-spacing: 0;
                            font-size: 20px;
                            border-radius: 15px 0px 0px 0px;
                            background-color: #fcffa3;
                        }

                        .memberlist6 {
                            text-align: center;
                            width: 100px;
                            height: 50px;
         
                            border: 1px solid #99e6ff;
                            border-spacing: 0;
                            font-size: 20px;
                            border-radius: 0px 15px 0px 0px;
                            background-color: #fcffa3;
                        }

                        .memberlist8 {
                            text-align: center;
                            width: 100px;
                            height: 150px;
                     
                            font-size: 15px;
                            text-decoration: none;
                            color: #0066cc;
                        }
                    </style>

                </head>

                <body>
                    <h3 class="memberlist1">Student List</h3>
                    <table class="memberlist2" align="center">
                        <tr class="memberlist7" align="center">
                            <td class="memberlist5"><b>ID</b></td>
                            <td class="memberlist4"><b>Password</b></td>
                            <td class="memberlist4"><b>Name</b></td>
                            <td class="memberlist4"><b>Email</b></td>
                            <td class="memberlist4"><b>Member Photo</b></td>
                            <td class="memberlist4"><b>Date of Registration</b></td>
                            <td class="memberlist6"><b>Register Grades</b></td>
                        </tr>

                        <c:choose>
                            <c:when test="${empty membersList}">
                                <tr class="memberlist3">
                                    <td class="memberlist3" colspan="8">
                                        There are no scores registered.
                                    </td>
                                </tr>
                            </c:when>

                            <c:when test="${!empty membersList}">
                                <c:forEach var="member" items="${membersList}">
                                    <c:if test="${member.id != 'admin'}">
                                        <tr class="memberlist3" align="center">
                                            <td class="memberlist3">${member.id}</td>
                                            <td class="memberlist3">${member.pwd}</td>
                                            <td class="memberlist3">${member.name}</td>
                                            <td class="memberlist3">${member.email}</td>
                                            <c:if test="${not empty member.imageFileName && member.imageFileName != 'null'}">
                                                <td class="memberlist3">
                                                    <img width="100px" height="100px" src="${contextPath}/download.do?articleNO=${member.articleNO}&imageFileName=${member.imageFileName}">
                                                </td>
                                            </c:if>
                                            <td class="memberlist3">${member.joinDate}</td>
                                            <td class="memberlist3">
                                                <a class="memberlist8" href="${contextPath}/admin/gradeForm.do?id=${member.id}">Grade Registration</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            
                        </c:choose>
                    </table>
                </body>

                </html>