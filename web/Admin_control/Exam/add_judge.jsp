<%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加判断题</title>
</head>
<body>
<form name="judge" action="add_ques_con.jsp" method="get">
    问题<input type="text" name="question"><br>
    答案：

    <input type="radio" name="answer" value="true"/>true
    <input type="radio" name="answer" value="false"/>false
    <input type="hidden" name="kind" value="judge">

    <input type="hidden" name="Exam_id" value="<%=request.getParameter("Exam_id")%>">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">

    <input type="submit" value="确定">
</body>
</html>
