<%@ page contentType="text/html;  charset=GBK"  language="java" import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Access���ݿ�</title>
</head>
<body>
��Access���ݿ��ȡ�����ݣ�<hr>
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
    s.close();  //�ͷ�Statement�����ӵ����ݿ⼰JDBC��Դ
    con.close(); //�ر������ݿ������
%>  
</table>
</body>
</html>