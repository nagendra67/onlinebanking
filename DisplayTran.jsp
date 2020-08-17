<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("tid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dataBase="shyam";
String userid = "root";
String password = "Sairam@98";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Last 5 Transactions</title>
</head>
<body>
<table border="2" width=500 height=250px>
<tr>
<td>tid</td>
<td>accnumber</td>
<td>debitamnt</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+dataBase,userid,password);
statement=connection.createStatement();
String sql ="select * from shyam.transactions ORDER BY tid DESC LIMIT 5";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("tid") %></td>
<td><%=resultSet.getInt("accnumber") %></td>
<td><%=resultSet.getDouble("debitamnt") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>