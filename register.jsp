<!DOCTYPE html>
<html>
<head>
    <title>Register or Login</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; flex-direction: column; align-items: center; padding-top: 50px; }
        h1 { color: #333; }
        form { margin: 20px; }
        input[type="text"], input[type="password"] { margin: 5px 0; padding: 8px; width: 200px; }
        input[type="submit"] { padding: 8px 20px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
        input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>
	<h1>Tollgate Collection Entry Details</h1>
    <h1>Welcome! Register</h1>

    <h2>Register</h2>
    <form action="RegisterServlet" method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" value="Register">
    </form>
    
    <h2>Already have an account? <a href="login.jsp">Login here</a></h2>
</body>
</html>
