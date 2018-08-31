package com.sql;

import java.sql.*;

/**
 * Created by Éµ±Æ on 2017/9/30.
 */
public class SQL {
    public Connection conn = null;
    public ResultSet rs = null;
    private String DatabaseDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String DatabaseConnStr = "jdbc:sqlserver://localhost:1433;DatabaseName=Exam";
    private String User = "zheng";
    private String Pass = "zws19970423";
    public boolean isConn()
    {
        if(conn != null)
        {
            return true;
        }
        return false;
    }
    public boolean isResultSet()
    {
        if(rs != null)
        {
            return true;
        }
        return false;
    }
    public String getDatabaseConnStr() {
        return DatabaseConnStr;
    }

    public void setDatabaseConnStr(String databaseConnStr) {
        DatabaseConnStr = databaseConnStr;
    }

    public String getDatabaseDriver() {
        return DatabaseDriver;
    }

    public void setDatabaseDriver(String databaseDriver) {
        DatabaseDriver = databaseDriver;
    }

    public SQL()
    {
        try {
            Class.forName(DatabaseDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public String getString(String name) throws SQLException {
        if(rs == null)
        {
            return ("ResuleSet is null");
        }
        return String.valueOf(rs.getString(name));
    }

    private void execute(String sql)
    {
        try {
            conn = DriverManager.getConnection(DatabaseConnStr,User,Pass);
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void executeInsert(String sql)
    {
        execute(sql);
    }
    public ResultSet executeQuery(String sql)
    {
        rs = null;
        try {
            conn = DriverManager.getConnection(DatabaseConnStr,User,Pass);
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
    public void executeDelete(String sql)
    {
        execute(sql);
    }
    public void CloseDatabase()
    {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        SQL sql=new SQL();
/*
        ResultSet rs = sql.executeQuery("select * from Student where Stu_id='1624133115' and password='1624133115' ");
        try {
            if(rs.next())
            {
                System.out.println("aaaaaaaaa");
                System.out.println(rs.getString("major"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
*/
   //     sql.executeDelete("delete from Student where Stu_id='student1'");
     //   sql.executeInsert("insert into major(major_id,major_name,Tea_id) values('major2 ','ÍøÂç ','teacher2') ");
        ResultSet rs = sql.executeQuery("select * from Score where Exam_id='exam1 ' and Stu_id='student2'");
        try {
            while(rs.next())
            {
                System.out.println(rs.getString("score"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

     //   sql.executeQuery("select major_id,Stu_id from Student where Stu_id='student0 '");

    }
}
