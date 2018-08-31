<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/7
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%
    String kind=request.getParameter("kind");
    String url=request.getParameter("url");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv= "Refresh" content= "3;url=<%=url%> ">
    <script language="javascript">
        var times=4;
        clock();
        function clock()
        {
            window.setTimeout('clock()',1000);
            times=times-1;
            time.innerHTML ="添加成功！"+times+" 秒后跳转回";
        }
    </script>
</head>
<body>
<jsp:useBean id="add_bean" class="com.sql.SQL"/>
<%
    if(kind.equals("Choice"))
    {
        String question=request.getParameter("question");
        String A=request.getParameter("A");
        String B=request.getParameter("B");
        String C=request.getParameter("C");
        String D=request.getParameter("D");
        String answer=request.getParameter("answer");
        String id="";
        String sql="select distinct item_id from choice";
        ResultSet rs=add_bean.executeQuery(sql);
        int i=1;
        try {
            while(rs.next())
            {
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql="insert into choice(question,A,B,C,D,ques_answer,item_id,Exam_id) values('"+question+"','"+A+"','"+B+"','"+C+"','"+D+"','"+answer+"','choice"+i+"','"+request.getParameter("Exam_id")+"')";
       // out.println(sql);
        add_bean.executeInsert(sql);
    }
    else if(kind.equals("judge"))
    {
        String question=request.getParameter("question");
        String answer=request.getParameter("answer");

        String sql="select distinct item_id from judge";
        ResultSet rs=add_bean.executeQuery(sql);
        int i=1;
        try {
            while(rs.next())
            {
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql="insert into judge(question,answer,item_id,Exam_id) values('"+question+"','"+answer+"','judge"+i+"','"+request.getParameter("Exam_id")+"')";
        // out.println(sql);
        add_bean.executeInsert(sql);
    }
%>
<div id="time">添加成功！3 秒后跳转回</div>
</body>
</html>
