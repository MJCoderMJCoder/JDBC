<%@ page contentType="text/html;  charset=GBK"  language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>数据库操作</title>
</head>
<body>
   <H3>从数据库读取表数据</H3><hr>
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
 %>
 </table>
 <%
   //向数据库插入记录
    PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?)"); 
    ps.setString(1,"0004");
    ps.setString(2,"王刚");
    ps.setInt(3,94);
    //使用SQL命令insert插入一条到student表中
    ps.execute();
    ps.close();
  %>
 <H3>插入后的数据库记录</H3><hr>
 <table border=1>
 <tr><td>学号</td><td>姓名</td><td>成绩</td></tr>
<%
    Statement s1=con.createStatement();  
    ResultSet rs1=s1.executeQuery(sql); 
    while(rs1.next())
    {
	    out.println("<tr>");
	    out.println("<td>"+rs1.getString("id")+"</td>");
	    out.println("<td>"+rs1.getString("name")+"</td>");
	    out.println("<td>"+rs1.getInt("score")+"</td>");
	    out.println("</tr>");
    }
    rs1.close();  
 %>  
 </table>
  <%
   //修改id="0004"的记录
    String up="update student set score=93 where id='0004'";
    PreparedStatement ps1=con.prepareStatement(up); 
    ps1.executeUpdate();
    ps1.close();
  %>
<H3>修改后的数据库记录</H3><hr>
<table border=1>
<tr><td>学号</td><td>姓名</td><td>成绩</td></tr> 
<%
    Statement s2=con.createStatement(); 
    ResultSet rs2=s2.executeQuery(sql);
    while(rs2.next())
    {
	    out.println("<tr>");
	    out.println("<td>"+rs2.getString("id")+"</td>");
	    out.println("<td>"+rs2.getString("name")+"</td>");
	    out.println("<td>"+rs2.getInt("score")+"</td>");
	    out.println("</tr>");
    }
    rs2.close();  
    s2.close();  //释放Statement所连接的数据库及JDBC资源
    con.close(); //关闭与数据库的连线
%>  
</table>
</body>
</html>