<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body class="mainBG">
        <%
        	String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8";
        	String username = "root";
        	String password = "Anandprince1";
        	
        	// SQL Query;
        	String subQuery1 = "select userFirstName, userLastName, userEmail from userDetails_shoeStore2 where userEmail='damn'".replaceAll("damn", request.getParameter("userEmailVal"));
        	String subQuery2 = " and userPassword = 'damn'".replaceAll("damn", request.getParameter("userPasswordVal"));
        	String query = subQuery1 + subQuery2;
        	
        	Class.forName("com.mysql.jdbc.Driver");
        	
        	Connection con = DriverManager.getConnection(url, username, password);
        	
        	Statement st = con.createStatement();
        	
        	ResultSet rs = st.executeQuery(query);
        	
        	if(rs.next()) {
        		while(rs.next()) {
        			String email = rs.getString("userEmail");
        			int userID = Integer.parseInt(rs.getString("userID"));
        			String name = rs.getString("userFirstName") + rs.getString("userLastName");
        			session.setAttribute("userName", name);
        			session.setAttribute("userEmail", email);
        			session.setAttribute("userID", userID);
        		}
        		out.println("<script>swal('Successfully Logged In!', '', 'success').then(() => {window.location.replace('./shoe_C_Jordans.jsp')});</script>");
        	} else {
        		out.println("<script>swal('Invalid Credentials', 'Please Check Your E-Mail Or Password!', 'error').then(() => {window.location.replace('./login.jsp')});</script>");
        	}
        %>
    </div>
</body>
</html>