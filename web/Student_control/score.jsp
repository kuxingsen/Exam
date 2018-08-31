<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试成绩</title>
</head>
<body>
<jsp:useBean id="score_bean" class="com.sql.SQL" scope="page"/>
<%
    int sum=0;
    String Exam_id = request.getParameter("Exam_id");
    String sql="select * from choice where Exam_id='"+Exam_id+"'";
    ResultSet rs=score_bean.executeQuery(sql);
    try {
        while(rs.next())
        {
            String item_id=rs.getString("item_id");
            String user_ans=request.getParameter(item_id);
          //  out.println(user_ans+rs.getString("ques_answer").substring(0,1));
            if(user_ans.equals(rs.getString("ques_answer").substring(0,1)))
            {

               // out.println(item_id+"yes<br>");
                sum+=2;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%
    sql="select * from judge where Exam_id ='"+Exam_id+"'";
    rs=score_bean.executeQuery(sql);
    try {
        while (rs.next())
        {
            String item_id=rs.getString("item_id");
            String user_ans=request.getParameter(item_id);
            if(user_ans.equals(rs.getString("answer").trim()))
            {

                //out.println(item_id+"yes<br>");
                sum+=2;
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%
    String Stu_id=request.getParameter("Stu_id");
    sql="select * from Score where Stu_id='"+Stu_id+"' and Exam_id='"+Exam_id+"'";
    rs=score_bean.executeQuery(sql);
    try {
        if(rs.next())
        {
            sql="update Score set Score='"+sum+"' where Stu_id='"+Stu_id+"' and Exam_id='"+Exam_id+"'";
        }
        else
        {
            sql="insert into Score(Score,Stu_id,Exam_id) values('"+sum+"','"+Stu_id+"','"+Exam_id+"')";
        }
       // out.println(sql);
        score_bean.executeInsert(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<h3>本次成绩为<%=sum%></h3>
<h4><a href="Exam_answer.jsp?Exam_id=<%=Exam_id%>">查看答案</a></h4>
</body>
</html>
