<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result }" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Login Page</title>
    <c:choose>
      <c:when test="${result=='loginFailed' }">
        <script>
          window.onload = function () {
            alert("ID나 Password가 틀립니다.다시 Login 하세요!");
          };
        </script>
      </c:when>
    </c:choose>
    <style>
      .login1 {
        border: 1px solid #99e6ff;
        border-collapse: collapse;
        border-style: hidden;
        box-shadow: 0 0 0 1px #99e6ff;
        border-spacing: 0;
        border-radius: 15px;
      }

      .login2 {
        border: 1px solid #99e6ff;
        padding: 10px;
        font-size: 20px;
        border-radius: 5px;
      }

      .login3 {
        width: 100px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;

        font-size: 20px;
      }

      .login4 {
        border: 1px solid #99e6ff;
        width: 150px;
        height: 30px;
        border-radius: 5px;
      }

      .login5 {
        border: 1px solid #99e6ff;
        padding: 10px;
        font-size: 20px;
        border-radius: 15px 0px 0px 0px;
        background-color: #fcffa3;
      }

      .login6 {
        border: 1px solid #99e6ff;
        padding: 10px;
        font-size: 20px;
        border-radius: 0px 15px 0px 0px;
        background-color: #fcffa3;
      }

      .login7 {
        text-decoration: none;
        color: #0066cc;
        text-align: center;
        font-size: 20px;
      }

      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }
    </style>
  </head>

  <body>
    <br /><br /><br /><br />
    <form name="frmLogin" method="post" action="${contextPath}/member/login.do">
      <table class="login1" width="80%" align="center">
        <tr class="login2" align="center">
          <td class="login5">ID</td>
          <td class="login6">Password</td>
        </tr>
        <tr class="login2" align="center">
          <td class="login2">
            <input class="login4" type="text" name="id" value="" size="20" />
          </td>
          <td class="login2">
            <input
              class="login4"
              type="password"
              name="pwd"
              value=""
              size="20"
            />
          </td>
        </tr>
        <tr class="login2" align="center">
          <td class="login2" colspan="2">
            <input class="login3" type="submit" value="Login" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="login3" type="reset" value="Rewrite" />
          </td>
        </tr>
      </table>
      <br />
      <a class="login7" href="${contextPath}/member/memberForm.do"
        >Sign Up Now</a
      >
    </form>
  </body>
</html>
