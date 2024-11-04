<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; flex-direction: column; align-items: center; padding-top: 50px; }
        h1 { color: #333; }
        form { margin: 20px; }
        input[type="text"], input[type="password"] { margin: 5px 0; padding: 8px; width: 200px; }
        input[type="submit"] { padding: 8px 20px; background-color: #007BFF; color: white; border: none; cursor: pointer; }
        input[type="submit"]:hover { background-color: #0056b3; }
        .message { color: red; }
    </style>
</head>
<body>
	<h1>Tollgate Collection Entry Details</h1>
    <h1>Login</h1>
    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
</body>
</html>
