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
    <title>Grade Registration Page</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
      function isEmpty(value) {
        if (value === "" || value === undefined || value === null) {
          return true;
        } else {
          return false;
        }
      }

      function fun_cal() {
        var korean = document.getElementById("i_korean");
        var english = document.getElementById("i_english");
        var math = document.getElementById("i_math");
        var koreanHistory = document.getElementById("i_koreanHistory");

        var koreanVal = korean.value;
        var englishVal = english.value;
        var mathVal = math.value;
        var koreanHistoryVal = koreanHistory.value;

        if (isEmpty(koreanVal)) {
          koreanVal = 0;
        } else {
          koreanVal = parseInt(koreanVal);
        }

        if (isEmpty(englishVal)) {
          englishVal = 0;
        } else {
          englishVal = parseInt(englishVal);
        }

        if (isEmpty(mathVal)) {
          mathVal = 0;
        } else {
          mathVal = parseInt(mathVal);
        }

        if (isEmpty(koreanHistoryVal)) {
          koreanHistoryVal = 0;
        } else {
          koreanHistoryVal = parseInt(koreanHistoryVal);
        }

        var total = koreanVal + englishVal + mathVal + koreanHistoryVal;
        var avg = total / 4;

        document.getElementById("i_sum").value = parseInt(total);
        document.getElementById("i_avg").value = parseInt(avg);
      }
    </script>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap");
      * {
        font-family: "Roboto";
      }

      .addGrade1 {
        font-size: 40px;
        text-align: center;
      }

      .addgrade2 {
        text-align: center;
        border: 1px solid #99e6ff;
        border-collapse: collapse;
        border-style: hidden;
        box-shadow: 0 0 0 1px #99e6ff;
        border-spacing: 0;
        border-radius: 15px;
      }

      .addgrade3 {
        text-align: center;
        width: 150px;
        height: 70px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 15px;
      }

      .addgrade4 {
        text-align: center;
        width: 100px;
        height: 70px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 18px;
        background-color: #fcffa3;
        color: #0066cc;
      }

      .addgrade5 {
        text-align: center;
        width: 100px;
        height: 70px;

        border: 1px solid #99e6ff;
        border-spacing: 0;
        font-size: 18px;
        background-color: #fcffa3;
        color: #0066cc;
        border-radius: 15px 0px 0px 0px;
      }

      .addgrade6 {
        border: 1px solid #99e6ff;
        width: 100px;
        height: 30px;
        border-radius: 5px;
      }

      .addgrade7 {
        width: 100px;
        height: 30px;
        background-color: #d4fcff;
        color: #0066cc;
        border: none;
        border-radius: 5px;

        font-size: 20px;
      }
    </style>
  </head>

  <body>
    <h3 class="addGrade1">Grade Registration</h3>
    <form method="post" action="${contextPath}/admin/addGrade.do">
      <table class="addgrade2" align="center">
        <tr class="addgrade3">
          <td class="addgrade5">ID</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              name="id"
              id="i_id"
              value="${member.id}"
              readonly
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">Korean</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_korean"
              name="korean"
              min="0"
              max="100"
              value="0"
              onchange="fun_cal()"
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">English</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_english"
              name="english"
              min="0"
              max="100"
              value="0"
              onchange="fun_cal()"
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">Math</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_math"
              name="math"
              min="0"
              max="100"
              value="0"
              onchange="fun_cal()"
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">Korean History</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_koreanHistory"
              name="koreanHistory"
              min="0"
              max="100"
              value="0"
              onchange="fun_cal()"
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">Sum</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_sum"
              name="sum"
              readonly
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade4">Average</td>
          <td class="addgrade3">
            <input
              class="addgrade6"
              type="text"
              id="i_avg"
              name="avg"
              readonly
            />
          </td>
        </tr>
        <tr class="addgrade3">
          <td class="addgrade3" colspan="2">
            <input
              class="addgrade7"
              type="reset"
              value="Rewrite"
            />&nbsp;&nbsp;&nbsp;
            <input class="addgrade7" type="submit" value="Register" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
