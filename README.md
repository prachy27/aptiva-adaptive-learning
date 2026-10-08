# Aptiva — Adaptive Learning Platform

Aptiva is a full-stack Java-based educational web platform engineered to deliver competency-based, dynamic diagnostic assessments for engineering students. Instead of static evaluations, Aptiva evaluates conceptual mastery in real time, logs performance analytics to MySQL, and automatically assigns curated video learning paths based on performance tiers.

---

## Key Features

- Dynamic Diagnostic Assessment Engine:
  - Interactive 20-question diagnostic quizzes per subject with randomized questions and options.
  - Multi-tier challenge selection (Easy, Medium, Hard) featuring countdown timers, tick-audio alerts, and pause/resume functionality.
  - Real-time feedback dock providing step-by-step conceptual explanations for each answer.

- Adaptive Curriculum & Recommendation Tracks:
  - Remedial Track (< 50%): Flags foundational prerequisites and surfaces introductory, visual tutorials to rebuild core intuition.
  - Standard Track (50% – 80%): Validates fundamental grasp and directs students toward exam-level problem solving and intermediate proofs.
  - Advanced Track (> 80%): Accelerates learning toward systems design, competitive programming, and research-level topics.
  - Curated, subject-specific YouTube lectures with real-time video thumbnail integration.

- Asynchronous MVC Full-Stack Architecture:
  - Single-page application (SPA) experience using the native JavaScript `fetch()` API for seamless state updates without full page refreshes.
  - Secure credential authentication and quiz attempt persistence backed by MySQL through JDBC.

- Comprehensive B.Tech Curriculum Coverage:
  - Structured across 3 academic years: 1st Year Foundations, 2nd Year Core Computer Science, and 3rd Year Systems & Cloud Security.

---

## Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+, Fetch API), Bootstrap 5, Lucide Icons, Canvas Confetti
- **Backend / Controller**: Java Server Pages (JSP)
- **Business Logic**: JavaBeans (`UserBean`, `RecommendationBean`)
- **Database & Persistence**: MySQL, JDBC (`mysql-connector-j-8.3.0.jar`)
- **Application Server**: Apache Tomcat 9/10 (via XAMPP)
- **Data Exchange**: JSON (JavaScript Object Notation)

---

## Architecture Overview

Aptiva follows the **Model-View-Controller (MVC)** architectural design pattern:

```text
[Browser / Client]
       │
       ▼ (Fetch API / HTTP POST)
[Controller Layer: auth.jsp / evaluate.jsp]
       │
       ▼ (JavaBean Method Calls)
[Model Layer: UserBean / RecommendationBean]
       │
       ▼ (JDBC PreparedStatement)
[Database Layer: DBConnection ──► MySQL (aptiva_db)]
