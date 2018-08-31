<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改判断题</title>
</head>
<body>
<jsp:useBean id="judge_bean" scope="page" class="com.sql.SQL"/>
<%
    String item_id=request.getParameter("item_id");
    String question="";
    String answer="";
    String sql="select * from judge where item_id='"+item_id+"'";
    ResultSet rs= judge_bean.executeQuery(sql);
    try {
        while(rs.next())
        {
            question=rs.getString("question");
            answer=rs.getString("answer");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<form name="judge" action="modify_con.jsp" method="get">
    问题<input type="text" name="question" value="<%=question%>"><br>
    答案：

    <input type="radio" name="answer" value="true"/>true
    <input type="radio" name="answer" value="false"/>false
    <input type="hidden" name="kind" value="judge">

    <input type="hidden" name="Exam_id" value="<%=request.getParameter("Exam_id")%>">
    <input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">
    <input hidden name="old_id" value="<%=item_id%>">
    <input type="submit" value="确定">
</form>
</body>
</html>
