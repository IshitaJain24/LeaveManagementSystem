package com.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageLeaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "root");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(
                "SELECT l.id, u.username, l.start_date, l.end_date, l.reason, l.status FROM leave_applications l JOIN users u ON l.user_id = u.id");

            out.println("<html><head><title>Manage Leave Applications</title>");
            out.println("<link href='https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap' rel='stylesheet'>");
            out.println("<style>");
            out.println(":root { --glow-color: #0ff; --bg-glass: rgba(255, 255, 255, 0.05); --border-glass: rgba(255, 255, 255, 0.15); --bg-dark: #0f0f0f; --text: #e0e0e0; }");
            out.println("body { margin: 0; padding: 0; font-family: 'Share Tech Mono', monospace; background: radial-gradient(circle at top left, #111 0%, #000 100%); color: var(--text); }");
            out.println(".container { max-width: 1000px; margin: 50px auto; padding: 30px; background: var(--bg-glass); border: 1px solid var(--border-glass); border-radius: 16px; backdrop-filter: blur(10px); box-shadow: 0 0 20px rgba(0,255,255,0.1), 0 0 60px rgba(0,255,255,0.05); }");
            out.println("h3 { text-align: center; color: var(--glow-color); font-size: 24px; margin-bottom: 30px; }");
            out.println("table { width: 100%; border-collapse: collapse; background: rgba(255,255,255,0.03); border-radius: 8px; overflow: hidden; }");
            out.println("th, td { padding: 14px 16px; text-align: left; border-bottom: 1px solid rgba(255,255,255,0.1); }");
            out.println("th { background: linear-gradient(135deg, #00f2ff, #ff00f2); color: white; }");
            out.println("td { color: var(--text); }");
            out.println("a { text-decoration: none; color: #0ff; font-weight: bold; }");
            out.println("a:hover { color: #ff00f2; }");
            out.println(".back-button { display: inline-block; margin-top: 30px; padding: 12px 24px; background: linear-gradient(135deg, #00f2ff, #ff00f2); color: white; border: none; border-radius: 10px; text-align: center; font-size: 16px; text-decoration: none; box-shadow: 0 0 12px rgba(0, 255, 255, 0.3); transition: all 0.3s ease-in-out; }");
            out.println(".back-button:hover { background: linear-gradient(135deg, #ff00f2, #00f2ff); transform: scale(1.05); box-shadow: 0 0 20px rgba(255, 0, 255, 0.4); }");
            out.println("</style>");
            out.println("</head><body>");
            out.println("<div class='container'>");
            out.println("<h3>📋 Manage Leave Applications</h3>");
            out.println("<table><tr><th>User</th><th>Start Date</th><th>End Date</th><th>Reason</th><th>Status</th><th>Action</th></tr>");

            while (rs.next()) {
                int lid = rs.getInt("id");
                String username = rs.getString("username");
                java.sql.Date startDate = rs.getDate("start_date");
                java.sql.Date endDate = rs.getDate("end_date");
                String reason = rs.getString("reason");
                String status = rs.getString("status");

                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + startDate + "</td>");
                out.println("<td>" + endDate + "</td>");
                out.println("<td>" + reason + "</td>");
                out.println("<td>" + status + "</td>");
                out.println("<td><a href='updateLeave?id=" + lid + "&action=approve'>✅ Approve</a> | <a href='updateLeave?id=" + lid + "&action=reject'>❌ Reject</a></td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("<a href='adminHome.jsp' class='back-button'>🔙 Go Back</a>");
            out.println("</div></body></html>");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("❗ Error processing leave applications: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
