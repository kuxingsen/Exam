<%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/9/30
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
</head>
<body>
<form action="login_con.jsp" id="Login_form" method = "post">
    <table align="center">
        <thead> 请登录 </thead><br/>
        <tr>姓名：<input type="text" value="" name="User_Id"><br/></tr>

        <tr>密码：<input type="password" name = "User_Pass"><br/></tr>
        <select name="User" id="User">
            <option name="admin">管理员</option>
            <option name = "Student">学生</option>
            <option name="Teacher">教师</option>
        </select>
        <input type="submit" value="登陆">&nbsp;&nbsp;
    </table>
</form>
</body>
</html>
