<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.omg.CORBA.Request" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/3
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String kind=request.getParameter("kind");
    String old_id=request.getParameter("old_id");
    String url=request.getParameter("url");
%>
<html>
<head>
    <meta http-equiv= "Refresh" content= "3;url=<%=url%> ">
    <script language="javascript">
        var times=4;
        clock();
        function clock()
        {
            window.setTimeout('clock()',1000);
            times=times-1;
            time.innerHTML ="修改成功！"+times+" 秒后跳转回";
        }
    </script>
    <title>确认修改</title>
</head>
<body>

<jsp:useBean id="modify_bean" class="com.sql.SQL" scope="page"/>
<%
    if(kind.equals("Choice"))
    {
        String question=request.getParameter("question");
        String A=request.getParameter("A");
        String B=request.getParameter("B");
        String C=request.getParameter("C");
        String D=request.getParameter("D");
        String answer=request.getParameter("answer");
        String sql="update choice set question ='"+question+"',A='"+A+"',B='"+B+"',C='"+C+"',D='"+D+"',ques_answer='"+answer+"' where item_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
    }
    else if(kind.equals("judge"))
    {
        String question=request.getParameter("question");
        String answer=request.getParameter("answer");
        String sql="update judge set question ='"+question+"',answer='"+answer+"' where item_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
    }
%>
<div id="time">修改成功！3 秒后跳转回</div>
</body>
</html>
