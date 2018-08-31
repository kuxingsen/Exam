<%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加选择题</title>
</head>
<body>
<form name="choice" action="add_ques_con.jsp" method="get">
    问题<input type="text" name="question" ><br>
    A.<input type="text" name="A" ><br/>
    B.<input type="text" name="B" ><br/>
    C.<input type="text" name="C" ><br/>
    D.<input type="text" name="D" ><br/>
    答案：
    <input type="radio" name="answer" value="A"/>A
    <input type="radio" name="answer" value="B"/>B
    <input type="radio" name="answer" value="C"/>C
    <input type="radio" name="answer" value="D"/>D
    <input type="hidden" name="kind" value="Choice">

    <input type="hidden" name="Exam_id" value="<%=request.getParameter("Exam_id")%>">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">

    <input type="submit" value="确定">
</form>
</body>
</html>
