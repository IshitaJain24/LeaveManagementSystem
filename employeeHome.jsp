<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
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
            max-width: 500px;
            width: 90%;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 30px;
            color: var(--glow-color);
        }

        .username {
            color: #fff;
            background: linear-gradient(45deg, #00f2ff, #ff00f2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 20px 0;
        }

        a {
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            padding: 12px 24px;
            border-radius: 10px;
            display: inline-block;
            background: linear-gradient(135deg, #00f2ff 0%, #ff00f2 100%);
            box-shadow: 0 0 12px rgba(0, 255, 255, 0.3);
            transition: all 0.3s ease-in-out;
        }

        a:hover {
            background: linear-gradient(135deg, #ff00f2 0%, #00f2ff 100%);
            box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="glass-box">
        <h2>🌟 Welcome Employee: <span class="username"><%= username %></span></h2>
        <ul>
            <li><a href="applyLeave.jsp">📝 Apply for Leave</a></li>
            <li><a href="viewStatus.jsp">📊 View Leave Status</a></li>
            <li><a href="index.jsp">🚪 Logout</a></li>
        </ul>
    </div>
</body>
</html>
