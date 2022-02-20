<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8";
	String username = "root";
	String password = "Anandprince1";
	
	// Remove Item;
	
	String removeItemQuery = "delete from orders_shoeStore1"
			+ " where orderID = " + request.getParameter("orderID");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con1 = DriverManager.getConnection(url, username, password);
	
	PreparedStatement prep1 = con1.prepareStatement(removeItemQuery);
	
	prep1.executeUpdate();
	
	con1.close();
	prep1.close();
%>
<script type='text/javascript'>
	window.close();
</script>
</body>
</html>