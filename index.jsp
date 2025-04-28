<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Management System - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap" rel="stylesheet">
    <style>
        :root {
            --glow-color: #0ff;
            --bg-glass: rgba(255, 255, 255, 0.05);
            --border-glass: rgba(255, 255, 255, 0.15);
            --bg-dark: #0f0f0f;
            --text: #e0e0e0;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Share Tech Mono', monospace;
            background: radial-gradient(circle at top left, #111 0%, #000 100%);
            color: var(--text);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .glass-box {
            background: var(--bg-glass);
            border: 1px solid var(--border-glass);
            padding: 40px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            box-shadow: 0 0 20px rgba(0, 255, 255, 0.1), 0 0 60px rgba(0, 255, 255, 0.05);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 30px;
            color: var(--glow-color);
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0 20px;
            border: none;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text);
            font-size: 14px;
            font-family: 'Share Tech Mono', monospace;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #00f2ff 0%, #ff00f2 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 0 12px rgba(0, 255, 255, 0.3);
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #ff00f2 0%, #00f2ff 100%);
            box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);
            transform: scale(1.03);
        }

        .register-link {
            margin-top: 20px;
            font-size: 14px;
            color: #aaa;
        }

        .register-link a {
            color: #0ff;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="glass-box">
        <h2>🔐 Login</h2>
        <form method="post" action="LoginServlet">
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
        <div class="register-link">
            Don't have an account? <a href="register.jsp">Register here</a>
        </div>
    </div>
</body>
</html>
