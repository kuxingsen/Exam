<%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/3
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url=request.getHeader("Referer");
%>
<html>
<head>
    <title>删除</title>
    <meta http-equiv= "Refresh" content= "3;url=<%=url%> ">
    <script language="javascript">
        var times=4;
        clock();
        function clock()
        {
            window.setTimeout('clock()',1000);
            times=times-1;
            time.innerHTML ="删除成功！"+times+" 秒后跳转回";
        }
    </script>
</head>
<body>
<jsp:useBean id="DEL" scope="page" class="com.sql.SQL"/>
<%
    String del_id[]=request.getParameterValues("del");
    String kind=request.getParameter("kind");
    if(kind.equals("Student"))
    {
        for (String aDel_id : del_id) {
            //out.println(del_id[i]);
            String sql = "delete from Student where Stu_id='" + aDel_id + "'";
            DEL.executeDelete(sql);
            sql = "delete from Score where Stu_id='" + aDel_id + "'";
            DEL.executeDelete(sql);
        }
    }
    else if(kind.equals("Teacher"))
    {
        for(String aDel_id:del_id)
        {
            String sql="delete from Teacher where Tea_id='"+aDel_id+"'";
            DEL.executeDelete(sql);
            sql="delete from major where Tea_id='"+aDel_id+"'";
            DEL.executeDelete(sql);

           /*需删除题目，试卷
            sql="delete from Exam where OnloadTea_id ='"+aDel_id+"'";
            DEL.executeDelete(sql);
            */
        }
    }
%>
<div id="time">删除成功！3 秒后跳转回</div>
</body>
</html>
