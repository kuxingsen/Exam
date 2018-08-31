<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>试卷</title>
</head>
<body>

<jsp:useBean id="Exam_detail" class="com.sql.SQL" scope="page"/>
<form name="exam" action="score.jsp" method="post">
<%
    HashMap<String, String> Tea_name;
    Tea_name = new HashMap<String,String>();
    ResultSet Tea_rs=Exam_detail.executeQuery("select * from Teacher");
    try {
        while(Tea_rs.next())
        {
            Tea_name.put(Tea_rs.getString("Tea_id"),Tea_rs.getString("Tea_name"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    String name="";
    String Tea="";
    String sql="select Exam_name,OnloadTea_id from Exam where Exam_id='"+request.getParameter("Exam_id")+"'";
    ResultSet rs=Exam_detail.executeQuery(sql);
    try {
        if(rs.next())
        {
            name=rs.getString("Exam_name");
            Tea=rs.getString("OnloadTea_id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<h1><%=name%></h1>
<h4 align="left" ><%=Tea_name.get(Tea)%></h4>
<h2>一、选择题</h2>
<%
    sql="select * from choice where Exam_id='"+request.getParameter("Exam_id")+"'";
    ResultSet choiceSet=Exam_detail.executeQuery(sql);
    int I=1;
    try {
        while(choiceSet.next())
        {
            out.println(I+++"."+choiceSet.getString("question")//<input type='button' name='modify' value='修改' onclick="location.href='modify_choice.jsp?item_id="+request.getParameter("item_id")+"'">
                    +"<br/>");
            out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='"+choiceSet.getString("item_id")+"' value='A'/>A."+choiceSet.getString("A")+"&nbsp;&nbsp;"
                    +"<input type='radio' name='"+choiceSet.getString("item_id")+"' value='B'/>B."+choiceSet.getString("B")+"&nbsp;&nbsp;"
                    +"<input type='radio' name='"+choiceSet.getString("item_id")+"' value='C'/>C."+choiceSet.getString("C")+"&nbsp;&nbsp;"
                    +"<input type='radio' name='"+choiceSet.getString("item_id")+"' value='D'/>D."+choiceSet.getString("D")+"&nbsp;&nbsp;<br>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<h2>二、判断题</h2>
<%
    sql="select * from judge where Exam_id='"+request.getParameter("Exam_id")+"'";
    // out.println(sql);
    ResultSet judgeSet=Exam_detail.executeQuery(sql);
    int II=1;
    try {
        while(judgeSet.next())
        {
            out.println(II+++"."+judgeSet.getString("question")+"<br/>");
            out.println("<input type='radio' name='"+judgeSet.getString("item_id")+"' value='true'/>true&nbsp;&nbsp;&nbsp;");
            out.println("<input type='radio' name='"+judgeSet.getString("item_id")+"' value='false'/>false<br/>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
    <input hidden name="Exam_id" value="<%=request.getParameter("Exam_id")%>">
    <input hidden name="Stu_id" value="<%=(String)session.getAttribute("Student_id")%>">
    <input type="submit" value="交卷">
</form>
</body>
</html>
