<%@ page import="com.sql.SQL" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/3
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url="";
    String kind=request.getParameter("kind");

    url=request.getParameter("url");
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
            time.innerHTML ="添加成功！"+times+" 秒后跳转回";
        }
    </script>
    <title>添加</title>
</head>
<body>
<%
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String[] major=new String[100];
   // out.println(name+id+password+major+kind);
    SQL add_sql=new SQL();

    if(kind.equals("Student"))
    {
        major[0]=request.getParameter("major");
        String sql="select major_id from major where major_name='"+major[0]+"'";
        ResultSet rs=add_sql.executeQuery(sql);
        try {
            if(rs.next())
            {
                major[0]=rs.getString("major_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sql="insert into Student(Stu_name,Stu_id,password,major_id) values('"+name+"','"+id+"','"+password+"','"+major[0]+"')";
        add_sql.executeInsert(sql);
    }
    else if(kind.equals("Teacher"))
    {
        String sql="insert into Teacher(Tea_name,Tea_id,password) values('"+name+"','"+id+"','"+password+"')";
        add_sql.executeInsert(sql);
        major= request.getParameterValues("major_name");
        Map<String,String> major_map= new HashMap<String,String>();
        if(major!=null&&major.length>0)
        {
            for(String m:major)
            {
                // sql="insert major(major_name,major_id,Tea_id) values()";
               // out.println(m);
                ResultSet rs=add_sql.executeQuery("select distinct major_id from major where major_name='"+m+"'");
               // out.println("select major_id from major where major_name='"+m+"'<br>");
                try {
                    if(rs.next())
                    {
                        major_map.put(rs.getString("major_id"),m);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            for (Object o : major_map.entrySet()) {
                Map.Entry entry = (Map.Entry) o;
                Object k = entry.getKey();
                Object m = entry.getValue();
                add_sql.executeInsert("insert into major(major_id,major_name,Tea_id) values('" + k + "','" + m + "','" + id + "')");
               // out.println("insert into major(major_id,major_name,Tea_id) values('" + k + "','" + m + "','" + id + "')");
            }
        }
    }
   // out.println(sql);
    else if(kind.equals("Exam"))
    {
        String Tea=request.getParameter("Tea");
        ResultSet rs=add_sql.executeQuery("select distinct Tea_id from Teacher where Tea_name='"+Tea+"'");
        try {
            if(rs.next())
            {
                Tea=rs.getString("Tea_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        major[0]=request.getParameter("major");
        rs=add_sql.executeQuery("select distinct major_id from major where major_name='"+major[0]+"'");
        try {
            if(rs.next())
            {
                major[0]=rs.getString("major_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql="insert into Exam(Exam_id,Exam_name,OnloadTea_id,major_id) values('"+id+"','"+name+"','"+Tea+"','"+major[0]+"')";
        add_sql.executeInsert(sql);
    }
%>
<div id="time">添加成功！3 秒后跳转回</div>
</body>
</html>
