<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="recBean" class="com.aptiva.beans.RecommendationBean" scope="request" />

<%
    String student = request.getParameter("studentName");
    String subject = request.getParameter("subjectName");
    String tier = request.getParameter("tier");
    String scoreStr = request.getParameter("score");
    String totalStr = request.getParameter("total");

    int score = 0;
    int total = 20;

    try {
        if (scoreStr != null) score = Integer.parseInt(scoreStr);
        if (totalStr != null) total = Integer.parseInt(totalStr);
    } catch (NumberFormatException e) {
        score = 0;
        total = 20;
    }

    recBean.setStudentName(student);
    recBean.setSubjectName(subject);
    recBean.setTier(tier);
    recBean.setScore(score);
    recBean.setTotal(total);

    boolean isSaved = recBean.saveToDatabase();
%>
{
  "status": "<%= isSaved ? "success" : "saved_locally" %>",
  "studentName": "<%= recBean.getStudentName() %>",
  "subjectName": "<%= recBean.getSubjectName() %>",
  "score": <%= recBean.getScore() %>,
  "total": <%= recBean.getTotal() %>,
  "percentage": <%= recBean.getPercentage() %>,
  "trackAssigned": "<%= recBean.getTrackAssigned() %>"
}