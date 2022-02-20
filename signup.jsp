<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up!</title>
<link rel="stylesheet" href="./mainPage.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>sessionStorage.setItem("submitCheck", false);</script>
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
</head>
<body class="mainBG">
    <h1 class="mainBG-Header">Hello, <br> User!</h1>
    <h3 class="mainBG-P">Sign-Up <span style="background: white; border-radius: 50%; position: relative; top: 2px;">&nbsp;>&nbsp;</span> Get Started!</h3>
    <div class="userLoginPane">
        <form action="signupSuccess.jsp" method="post">
            <table>
            	<tr>
            		<td style="padding-right: 10%;">
            			<label style="position: relative; right: 35%;">First Name</label>
            			<input class="userFirstNameVal" style="width: 250px;" type="text" name="userFirstNameVal" required>
            		</td>
            		<td style="padding-left: 10%">
            			<label style="position: relative; right: 35%;">Last Name</label>
            			<input class="userSecondNameVal" style="width: 250px;" type="text" name="userLastNameVal" required></td>
            	
            		</td>	
            	</tr>
            </table>
    
            <label>E-Mail</label>
            <input class="userEmailVal" type="text" name="userEmailVal" required>
    
            <label>Password</label>
            <input type="password" name="userPasswordVal" required>
    
            <label>Address</label>
            <input type="text" name="userAddressVal" required>
    
            <label>Phone</label>
            <input type="number" name="userPhoneVal" required>
    
            <input class="btn-primary" id="submitBtn" type="submit"
             style="font-size: 1rem; 
             border-radius: 5px; 
             width: 40%;
             margin-top: 1rem;">
        </form>
    </div>
    <script type="text/javascript">
    	var submitButton = document.querySelector("#submitBtn");
    	
    	submitButton.addEventListener("click", ()=> {
    		sessionStorage.setItem("submitCheck", "true");
    		sessionStorage.setItem("email", document.querySelector(".userEmailVal").value);
    	});
    </script>
</body>
</html>