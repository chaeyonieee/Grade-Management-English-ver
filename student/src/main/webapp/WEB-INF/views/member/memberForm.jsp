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
    <title>Sign Up Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous"
    />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#preview").attr("src", e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
    <style>
      .h2 {
        text-align: center;
      }

      .member2 {
        padding: 10px;
        font-size: 20px;
        text-align: right;
        width: 150px;
        height: 40px;
      }

      .member4 {
        padding: 10px;
        font-size: 20px;
        border-radius: 5px;
        text-align: left;
        width: 350px;
      }

      .member3 {
        border: 1px solid #99e6ff;
        width: 200px;
        height: 30px;
        border-radius: 5px;
      }

      .member5 {
        width: 100px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;
      }

      .member6 {
        width: 220px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;
      }

      .member7 {
        height: 80px;
        text-align: center;
      }

      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }
    </style>
  </head>

  <body>
    <div class="d1">
      <form
        name="form"
        method="post"
        action="${contextPath}/member/addMember.do"
        enctype="multipart/form-data"
      >
        <br />
        <h2 class="h2">Sign Up</h2>
        <br />
        <table align="center">
          <tr class="member2">
            <td class="member2">ID</td>
            <td class="member4">
              <input class="member3" type="text" name="id" />
            </td>
          </tr>
          <tr class="member2">
            <td class="member2">Password</td>
            <td class="member4">
              <input class="member3" type="password" name="pwd" />
            </td>
          </tr>
          <tr class="member2">
            <td class="member2">Name</td>
            <td class="member4">
              <input class="member3" type="text" name="name" />
            </td>
          </tr>
          <tr class="member2">
            <td class="member2">Email</td>
            <td class="member4">
              <input class="member3" type="text" name="email" />
            </td>
          </tr>
          <tr class="member2">
            <td class="member2">Register Photo</td>
            <td class="member4">
              <input
                class="member6"
                type="file"
                name="imageFileName"
                onchange="readURL(this);"
              />
              <img id="preview" src="#" width="200" height="200" />
            </td>
          </tr>
          <tr class="member2">
            <td class="member7" colspan="2">
              <input
                class="member5"
                type="submit"
                value="Sign Up"
              />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input class="member5" type="reset" value="Rewrite" />
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>
