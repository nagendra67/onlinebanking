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
Statement statement1 = null;
Statement statement2 = null;
Statement statement3 = null;
Statement statement4 = null;
ResultSet resultSet1 = null;
ResultSet resultSet2 = null;
ResultSet resultSet3 = null;
ResultSet resultSet4 = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>fund transfer</title>
</head>
<body>
<table border="3" width=500 height=250px>
<tr>
<td>tid</td>
<td>accnumber</td>
<td>debitamnt</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+dataBase,userid,password);
statement4=connection.createStatement();
//query to retrieve accountbalance from database
String sql3 ="select accbalance from shyam.user";
resultSet4 = statement4.executeQuery(sql3);
resultSet4.next();
//query to assign account balance to variable datat in order to validate transactions 
double datat=resultSet4.getDouble(1);
//checking whether the balance amount in the account is sufficient for fund transfer
if(datat > 1000)
{
statement1=connection.createStatement();
//query to insert a row into transactions table
String sql ="insert into shyam.transactions(accnumber,debitamnt) values(123456,1000)";
statement1.executeUpdate(sql);
statement3=connection.createStatement();
//query to update account balance for the table in database
String sql2 ="update shyam.user set accbalance=(accbalance-1000)";
statement3.executeUpdate(sql2);
out.println("Money Debited 1000 rs/-");
}
statement2=connection.createStatement();
//query to display the table of last 5 transactions using limit keyword
String sql1 ="select * from shyam.transactions ORDER BY tid DESC LIMIT 5";
resultSet2= statement2.executeQuery(sql1);
while(resultSet2.next()){
%>
<tr>
<td><%=resultSet2.getInt("tid") %></td>
<td><%=resultSet2.getInt("accnumber") %></td>
<td><%=resultSet2.getDouble("debitamnt") %></td>
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
