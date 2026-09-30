<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userBean" class="com.aptiva.beans.UserBean" scope="request" />

<%
    String action = request.getParameter("action");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    userBean.setEmail(email);
    userBean.setPassword(password);

    boolean success = false;
    String message = "";

    if ("signup".equalsIgnoreCase(action)) {
        userBean.setFirstName(request.getParameter("firstName"));
        userBean.setLastName(request.getParameter("lastName"));
        userBean.setRole(request.getParameter("role"));

        success = userBean.register();
        message = success ? "Registration successful!" : "Email already exists or registration failed.";
    } else if ("signin".equalsIgnoreCase(action)) {
        success = userBean.login();
        message = success ? "Login successful!" : "Invalid email or password.";
    }
%>
{
  "success": <%= success %>,
  "message": "<%= message %>",
  "firstName": "<%= userBean.getFirstName() != null ? userBean.getFirstName() : "" %>",
  "lastName": "<%= userBean.getLastName() != null ? userBean.getLastName() : "" %>",
  "fullName": "<%= (userBean.getFirstName() != null ? userBean.getFirstName() : "") + " " + (userBean.getLastName() != null ? userBean.getLastName() : "") %>",
  "email": "<%= userBean.getEmail() != null ? userBean.getEmail() : "" %>",
  "role": "<%= userBean.getRole() != null ? userBean.getRole() : "Student" %>"
}