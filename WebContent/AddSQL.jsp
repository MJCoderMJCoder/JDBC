<%@ page contentType="text/html;  charset=GBK"  language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���ݿ����</title>
</head>
<body>
   <H3>�����ݿ��ȡ������</H3><hr>
<table border=1>
<tr><td>ѧ��</td><td>����</td><td>�ɼ�</td></tr>
<%
    String driverName="sun.jdbc.odbc.JdbcOdbcDriver"; //����JDBC-ODBC�����������
    String dbName="TestDB"; //�������ݿ���  
    String tableName="student"; //�������ݿ��еı���
    String userName=""; //�������ݿ��û���  
    String userPasswd=""; //�������ݿ��ȡ����  
    String conURL="jdbc:odbc:"+dbName; //����JDBC��URL����
    String sql="SELECT * FROM "+tableName;  //����SQL���Զ���
    Class.forName(driverName); //����JDBC-ODBC��������
    Connection con=DriverManager.getConnection(conURL,userName,userPasswd);//�������ݿ�
    Statement s=con.createStatement();  //�����ѯ���ݿ�Ķ���  
    ResultSet rs=s.executeQuery(sql); //�õ�student���ѯ�Ľ����
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
   //�����ݿ�����¼
    PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?)"); 
    ps.setString(1,"0004");
    ps.setString(2,"����");
    ps.setInt(3,94);
    //ʹ��SQL����insert����һ����student����
    ps.execute();
    ps.close();
  %>
 <H3>���������ݿ��¼</H3><hr>
 <table border=1>
 <tr><td>ѧ��</td><td>����</td><td>�ɼ�</td></tr>
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
   //�޸�id="0004"�ļ�¼
    String up="update student set score=93 where id='0004'";
    PreparedStatement ps1=con.prepareStatement(up); 
    ps1.executeUpdate();
    ps1.close();
  %>
<H3>�޸ĺ�����ݿ��¼</H3><hr>
<table border=1>
<tr><td>ѧ��</td><td>����</td><td>�ɼ�</td></tr> 
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
    s2.close();  //�ͷ�Statement�����ӵ����ݿ⼰JDBC��Դ
    con.close(); //�ر������ݿ������
%>  
</table>
</body>
</html>