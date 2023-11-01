<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Administrator Main Page</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

      .adminmain2 {
        font-size: 40px;

        text-align: center;
      }

      .adminmain3 {
        font-size: 25px;

        text-align: center;
      }
    </style>
  </head>
  <body>
    <br /><br /><br /><br /><br /><br />
    <div class="adminmain2">
      This is the administrator's main page
      <h3 class="adminmain3">Please select the menu you desire</h3>
      <br />
    </div>
  </body>
</html>
