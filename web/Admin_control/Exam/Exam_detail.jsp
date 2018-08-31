<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考卷信息</title>

</head>
<body>
<jsp:useBean id="Exam_detail" class="com.sql.SQL" scope="page"/>
<%
    Map<String,String> Tea_name=new HashMap<String,String>();
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
                        +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='modify_choice.jsp?item_id="+choiceSet.getString("item_id")+"'>修改</a><br/>");
                out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A."+choiceSet.getString("A")+"&nbsp;&nbsp;"
                        +"B."+choiceSet.getString("B")+"&nbsp;&nbsp;"
                        +"C."+choiceSet.getString("C")+"&nbsp;&nbsp;"
                        +"D."+choiceSet.getString("D")+"&nbsp;&nbsp;");
                String ans=choiceSet.getString("ques_answer").substring(0,1);
                out.println("<span style=\"color: red\">答案："+ans+"&nbsp;&nbsp;"+choiceSet.getString(ans)+"</span><br/>");
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
            out.println(II+++"."+judgeSet.getString("question")
                    +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='modify_judge.jsp?item_id="+judgeSet.getString("item_id")+"'>修改</a><br/>");
            String ans=judgeSet.getString("answer");
            out.println("<span style=\"color: red\">答案："+ans+"</span><br/>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>


<input type="button" name="ADD" value="新增选择题" onclick="location.href='add_choice.jsp?Exam_id=<%=request.getParameter("Exam_id")%>'">

<input type="button" name="ADD" value="新增判断题" onclick="location.href='add_judge.jsp?Exam_id=<%=request.getParameter("Exam_id")%>'">
</body>
</html>
