<%@ page import="java.sql.*" %>
<%@ page import="com.sql.SQL" %>
<%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/1
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆确认</title>
</head>
<body>

<%
    SQL sqlBean= new SQL();
    request.setCharacterEncoding("utf-8");
    String User_id = request.getParameter("User_Id");
    String User_pass = request.getParameter("User_Pass");
    String User = request.getParameter("User");
    if(User_id.equals("")|| User_pass.equals(""))
    {
        response.sendRedirect("login.jsp");
    }
    if(User.equals("管理员") )
    {
        if(User_id.equals("admin")&& User_pass .equals("admin") )
        {
            session.setAttribute("kind","admin");
            response.sendRedirect("Admin_control\\Admin_login.jsp");
        }
    }
    String sql;
    if(User.equals("学生") ) {
        sql = "select * from Student where Stu_id='" + User_id + "' and password='"+User_pass+"'";
        out.println(sql);
        ResultSet rs = sqlBean.executeQuery(sql);

        try {
            if (rs.next()) {
                session.setAttribute("kind","student");
                session.setAttribute("Student_id", User_id);
                response.sendRedirect("Student_control\\Student_login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
     if(User.equals("教师") ) {
         sql = "select * from Teacher where Tea_id='" + User_id + "' and password='" + User_pass+"'";
         ResultSet rs = sqlBean.executeQuery(sql);
         try {
             if (rs.next()) {
                 session.setAttribute("kind","teacher");
                 session.setAttribute("Teacher_id", User_id);
                 response.sendRedirect("Teacher_control\\Teacher_login.jsp");
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
    out.println("请检查账号密码是否出错");
  //  out.println(User_id+User_pass+User);
   // response.sendRedirect("login.jsp");
%>
</body>
</html>
