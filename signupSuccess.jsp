<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up!</title>
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
        
        // Grabbing User Details;
        
        
        	String userFirstName = request.getParameter("userFirstNameVal");
        	String userLastName = request.getParameter("userLastNameVal");
        	String userEmail = request.getParameter("userEmailVal"),
        			userPassword = request.getParameter("userPasswordVal"),
        			userAddress = request.getParameter("userAddressVal");
        	String userPhone = request.getParameter("userPhoneVal");
        %>
        
        <%
        // Sending User Details;
        
        String url = "jdbc:mysql://localhost:3306/tst_x1?characterEncoding=utf-8",
        		username = "root",
        		password = "Anandprince1";
        
        // Submit Query;
        
        String query = "insert into userDetails_shoeStore2(userFirstName, userLastName, userEmail, userPassword, userAddress, userPhone) values(?, ?, ?, ?, ?, ?)";
        
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement prepStatement = con.prepareStatement(query);
        
        prepStatement.setString(1, userFirstName);
        prepStatement.setString(2, userLastName);
        prepStatement.setString(3, userEmail);
        prepStatement.setString(4, userPassword);
        prepStatement.setString(5, userAddress);
        prepStatement.setString(6, userPhone);
        
        prepStatement.executeUpdate();
        prepStatement.close();
        con.close();
        %>
    </div>
    <script>
    window.sessionStorage.submitCheck = sessionStorage.getItem("submitCheck");
    console.log(sessionStorage.submitCheck);
if(sessionStorage.submitCheck == 'false') {
	swal("Sign Up Failed!", "Please Try Again!", "error").then(() => {
		window.location.replace("./signup.jsp");
	});
} else if(sessionStorage.submitCheck == 'true') {
	swal("You're In!", "Hit Yayy! To Head To Login", "success", {button: "Yayy!"}).then(() => {
		window.location.replace("./login.jsp");
	});
}

</script>
</body>
</html>