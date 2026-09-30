package com.aptiva.beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.aptiva.util.DBConnection;

public class RecommendationBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private String studentName;
    private String subjectName;
    private String tier;
    private int score;
    private int total;
    private int percentage;
    private String trackAssigned;

    public RecommendationBean() {}

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

    public String getTier() { return tier; }
    public void setTier(String tier) { this.tier = tier; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getTotal() { return total; }
    public void setTotal(int total) { this.total = total; }

    public int getPercentage() { return percentage; }
    public void setPercentage(int percentage) { this.percentage = percentage; }

    public String getTrackAssigned() { return trackAssigned; }
    public void setTrackAssigned(String trackAssigned) { this.trackAssigned = trackAssigned; }

    public void calculateAdaptiveTrack() {
        if (this.total > 0) {
            this.percentage = (int) Math.round(((double) this.score / this.total) * 100);
        } else {
            this.percentage = 0;
        }

        if (this.percentage < 50) {
            this.trackAssigned = "Remedial Track";
        } else if (this.percentage <= 80) {
            this.trackAssigned = "Standard Track";
        } else {
            this.trackAssigned = "Advanced Acceleration";
        }
    }

    public boolean saveToDatabase() {
        calculateAdaptiveTrack();
        String sql = "INSERT INTO quiz_results (student_name, subject_name, tier, score, total, percentage, track_assigned) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (conn == null) return false;

            ps.setString(1, this.studentName != null ? this.studentName : "Alex Mercer");
            ps.setString(2, this.subjectName != null ? this.subjectName : "General Subject");
            ps.setString(3, this.tier != null ? this.tier : "Easy");
            ps.setInt(4, this.score);
            ps.setInt(5, this.total);
            ps.setInt(6, this.percentage);
            ps.setString(7, this.trackAssigned);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}