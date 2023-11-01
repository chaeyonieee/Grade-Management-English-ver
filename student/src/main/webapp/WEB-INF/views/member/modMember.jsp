<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원 정보 수정 Page</title>
    <style>
      .text_center {
        text-align: center;
      }

      .mod2 {
        padding: 10px;
        font-size: 20px;
        text-align: right;
        width: 150px;
        height: 40px;
      }

      .mod3 {
        padding: 10px;
        font-size: 20px;
        border-radius: 5px;
        text-align: left;
        width: 350px;
      }

      .mod4 {
        border: 1px solid #99e6ff;
        width: 200px;
        height: 30px;
        border-radius: 5px;
      }

      .mod5 {
        width: 200px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;
      }

      .mod8 {
        height: 80px;
        text-align: center;
      }

      .member7 {
        height: 80px;
        text-align: center;
      }

      .member5 {
        width: 100px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;
        font-size: 15px;
      }

      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }
    </style>
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

      function fn_sub(obj) {
        document.getElementById("i_id").disabled = false;
        obj.submit();
      }
    </script>
  </head>

  <body>
    <div class="mod1">
      <form
        method="post"
        action="${contextPath}/member/updateMember.do"
        enctype="multipart/form-data"
      >
        <h2 class="text_center">Member Information Edit Window</h2>
        <table align="center">
          <tr class="mod2">
            <td class="mod2">ID</td>
            <td class="mod3">
              <input
                type="text"
                class="mod4"
                name="id"
                id="i_id"
                value="${member.id}"
                readonly
              />
            </td>
          </tr>
          <tr class="mod2">
            <td class="mod2">Password</td>
            <td class="mod3">
              <input
                class="mod4"
                type="password"
                name="pwd"
                value="${member.pwd}"
              />
            </td>
          </tr>
          <tr class="mod2">
            <td class="mod2">Name</td>
            <td class="mod3">
              <input
                type="text"
                class="mod4"
                name="name"
                value="${member.name}"
              />
            </td>
          </tr>
          <tr class="mod2">
            <td class="mod2">Email</td>
            <td class="mod3">
              <input
                type="text"
                class="mod4"
                name="email"
                value="${member.email}"
              />
            </td>
          </tr>
          <tr class="mod2">
            <td class="mod2">Register Photo</td>
            <td class="mod3">
              <input
                class="mod5"
                type="hidden"
                name="originalFileName"
                value="${member.imageFileName }"
              />
              <img
                width="200"
                height="200"
                src="${contextPath}/download.do?articleNO=${member.articleNO}&imageFileName=${member.imageFileName }"
                id="preview"
              />
              <input
                type="file"
                class="mod5"
                name="imageFileName"
                id="i_imageFileName"
                onchange="readURL(this);"
              />
            </td>
          </tr>
          <tr class="mod2">
            <td class="member7" colspan="3">
              <input
                class="member5"
                type="button"
                onclick="fn_sub(this.form)"
                value="Edit"
              />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input class="member5" type="reset" value="Rewrite" />
            </td>
          </tr>

          <tr class="mod2">
            <td class="mod3" colspan="3">
              <input
                type="hidden"
                name="articleNO"
                value="${member.articleNO }"
              />
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>
