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
    String id=request.getParameter("id");
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
    {
        String password=request.getParameter("new_pass");
        String sql="update Student set password ='"+password+"' where Stu_id='"+id+"'";
        modify_bean.executeInsert(sql);
    }
%>
<div id="time">修改成功！3 秒后跳转回</div>
</body>
</html>
