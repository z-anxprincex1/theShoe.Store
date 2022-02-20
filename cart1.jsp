<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet" href="./mainPage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style>
    form {
        max-width: 420;
        margin: 30px auto;
        background: white;
        text-align: left;
        padding: 40px;
        border-radius: 10px;
    }

    label {
        color: #aaa;
        display: inline-block;
        margin: 25px 0 15px;
        font-size: 0.6em;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: bold;
    }

    input {
        display: block;
        padding: 10px 6px;
        width: 100%;
        box-sizing: border-box;
        border: none;
        border-bottom: 1px solid #ddd;
        color: #555;
    }

    input[type="checkbox"] {
        display: inline-block;
        margin: 0 10px 0 0;
        position: relative;
        top: 3px;
        width: 2rem;
    }
    
</style>

	<link href="./Content.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./cartStyling.css">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body style='overflow: hidden;'>
<h1 style='position: fixed; bottom: 0; font-size: 28rem; opacity: 0.05;'>Checkout</h1>
<h1 style='color:#93FFD8; position: fixed; left: 2%; bottom: 4%; font-size: 28rem; opacity: 0.05;'>Checkout</h1>		
<h1 style='position: fixed; left: 4%; bottom: 8%; font-size: 28rem; opacity: 0.025;'>Checkout</h1>		
<h1 style='position: fixed; left: 6%; bottom: 12%; font-size: 28rem; opacity: 0.012;'>Checkout</h1>		
<h1 style='position: fixed; left: 8%; bottom: 16%; font-size: 28rem; opacity: 0.006;'>Checkout</h1>		
<h1 style='position: fixed; left: 10%; bottom: 20%; font-size: 28rem; opacity: 0.003;'>Checkout</h1>


<div class="navbar bg-dark" style='padding-right: 6.25rem;'>
        <a href="navbar-brand" style="text-decoration: none; font-weight: bolder; font-size: 4rem; color: white; position: relative; left: 5%;">theShoe.Store</a>
 <a style='cursor: pointer; position: relative; left: 30%;' class="previousPage"><img width=25px src='./img/icons/previous.png'></a>
    
    <% // Sign Out Button %>
    
    <button class='btn btn-dark signOutButton'>Sign Out!</button>
 
 </div>
 
 <div style='position: relative; right: 10%;'>
 <h1 style='color: #7900FF; margin: 0; padding: 0; text-align: right;'> <% out.println(request.getParameter("userEmail")); %><span style='color: black;'>'s Cart</span></h1>
 		<hr>
 </div>
 <div class='cart_parent'>
 	<%
 		String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8";
 		String username = "root";
 		String password = "Anandprince1";
 		
 		String userEmail = request.getParameter("userEmail");
 		
 		String getCartDetailsQuery = "select orderID, userID, userAddr, shoeID, shoeName, shoePrice, shoeImgSrc, userEmail"
 				+ " from orders_shoeStore1"
 				+ " where userEmail = '" + userEmail + "'";
 		
 		Class.forName("com.mysql.jdbc.Driver");
 		
 		Connection con1 = DriverManager.getConnection(url, username, password);
 		
 		Statement st1 = con1.createStatement();
 		
 		ResultSet rs1 = st1.executeQuery(getCartDetailsQuery);
 		
 		%>
 		
 		<%
 		
 		int numberOfItems = 0;
 		int grandTotal = 0;
 		int topPos = 0;
 		while(rs1.next()) {
 			int orderID = rs1.getInt("orderID");
			String userID = rs1.getString("userID");
			String userAddr = rs1.getString("userAddr");
			String shoeName = rs1.getString("shoeName");
			int shoePrice = rs1.getInt("shoePrice");
			String shoeImgSrc = rs1.getString("shoeImgSrc");
			String userEmailVal = rs1.getString("userEmail");
			
			out.println("<div class = 'cart_child'>"
					+ "<span class = 'orderID_Val'>Order ID:&nbsp;" + orderID + "</span>"
					+ "<span class =  'userID_Val'>User ID:&nbsp;" + userID + "</span>"
					+ "<br><span class = 'shoeName_Val'>Product:&nbsp;<b>" + shoeName + "</b></span>"
					+ "<br><span class = 'shoePrice_Val'>Price&nbsp;<b>$" + shoePrice + "</b></span>"
					+ "<br><div style = 'transform: rotate(-8deg);' class = 'shoeImg'><img width=600px src = '" + shoeImgSrc + "'></div>"
					+ "<br><span class = 'userAddr_Val'>Address To Be Shipped To:&nbsp;<b>" + userAddr + "</b></span>"
					+ "<br><span class = 'userEmail_Val'>E-Mail:&nbsp;<b>" + userEmail + "</b></span>"
					+ "<button class = 'btn-primary removeButton bg-dark' value = '" + orderID + "'>Remove Item</button>"
					+ "</div>");
			
			topPos += 60;
			numberOfItems += 1;
			grandTotal = grandTotal + shoePrice;
 		}
 		
 		con1.close();
 		st1.close();
 		rs1.close();
 	%>
 </div>
 <div class='grandTotalPrice'>
 	<h1><span>Grand Total&nbsp;</span>$<% out.println(grandTotal); %></h1>
 </div>
 <div class='checkoutButton'>
 	<button class='btn-primary checkoutButtonPressed' style='border-radius: 5px;'>Proceed To Checkout<img class='rightArrow_checkOut' src='./img/icons/right-arrow.png'></button>
 </div>
 <script type='text/javascript'>
 	var checkoutButton = document.querySelectorAll(".checkoutButtonPressed");
 	
 	var previous = document.querySelectorAll(".previousPage");
 	
 	var removeButton = document.querySelectorAll(".removeButton");
 	checkoutButton.forEach((buttonElement) => {
 		buttonElement.addEventListener("click", () => {
 			window.open('./checkout.jsp?userEmail=' + sessionStorage.getItem('userEmail')
 					+'&&numberOfItems=' + <%= numberOfItems%>);
 		});
 	});
 	
 	previous.forEach((previous) => {
 		previous.addEventListener("click", () => {
 			window.location.replace('./shoe_C_Jordans.jsp');
 		});
 	});
 	
 	removeButton.forEach((rem) => {
 		rem.addEventListener("click", () => {
 			window.open('./removeItem.jsp?orderID=' + rem.value, '_blank');
 			location.reload();
 		});
 	});
 </script>
</body>
</html>