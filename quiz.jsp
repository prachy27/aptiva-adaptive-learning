<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.aptiva.util.DBConnection" %>
<%
    Integer studentId = (Integer) session.getAttribute("student_id");
    if (studentId == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Aptiva | Diagnostic Assessment</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://unpkg.com/lucide@latest"></script>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body class="p-3 p-md-5 d-flex align-items-center justify-content-center min-vh-100">
  <div class="ambient-glow glow-purple"></div>
  <div class="ambient-glow glow-cyan"></div>

  <div class="container" style="max-width: 760px;">
    <div class="glass-card p-4 p-md-5">
      <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom border-secondary border-opacity-25">
        <div>
          <span class="badge bg-primary mb-1">Diagnostic Mode</span>
          <h4 class="fw-bold m-0">Topic: OOP Design & Servlet Architecture</h4>
        </div>
        <span class="badge bg-dark border border-secondary text-cyan px-3 py-2">PBL 5 JDBC Dynamic</span>
      </div>

      <form action="evaluate.jsp" method="POST">
        <%
            int qCount = 0;
            try (Connection conn = DBConnection.getConnection()) {
                if (conn != null) {
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM Questions WHERE topic_id = 2");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        qCount++;
                        int qId = rs.getInt("question_id");
        %>
        <div class="mb-4">
          <p class="fw-bold mb-3"><%= qCount %>. <%= rs.getString("question_text") %></p>
          
          <label class="quiz-option w-100">
            <span><%= rs.getString("option_a") %></span>
            <input type="radio" name="q_<%= qId %>" value="A" required>
          </label>
          <label class="quiz-option w-100">
            <span><%= rs.getString("option_b") %></span>
            <input type="radio" name="q_<%= qId %>" value="B">
          </label>
          <label class="quiz-option w-100">
            <span><%= rs.getString("option_c") %></span>
            <input type="radio" name="q_<%= qId %>" value="C">
          </label>
          <label class="quiz-option w-100">
            <span><%= rs.getString("option_d") %></span>
            <input type="radio" name="q_<%= qId %>" value="D">
          </label>
        </div>
        <%
                    }
                } else {
                    out.println("<div class='alert alert-danger'>Database connection failed. Ensure MySQL is started in XAMPP.</div>");
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error loading quiz: " + e.getMessage() + "</div>");
            }
        %>
        <input type="hidden" name="total_questions" value="<%= qCount %>">
        <button type="submit" class="btn-action w-100 justify-content-center mt-3">
          <span>Submit for Adaptive Path Generation</span>
          <i data-lucide="cpu" style="width: 18px;"></i>
        </button>
      </form>
    </div>
  </div>
  <script>lucide.createIcons();</script>
</body>
</html>