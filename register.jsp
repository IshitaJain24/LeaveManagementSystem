<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>User Registration</title>
    <link href='https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap' rel='stylesheet'>
    <style>
        :root {
            --bg-dark: #121212;
            --text-light: #e0e0e0;
            --highlight-color: #ff00f2;
            --btn-bg: #7b2ff7;
            --btn-hover: #5e1ec0;
            --border-glow: rgba(0, 255, 255, 0.5);
        }

        body {
            margin: 0;
            font-family: 'Share Tech Mono', monospace;
            background-color: var(--bg-dark);
            color: var(--text-light);
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        h2 {
            color: var(--highlight-color);
            font-size: 30px;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 12px;
            backdrop-filter: blur(10px);
            box-shadow: 0 0 20px var(--border-glow);
            max-width: 500px;
            width: 100%;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            background-color: rgba(255, 255, 255, 0.2);
            border: 1px solid #ddd;
            color: var(--text-light);
            border-radius: 8px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: var(--btn-bg);
            border: none;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: var(--btn-hover);
            transform: scale(1.05);
            box-shadow: 0 0 15px var(--border-glow);
        }

        a {
            color: var(--highlight-color);
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: #ff7fff;
        }

        p {
            margin-top: 20px;
        }

    </style>
</head>
<body>

    <div class="container">
        <h2>User Registration</h2>
        <form method="post" action="RegisterServlet">
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required /><br/>
            
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required /><br/>
            
            <label for="role">Role:</label>
            <select name="role" id="role">
                <option value="employee">Employee</option>
                <option value="admin">Admin</option>
            </select><br/>
            
            <input type="submit" value="Register" />
        </form>

        <p><a href="index.jsp">Back to Login</a></p>
    </div>

</body>
</html>
