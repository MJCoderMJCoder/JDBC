<%@ page contentType="text/html;  charset=GBK"  language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Access数据库</title>
</head>
<body>
从Access数据库读取表数据：<hr>
<table border=1>
<tr><td>学号</td><td>姓名</td><td>成绩</td></tr>
<%
    String driverName="sun.jdbc.odbc.JdbcOdbcDriver"; //定义JDBC-ODBC驱动程序对象
    String dbName="TestDB"; //定义数据库名  
    String tableName="student"; //定义数据库中的表名
    String userName=""; //定义数据库用户名  
    String userPasswd=""; //定义数据库存取密码  
    String conURL="jdbc:odbc:"+dbName; //定义JDBC的URL对象
    String sql="SELECT * FROM "+tableName;  //定义SQL语言对象
    Class.forName(driverName); //加载JDBC-ODBC驱动程序
    Connection con=DriverManager.getConnection(conURL,userName,userPasswd);//连接数据库
    Statement s=con.createStatement();  //定义查询数据库的对象  
    ResultSet rs=s.executeQuery(sql); //得到student表查询的结果集
    while(rs.next())
    {
	    out.println("<tr>");
	    out.println("<td>"+rs.getString("id")+"</td>");
	    out.println("<td>"+rs.getString("name")+"</td>");
	    out.println("<td>"+rs.getInt("score")+"</td>");
	    out.println("</tr>");
    }
    rs.close();
    s.close();  //释放Statement所连接的数据库及JDBC资源
    con.close(); //关闭与数据库的连线
%>  
</table>
</body>
</html>