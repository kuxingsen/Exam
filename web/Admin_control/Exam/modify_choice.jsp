<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改选择题</title>
</head>
<body>
<jsp:useBean id="choice" scope="page" class="com.sql.SQL"/>
<%
    String item_id=request.getParameter("item_id");
    String question="";
    String A="",B="",C="",D="";
    String answer="";
    String sql="select * from choice where item_id='"+item_id+"'";
    ResultSet rs=choice.executeQuery(sql);
    try {
        while(rs.next())
        {
            question=rs.getString("question");
            A=rs.getString("A");
            B=rs.getString("B");
            C=rs.getString("C");
            D=rs.getString("D");
            answer=rs.getString("answer");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<form name="choice" action="modify_con.jsp" method="get">
问题<input type="text" name="question" value="<%=question%>"><br>
A.<input type="text" name="A" value="<%=A%>"><br/>
B.<input type="text" name="B" value="<%=B%>"><br/>
C.<input type="text" name="C" value="<%=C%>"><br/>
D.<input type="text" name="D" value="<%=D%>"><br/>
答案：
    <input type="radio" name="answer" value="A"/>A
    <input type="radio" name="answer" value="B"/>B
    <input type="radio" name="answer" value="C"/>C
    <input type="radio" name="answer" value="D"/>D
<input type="hidden" name="kind" value="Choice">
    <input type="hidden" name="old_id" value="<%=item_id%>">
<input type="hidden" name="url" value="<%=request.getHeader("Referer")%>">

<input type="submit" value="确定">
</form>
</body>
</html>
