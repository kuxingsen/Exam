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
            time.innerHTML ="修改成功！"+times+" 秒后跳转回";
        }
    </script>

    <title>确认修改</title>
</head>
<body>

<jsp:useBean id="modify_bean" class="com.sql.SQL" scope="page"/>
<%
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    String password=request.getParameter("password");
    String[] major=new String[100];
    String[] major_id=new String[100];

    String old_id=request.getParameter("old_id");
%>
<%
    if(kind.equals("Student"))
    {
        /*转专业后无法删除原分数
        ResultSet rs=modify_bean.executeQuery("select major_id,Stu_id from Student where Stu_id='"+old_id+"'");
        try {

            if(rs.next())
            {
                out.println("hjhjghghhg"+rs.getString(major_id));
                if(!(major_id.equals(rs.getString(major_id))))//如果转专业
                {
                    String sql="select Exam_id from Exam where major_id='"+rs.getString(major_id)+"' and major_id!='"+major_id+"'";
                    out.println(sql);
                    ResultSet rs2=modify_bean.executeQuery(sql);//rs2为原专业独有的考试集合
                    while(rs2.next())
                    {
                        modify_bean.executeDelete("delete from score where Exam_id='"+rs2.getString("Exam_id")+"'");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        */
        major[0]=request.getParameter("major");
        ResultSet rs0=modify_bean.executeQuery("select major_id from major where major_name='"+major[0]+"'");
        try {
            if(rs0.next())
            {
                major_id[0]= rs0.getString("major_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



        String sql="update Student set Stu_name='"+name+"',Stu_id='"+id+"',password='"+password+"',major_id='"+major_id[0]+"' where Stu_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
        sql="update Score set Stu_id='"+id+"' where Stu_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
    }
    else if(kind.equals("Teacher"))
    {
        major= request.getParameterValues("major_name");
        Map<String,String> major_map= new HashMap<String,String>();
        if(major!=null&&major.length>0)
        {
            for(String m:major)
            {
               // sql="insert major(major_name,major_id,Tea_id) values()";
                ResultSet rs=modify_bean.executeQuery("select * from major where major_name='"+m+"'");
                try {
                    if(rs.next())
                    {
                        major_map.put(rs.getString("major_id"),m);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            String sql="delete from major where Tea_id='"+old_id+"'";
            modify_bean.executeDelete(sql);

            for (Object o : major_map.entrySet()) {
                Map.Entry entry = (Map.Entry) o;
                Object k = entry.getKey();
                Object m = entry.getValue();
                modify_bean.executeInsert("insert into major(major_id,major_name,Tea_id) values('" + k + "','" + m + "','" + id + "')");
            }
        }

        String sql="update Teacher set Tea_name='"+name+"',Tea_id='"+id+"',password='"+password+"'where Tea_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
        sql="update Exam set OnloadTea_id='"+id+"' where OnloadTea_id='"+old_id+"'";
        modify_bean.executeInsert(sql);
    }
    else if(kind.equals("Exam"))
    {
        String Tea=request.getParameter("Tea");
        ResultSet rs=modify_bean.executeQuery("select distinct Tea_id from Teacher where Tea_name='"+Tea+"'");
        try {
            if(rs.next())
            {
                Tea=rs.getString("Tea_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        major[0]=request.getParameter("major");
        rs=modify_bean.executeQuery("select distinct major_id from major where major_name='"+major[0]+"'");
        try {
            if(rs.next())
            {
                major[0]=rs.getString("major_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String old_name=request.getParameter("old_name");
        String old_tea=request.getParameter("old_tea");
        String old_major=request.getParameter("old_major");

        String sql="update Exam set major_id='"+major[0]+"',Exam_id='"+id+"',Exam_name='"+name+"',OnloadTea_id='"+Tea+"' where Exam_id='"+old_id+"' and Exam_name='"+old_name+"' and OnloadTea_id='"+old_tea+"' and major_id='"+old_major+"'";
        modify_bean.executeInsert(sql);
    }

%>

<div id="time">修改成功！3 秒后跳转回</div>
</body>
</html>
