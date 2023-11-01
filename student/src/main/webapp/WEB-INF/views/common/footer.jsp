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
    <title>Footer</title>
    <style type="text/css">
      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      p {
        font-size: 20px;
        text-align: center;
        font-family: "Roboto";
      }

      .footer {
        color: #0066cc;
        text-decoration: none;
        font-family: "Roboto";
        
      }
    </style>
  </head>
  <body>
    <p>e-mail:Ilovecode@gmail.com</p>
    <p>Company address:Tokyo Japan</p>
    <p>Directions:<a class="footer" href="#">Map</a></p>
  </body>
</html>
