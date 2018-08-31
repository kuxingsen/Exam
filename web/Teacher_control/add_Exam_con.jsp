<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/8
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url=request.getParameter("url");
%>
<html>
<head>
    <title>添加确认</title>
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
    ResultSet rs=add_bean.executeQuery("select distinct Exam_id from Exam");
    int i=1;
    try {
        while(rs.next())
        {
           i++;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    out.println(i);
    String[] major_id=request.getParameterValues("major_id");
    for (String m: major_id) {
        String sql="insert into Exam(Exam_id,Exam_name,OnloadTea_id,major_id)  values('exam"+i+"','"+request.getParameter("Exam_name")+"','"+request.getParameter("Tea_id")+"','"+m+"')";
       out.println(sql);
        add_bean.executeInsert(sql);
    }
%>
<div id="time">添加成功！3 秒后跳转回</div>
</body>
</html>
