<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 傻逼
  Date: 2017/10/2
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>学生详细信息</title>
<script>
    function modify(name,id,password,major_id,major) {
       // window.location.href="Stu_modify.jsp?name='"+name+"'&id='"+id+"'&password='"+password+"'&major='"+major+"'";
       // location.href="Students_infor.jsp";
       // open("Stu_modify.jsp?name='"+name+"'&id='"+id+"'&password='"+password+"'&major='"+major+"'");
        aha.innerText=name+id+password+major;
    }
</script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="stu_detail" class="com.sql.SQL" scope="request"/>

<%
    String id="",name="",password="",major="",major_id="";
   // out.println(request.getParameter("stu_id"));
    try {
        String sql1 = "select * from Student s where s.Stu_id = '"+request.getParameter("stu_id")+"'";
        ResultSet rs1 = stu_detail.executeQuery(sql1);
        if(rs1.next())
        {
            ResultSet rs = stu_detail.executeQuery("select major_name from major where major_id='"+rs1.getString("major_id")+"'");
            if(rs.next())
            {
                major=rs.getString("major_name");
            }

            {
                id=rs1.getString("Stu_id");
                name=rs1.getString("Stu_name");
                password=rs1.getString("password");
                major_id=rs1.getString("major_id");
            }
            out.println("学号："+id+"<br>");
            out.println("姓名："+name+"<br>");
            out.println("密码："+password+"<br>");
            out.println("专业："+ major+"<br>");
            out.println("<table border=\"1\" bgcolor=\"#ff8c00\">\n" +
                    "    <tr>\n" +
                    "        <td>\n" +
                    "            教师\n" +
                    "        </td>\n" +
                    "        <td>\n" +
                    "            考试分数\n" +
                    "        </td>\n" +
                    "    </tr>");
            String sql2 = "select Tea_name,t.Tea_id from Teacher t ,major m where m.major_id='"+major_id+"' and "
                    +"t.Tea_id=m.Tea_id group by Tea_name,t.Tea_id";
            ResultSet rs2 = stu_detail.executeQuery(sql2);
            while(rs2.next()) {
                out.println("<tr><td>"+rs2.getString("Tea_name") + "</td><td>");
                // out.println(rs2.getString("major_name")+"<br>");

                String sql3 = "select Exam_name,Score from major m ,Exam e ,Score sc where m.major_id='" + major_id + "' and "
                        + "e.major_id=m.major_id and sc.Exam_id=e.Exam_id and sc.Stu_id = '" + id + "' and e.OnloadTea_id='"+rs2.getString("Tea_id")+"' group by Exam_name,Score";
                ResultSet rs3 = stu_detail.executeQuery(sql3);
                while (rs3.next()) {
                    out.println(rs3.getString("Exam_name") + "&nbsp;&nbsp;" + rs3.getString("Score") + "<br>");
                }
                out.println("</td></tr>");
            }
            out.println("</table>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    stu_detail.CloseDatabase();
%>
<br/>
<a href="Stu_modify.jsp?id=<%=id%>&name=<%=name%>&password=<%=password%>&major_id=<%=major_id%>&major=<%=major%>">
    <input type="button" value="修改">
</a>
<div id="aha"></div>
</body>
</html>
