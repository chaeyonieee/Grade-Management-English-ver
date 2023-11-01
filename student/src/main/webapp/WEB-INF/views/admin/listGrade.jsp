<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

      .gradelist1 {
        font-size: 40px;
        text-align: center;
      }

      .gradelist2 {
        text-align: center;
        border: 1px solid #99e6ff;
        border-collapse: collapse;
        border-style: hidden;
        box-shadow: 0 0 0 1px #99e6ff;
        border-spacing: 0;
        border-radius: 15px;
      }

      .gradelist3 {
        text-align: center;
        width: 100px;
        height: 50px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 15px;
      }

      .gradelist4 {
        text-align: center;
        width: 100px;
        height: 50px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 18px;
        background-color: #fcffa3;
      }

      .gradelist5 {
        text-align: center;
        width: 100px;
        height: 50px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 18px;
        background-color: #fcffa3;
        border-radius: 15px 0px 0px 0px;
      }

      .gradelist6 {
        text-align: center;
        width: 100px;
        height: 50px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 18px;
        background-color: #fcffa3;
        border-radius: 0px 15px 0px 0px;
      }

      .gradelist7 {
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
    <h3 class="gradelist1">Student Grade List</h3>
    <table class="gradelist2" align="center">
      <tr class="gradelist3" align="center">
        <td class="gradelist5"><b>ID</b></td>
        <td class="gradelist4"><b>Korean</b></td>
        <td class="gradelist4"><b>English</b></td>
        <td class="gradelist4"><b>Math</b></td>
        <td class="gradelist4"><b>Korean History</b></td>
        <td class="gradelist4"><b>Sum</b></td>
        <td class="gradelist4"><b>Average</b></td>
        <td class="gradelist4"><b>Rank</b></td>
        <td class="gradelist6"><b>Edit</b></td>
      </tr>
      <c:choose>
        <c:when test="${empty gradeList}">
          <tr class="gradelist3">
            <td class="gradelist3" colspan="8">There are no scores registered.</td>
          </tr>
        </c:when>

        <c:when test="${!empty gradeList}">
          <c:forEach var="grade" items="${gradeList }">
            <tr class="gradelist3" align="center">
              <td class="gradelist3">${grade.id }</td>
              <td class="gradelist3">${grade.korean }</td>
              <td class="gradelist3">${grade.english }</td>
              <td class="gradelist3">${grade.math }</td>
              <td class="gradelist3">${grade.koreanHistory }</td>
              <td class="gradelist3">${grade.sum}</td>
              <td class="gradelist3">${grade.avg }</td>
              <td class="gradelist3">${grade.studentRank }</td>
              <td class="gradelist3">
                <a
                  class="gradelist7"
                  href="${contextPath}/admin/modGrade.do?id=${grade.id }"
                  >Edit Grades</a
                >
              </td>
            </tr>
          </c:forEach>
        </c:when>
      </c:choose>
    </table>
  </body>
</html>
