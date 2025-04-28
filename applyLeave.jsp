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
    <title>Apply for Leave</title>
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

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="date"],
        textarea {
            padding: 10px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid var(--border-glass);
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--text);
            resize: none;
        }

        textarea {
            min-height: 80px;
        }

        input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            color: #fff;
            background: linear-gradient(135deg, #00f2ff 0%, #ff00f2 100%);
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 0 12px rgba(0, 255, 255, 0.3);
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #ff00f2 0%, #00f2ff 100%);
            box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="glass-box">
        <h2>📝 Apply for Leave</h2>
        <form action="ApplyLeaveServlet" method="post">
            <input type="date" name="start" required placeholder="Start Date" />
            <input type="date" name="end" required placeholder="End Date" />
            <textarea name="reason" placeholder="Reason for leave" required></textarea>
            <input type="submit" value="Apply Leave" />
        </form>
    </div>
</body>
</html>
