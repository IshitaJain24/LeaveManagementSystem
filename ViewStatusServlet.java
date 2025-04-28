package com.lms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave_system", "root", "root");

            PreparedStatement ps1 = conn.prepareStatement("SELECT id FROM users WHERE username=?");
            ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            int uid = 0;
            if (rs1.next()) uid = rs1.getInt("id");

            PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM leave_applications WHERE user_id=?");
            ps2.setInt(1, uid);
            ResultSet rs2 = ps2.executeQuery();

            out.println("<html><head><title>Leave Status</title>");
            out.println("<link href='https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap' rel='stylesheet'>");
            out.println("<style>");
            out.println(":root { --glow-color: #0ff; --bg-glass: rgba(255, 255, 255, 0.05); --border-glass: rgba(255, 255, 255, 0.15); --bg-dark: #000; --text: #e0e0e0; }");

            out.println("* { box-sizing: border-box; }");
            out.println("body { margin: 0; font-family: 'Share Tech Mono', monospace; background: #000; color: var(--text); height: 100vh; display: flex; flex-direction: column; }");
            out.println(".container { flex: 1; display: flex; justify-content: center; align-items: center; padding: 20px; }");
            out.println(".box { background: var(--bg-glass); border: 1px solid var(--border-glass); padding: 30px; border-radius: 12px; backdrop-filter: blur(10px); box-shadow: 0 0 20px rgba(0, 255, 255, 0.1), 0 0 60px rgba(0, 255, 255, 0.05); max-width: 700px; width: 100%; }");
            out.println("h3 { text-align: center; color: var(--glow-color); font-size: 24px; }");
            out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
            out.println("th, td { padding: 12px; text-align: center; border: 1px solid #ddd; }");
            out.println("th { background-color: #7b2ff7; color: white; }");
            out.println("td { background-color: #222; color: #fff; }");

            // Colorful table rows and content with dark background
            out.println("tr:nth-child(even) { background: linear-gradient(135deg, #00f2ff 0%, #ff00f2 100%); color: white; }");
            out.println("tr:nth-child(odd) { background: linear-gradient(135deg, #ff00f2 0%, #00f2ff 100%); color: white; }");

            // Add glowing neon effect to action button
            out.println(".action-btn { text-decoration: none; padding: 6px 10px; background-color: red; color: white; border-radius: 6px; font-size: 13px; box-shadow: 0 0 12px rgba(255, 0, 255, 0.5); }");
            out.println(".action-btn:hover { background-color: #ff00f2; box-shadow: 0 0 20px rgba(255, 0, 255, 0.7); }");

            // Styling for "Go Back" button
            out.println(".back-btn { margin-top: 20px; padding: 12px; background-color: #7b2ff7; color: #fff; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; width: 100%; transition: all 0.3s ease-in-out; }");
            out.println(".back-btn:hover { background-color: #5e1ec0; transform: scale(1.05); box-shadow: 0 0 20px rgba(0, 255, 255, 0.3); }");

            out.println("</style></head><body>");

            out.println("<div class='container'><div class='box'>");
            out.println("<h3>Your Leave Applications</h3>");
            out.println("<table><tr><th>Start Date</th><th>End Date</th><th>Status</th><th>Action</th></tr>");

            // Loop through leave applications and create colorful table rows
            while (rs2.next()) {
                int leaveId = rs2.getInt("id");
                out.println("<tr>");
                out.println("<td>" + rs2.getDate("start_date") + "</td>");
                out.println("<td>" + rs2.getDate("end_date") + "</td>");
                out.println("<td>" + rs2.getString("status") + "</td>");
                out.println("<td><a href='DeleteLeaveServlet?id=" + leaveId + "' class='action-btn'>Delete</a></td>");
                out.println("</tr>");
            }
            out.println("</table>");

            // Back button
            out.println("<form action='employeeHome.jsp' method='get'>");
            out.println("<input type='submit' value='Go Back' class='back-btn'/>");
            out.println("</form>");

            out.println("</div></div>");
            out.println("</body></html>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color: red; text-align: center;'>Error displaying leave status: " + e.getMessage() + "</p>");
        }
    }
}
