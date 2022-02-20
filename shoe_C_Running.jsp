<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>Running</title>
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

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<h1 style='position: fixed; bottom: 0; font-size: 28rem; opacity: 0.05;'>Running</h1>
<h1 style='color:#7900FF; position: fixed; left: 2%; bottom: 4%; font-size: 28rem; opacity: 0.05;'>Running</h1>		
<h1 style='position: fixed; left: 4%; bottom: 8%; font-size: 28rem; opacity: 0.025;'>Running</h1>		
<h1 style='position: fixed; left: 6%; bottom: 12%; font-size: 28rem; opacity: 0.012;'>Running</h1>		
<h1 style='position: fixed; left: 8%; bottom: 16%; font-size: 28rem; opacity: 0.006;'>Running</h1>		
<h1 style='position: fixed; left: 10%; bottom: 20%; font-size: 28rem; opacity: 0.003;'>Running</h1>

<h1 style="display: inline; position: fixed; top: 12%; left: 50%; font-size: 5rem; font-weight: 500">Running</h1>
<h1 style="display: inline; position: fixed; top: 13%; left: 50.5%; font-size: 5rem; font-weight: 500; opacity:0.2">Running</h1>
	<%
		String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8";
		String username = "root";
		String password =  "Anandprince1";
		
		String query = "select shoeID, shoeName, shoeDesc, shoePrice, shoeImgSrc, shoeStock from shoedb_shoeStore1" +
		" where shoeType = 'running'";
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, username, password);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
	%>
	<div class="navbar bg-dark" style='padding-right:100px;'>
        <a class="navbar-brand" href='./shoe_C_Jordans.jsp' style="text-decoration: none; font-weight: bolder; font-size: 4rem; color: white; position: relative; left: 5%;">theShoe.Store</a>
    	
    	<% // Drop-down %>
    	<div class = "dropdown" style='position:relative; left: 30%;'>
    		<button type = "button"
    		class = "btn btn-dark dropdown-toggle"
    		data-toggle = "dropdown"
    		aria-haspopup = "true">Categories</button>
    		<div class="dropdown-menu"
    		aria-labelledby = "dropdownMenuButton"
    		>	
    			<a class = "dropdown-item"
    			href = "./shoe_C_Jordans.jsp">Jordans</a>
    			<a class = "dropdown-item"
    			href = "./shoe_C_Lifestyle.jsp">Lifestyle</a>
    			<a class = "dropdown-item"
    			href = "./shoe_C_Running.jsp">Running</a>
    		</div>
    	</div>
    	
    	<% // Drop-down %>
    	
    	<a style='cursor: pointer; position: relative; left: 15%;' class="cart_link"><img width=25px src='./img/icons/shopping-cart.png'></a>
    
    <% // Sign Out Button %>
    
    <button class='btn btn-dark signOutButton'>Sign Out!</button>
    
    </div>
       
       <div class="mainContent">
			<%
			
			int i = 1;
			int j = 1;
			while(rs.next()) {
				if(i == 4) {
					j++;
					i = 1;
				}
				
				int shoeID = rs.getInt("shoeID");
				String shoeName = rs.getString("shoeName");
				String shoeDesc = rs.getString("shoeDesc");
				int shoePrice = rs.getInt("shoePrice");
				String shoeImgSrc = rs.getString("shoeImgSrc");
				int shoeStock = rs.getInt("shoeStock"); 
				
				out.println("<div class='content' value='" + shoeName + "'>"
						+ "<div><p class='content-header' style='color: grey; opacity: 0.8'>" + shoeName + "<p></div>"
						+ "<img class='content-test1' width=500px src='" + shoeImgSrc + "'>"
							+ "<h1 class='content-test1'>$" + shoePrice + "</h1>"
							+ "<button class='buyNow-Btn content-test1 btn-primary' value='" + shoeName + "'>Buy Now</button>"
						+ "</div>");
				i++;
			}
		%>
		
      </div>
      <div class="bottomHeader">
        <h3 style="color:white;font-size: 7rem;">walk the talk</h3>
    </div>
    <script>
    	var buyNow = document.querySelectorAll(".buyNow-Btn");
  		var content = document.querySelectorAll(".content");
  		
  		var cart_link = document.querySelectorAll(".cart_link");
  		
  		var signOutButton = document.querySelectorAll(".signOutButton");
  		
  		buyNow.forEach((buyButton) => {
  			buyButton.addEventListener("click", () => {
  				console.log("Button Click!");
  				console.log(buyButton.value);
  				sessionStorage.setItem("shoeName", buyButton.value);
  				window.open('./executeBuyNow.jsp?shoeName=' + sessionStorage.getItem('shoeName') + '&&userEmail=' + sessionStorage.getItem('userEmail'), '_blank');
  			});
  		});
  		
  		cart_link.forEach((cartItem) => {
  			cartItem.addEventListener("click", () => {
  				window.location.replace('./cart1.jsp?userEmail=' + sessionStorage.getItem('userEmail'));
  			});
  		});
  		
  		signOutButton.forEach((so) => {
  			so.addEventListener("click", () => {
  				window.location.replace('./signOut.jsp');
  			});
  		});
    </script>
    <script src="./Content.js"></script>
</body>
</html>