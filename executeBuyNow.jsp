<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

<%
	String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8";
	String username = "root";
	String password =  "Anandprince1";

%>
	  			<%	
	  			
	  				String userEmail = request.getParameter("userEmail");
	  				String shoeName = request.getParameter("shoeName");
	  				// Getting Shoe Details;
	  				String getShoeDetailsQuery = "select shoeID, shoePrice, shoeImgSrc from shoedb_shoeStore1" 
	  						+ " where shoeName = '" + shoeName + "'";
	  				
	  				Class.forName("com.mysql.jdbc.Driver");
	  				
	  				Connection con1 = DriverManager.getConnection(url, username, password);
	  				Statement st1 = con1.createStatement();
	  				ResultSet rs1 = st1.executeQuery(getShoeDetailsQuery);
	  				
	  				int sID = 0;
	  				int sPrice = 0;
	  				String sImgSrc = ""; 
	  				while(rs1.next()) {
	  					sID = rs1.getInt("shoeID");
	  					sPrice = rs1.getInt("shoePrice");
	  					sImgSrc = rs1.getString("shoeImgSrc");
	  				}
	  				
	  				con1.close();
	  				st1.close();
	  				rs1.close();
	  				
	  				
	  				// Get User Details;
	  				
	  				String getUserDetailsQuery = "select userID, userAddress, userPhone from "
	  						+ "userDetails_shoeStore2 where userEmail = '" + userEmail + "'";
	  				
	  				Class.forName("com.mysql.jdbc.Driver");
	  				
	  				Connection con2 = DriverManager.getConnection(url, username, password);
	  				
	  				Statement st2 = con2.createStatement();
	  				
	  				ResultSet rs2 = st2.executeQuery(getUserDetailsQuery);
	  				
	  				int userID = 0;
	  				String userAddress = "";
	  				long userPhone = 0;
	  				
	  				while(rs2.next()) {
	  					userID = rs2.getInt("userID");
	  					userAddress = rs2.getString("userAddress");
	  					userPhone = rs2.getLong("userPhone");
	  				}
	  				
	  		        // Submit Query;
	  		        
	  		        String buyQuery = "insert into orders_shoeStore1" 
	  		        		+ "(userID, userAddr, shoeId, shoeName, shoePrice, shoeImgSrc, userEmail)" 
	  		        		+ " values(?, ?, ?, ?, ?, ?, ?)";
	  		        
	  		        Class.forName("com.mysql.jdbc.Driver");

	  		        Connection con3 = DriverManager.getConnection(url, username, password);
	  		        
	  		        PreparedStatement prepStatement = con3.prepareStatement(buyQuery);
	  		        
	  		        prepStatement.setInt(1, userID);
	  		        prepStatement.setString(2, userAddress);
	  		        prepStatement.setInt(3, sID);
	  		        prepStatement.setString(4, shoeName);
	  		        prepStatement.setInt(5, sPrice);
	  		        prepStatement.setString(6, sImgSrc);
	  		        prepStatement.setString(7, userEmail);
	  		        
	  		        prepStatement.executeUpdate();
	  		        prepStatement.close();
	  		        con3.close();

%>
<script>
window.close();
</script>
</body>
</html>