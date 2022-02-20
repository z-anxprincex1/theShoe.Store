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
    
    a {
    	text-decoration: none;
    }
</style>
</head>
<body class="mainBG" style='overflow: hidden;'>
	<video
	style='position: fixed; top: 0; min-height: 100%; min-width: 100%; opacity: 0.4'
	 autoplay muted loop>
  		<source src="./videos/Nike_SB_DontMakePlans.mp4" type="video/mp4">
	</video>
	<h1 class = 'helloUserH1' 
	style='position: absolute; font-size: 20rem; transform: rotate(30deg);
		opacity: 0.33;'>
		heyyyy
	</h1>
	
	<h1 class="mainBG-Header">Hello, <br><span class='helloUser'>User!</span></h1>
    <h3 class="mainBG-P">Login</h3>
    <div style="position: relative; margin-top: 10%;">
    </div>
        <div class="userLoginPane">
            <form action="loginAttempt.jsp" method="post">
                <label>E-Mail</label>
                <input id="userEmailVal" type="text" name="userEmailVal" required>
    
                <label>Password</label>
                <input type="password" name="userPasswordVal" required>
    
                <input id="loginButton" class="btn-primary" type="submit"
                style="font-size: 1rem;
                border-radius: 5px; 
                width: 40%;
                margin-top: 1rem;">
                <p style="position: relative; top: 0.8rem;"><a href="./signup.jsp">Don't have an account?&nbsp;<span>Get Signed-Up Here!</span></a></p>
            </form>
            <script>
            	var loginButton = document.querySelector("#loginButton");
            	var userEmail = document.querySelector("#userEmailVal");
            	var helloUser = document.querySelector(".helloUser");
            	var helloUserH1 = document.querySelectorAll(".helloUserH1");
            	
            	console.log(helloUser.childNodes[0]);
            	console.log(helloUserH1.childNodes);
            	console.log(helloUserH1);
            	
            	loginButton.addEventListener("click", () => {
            		sessionStorage.setItem("userEmail", document.querySelector("#userEmailVal").value);
            	});
            	
            	userEmail.addEventListener("keyup", () => {
            		helloUser.childNodes[0].nodeValue = document.querySelector("#userEmailVal").value;
            		helloUserH1.forEach((item) => {
            			item.innerText = document.querySelector("#userEmailVal").value;
            		});
            	});
            </script>
        </div>
    </div>
</body>
</html>