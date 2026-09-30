<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Aptiva | Adaptive B.Tech Learning Platform</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://unpkg.com/lucide@latest"></script>
  <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Caveat:wght@600;700&family=Fira+Code:wght@500;600&display=swap');

    :root {
      --bg-main: #fcfcfd;
      --surface-card: #ffffff;
      --primary-blue: #2563eb;
      --accent-yellow: #f59e0b;
      --accent-yellow-light: #fef3c7;
      --accent-coral: #f43f5e;
      --accent-green: #10b981;
      --text-dark: #0f172a;
      --text-body: #334155;
      --text-muted: #64748b;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Plus Jakarta Sans', -apple-system, sans-serif;
    }

    code, pre {
      font-family: 'Fira Code', monospace !important;
      background: #f1f5f9;
      padding: 2px 6px;
      border-radius: 6px;
      color: #0f172a;
    }

    html, body {
      width: 100%;
      max-width: 100vw;
      overflow-x: hidden;
      background-color: var(--bg-main);
      color: var(--text-dark);
    }

    .notebook-grid {
      position: fixed;
      top: 0; left: 0; width: 100vw; height: 100vh;
      background-image: 
        linear-gradient(to right, rgba(226, 232, 240, 0.45) 1px, transparent 1px),
        linear-gradient(to bottom, rgba(226, 232, 240, 0.45) 1px, transparent 1px);
      background-size: 32px 32px;
      pointer-events: none;
      z-index: 0;
    }

    .screen-shimmer {
      position: fixed;
      top: 0; left: -150%; width: 100%; height: 100vh;
      background: linear-gradient(90deg, transparent 0%, rgba(59, 130, 246, 0.08) 35%, rgba(255, 255, 255, 0.45) 50%, rgba(244, 63, 94, 0.08) 65%, transparent 100%);
      transform: skewX(-22deg);
      pointer-events: none;
      z-index: 9999;
      opacity: 0;
    }

    .shimmer-active {
      animation: triggerShimmer 0.75s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    @keyframes triggerShimmer {
      0% { left: -120%; opacity: 0; }
      20% { opacity: 1; }
      80% { opacity: 1; }
      100% { left: 160%; opacity: 0; }
    }

    .view-transition {
      animation: fadeSlideIn 0.32s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    @keyframes fadeSlideIn {
      0% { opacity: 0; transform: translateY(14px) scale(0.99); }
      100% { opacity: 1; transform: translateY(0) scale(1); }
    }

    .light-nav {
      position: sticky; top: 0; z-index: 1000;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(14px);
      border-bottom: 2px dashed #cbd5e1;
    }

    .brand-title {
      font-size: 1.65rem;
      font-weight: 800;
      letter-spacing: -0.03em;
      color: var(--primary-blue);
      cursor: pointer;
    }

    .brand-subline {
      font-family: 'Caveat', cursive;
      font-size: 1.3rem;
      color: var(--accent-coral);
      margin-left: 8px;
      transform: rotate(-3deg);
      display: inline-block;
      font-weight: 700;
    }

    .btn-doodle-primary {
      background: var(--primary-blue) !important;
      color: #ffffff !important;
      border: 2px solid var(--text-dark) !important;
      box-shadow: 4px 4px 0px var(--text-dark) !important;
      padding: 10px 24px !important;
      border-radius: 12px !important;
      font-weight: 700 !important;
      font-size: 0.95rem !important;
      text-decoration: none !important;
      display: inline-flex !important;
      align-items: center !important;
      gap: 8px !important;
      cursor: pointer !important;
      transition: all 0.15s ease !important;
    }

    .btn-doodle-primary:hover {
      transform: translate(-2px, -2px) !important;
      box-shadow: 6px 6px 0px var(--text-dark) !important;
      color: #ffffff !important;
    }

    .btn-doodle-secondary {
      background: #ffffff !important;
      color: var(--text-dark) !important;
      border: 2px solid var(--text-dark) !important;
      box-shadow: 4px 4px 0px var(--text-dark) !important;
      padding: 8px 18px !important;
      border-radius: 12px !important;
      font-weight: 700 !important;
      font-size: 0.9rem !important;
      text-decoration: none !important;
      cursor: pointer !important;
      transition: all 0.15s ease !important;
    }

    .btn-doodle-secondary:hover {
      transform: translate(-2px, -2px) !important;
      box-shadow: 6px 6px 0px var(--text-dark) !important;
      background: #fffbeb !important;
      color: var(--text-dark) !important;
    }

    .hero-wrapper {
      position: relative;
      min-height: 85vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 60px 20px;
      overflow: hidden;
      z-index: 2;
    }

    .hero-main-heading {
      font-size: clamp(3.8rem, 8vw, 6rem);
      font-weight: 800;
      letter-spacing: -0.04em;
      color: var(--text-dark);
      line-height: 1.05;
    }

    .hero-tagline-text {
      font-family: 'Caveat', cursive;
      font-size: clamp(1.9rem, 3.4vw, 2.5rem);
      color: var(--primary-blue);
      margin-top: 10px;
      display: inline-block;
      transform: rotate(-1.5deg);
      position: relative;
    }

    .hero-tagline-text svg {
      position: absolute;
      left: 0; bottom: -10px; width: 100%; height: 16px;
      pointer-events: none;
    }

    .hero-description {
      max-width: 660px;
      color: var(--text-body);
      font-size: 1.15rem;
      line-height: 1.6;
      margin: 24px auto 36px;
    }

    .doodle {
      position: absolute;
      pointer-events: none;
      z-index: 1;
    }

    .doodle-float-slow { animation: doodleFloat 5s ease-in-out infinite; }
    .doodle-pulse { animation: doodlePulse 2.5s ease-in-out infinite; }

    @keyframes doodleFloat {
      0%, 100% { transform: translateY(0px) rotate(0deg); }
      50% { transform: translateY(-14px) rotate(4deg); }
    }

    @keyframes doodlePulse {
      0%, 100% { transform: scale(1); opacity: 0.85; }
      50% { transform: scale(1.14); opacity: 1; }
    }

    .clean-card {
      background: var(--surface-card);
      border: 2px solid #e2e8f0;
      border-radius: 16px;
      padding: 28px;
      position: relative;
    }

    .year-overview-card {
      background: #ffffff;
      border: 2px solid var(--text-dark);
      border-radius: 20px;
      padding: 32px 36px;
      margin-bottom: 28px;
      box-shadow: 6px 6px 0px var(--text-dark);
      transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .year-overview-card:hover {
      transform: translate(-2px, -2px);
      box-shadow: 8px 8px 0px var(--text-dark);
    }

    .subject-box-card {
      background: #ffffff !important;
      border: 2px solid #0f172a !important;
      border-radius: 16px !important;
      padding: 22px !important;
      box-shadow: 4px 4px 0px #0f172a !important;
      cursor: pointer !important;
      transition: all 0.2s ease !important;
      display: flex !important;
      flex-direction: column !important;
      justify-content: space-between !important;
      min-height: 195px !important;
      text-align: left !important;
    }

    .subject-box-card:hover {
      transform: translate(-3px, -3px) !important;
      box-shadow: 7px 7px 0px #2563eb !important;
      border-color: #2563eb !important;
      background: #f8faff !important;
    }

    .sub-title-bold {
      font-size: 1.18rem !important;
      font-weight: 800 !important;
      color: #0f172a !important;
      margin-top: 8px !important;
      margin-bottom: 6px !important;
      display: block !important;
      line-height: 1.3 !important;
    }

    .sub-desc-text {
      font-size: 0.88rem !important;
      color: #334155 !important;
      line-height: 1.5 !important;
      margin-bottom: 14px !important;
      display: block !important;
    }

    .opt-choice-btn {
      width: 100%;
      text-align: left;
      padding: 16px 20px;
      margin-bottom: 14px;
      background: #ffffff !important;
      color: #0f172a !important;
      border: 2.5px solid #0f172a !important;
      border-radius: 14px !important;
      font-size: 1.02rem !important;
      font-weight: 700 !important;
      box-shadow: 3px 3px 0px #0f172a !important;
      display: flex !important;
      justify-content: space-between !important;
      align-items: center !important;
      cursor: pointer !important;
      transition: all 0.15s ease !important;
    }

    .opt-choice-btn:hover {
      background: #eff6ff !important;
      transform: translate(-2px, -2px) !important;
      box-shadow: 5px 5px 0px #0f172a !important;
    }

    .opt-choice-btn.selected-opt {
      background: #dbeafe !important;
      border-color: #2563eb !important;
      box-shadow: 4px 4px 0px #2563eb !important;
      transform: translate(-2px, -2px) !important;
    }

    .opt-radio-dot {
      font-size: 1.3rem !important;
      font-weight: 800 !important;
      color: #94a3b8 !important;
    }

    .opt-choice-btn.selected-opt .opt-radio-dot {
      color: #2563eb !important;
    }

    .clock-pill-widget {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 6px 14px;
      border-radius: 50px;
      background: #ffffff;
      border: 2px solid #0f172a;
      box-shadow: 2px 2px 0px #0f172a;
      font-weight: 800;
      color: #0f172a;
      transition: all 0.2s ease;
    }

    .clock-pill-widget.timer-urgent {
      background: #fee2e2 !important;
      border-color: #ef4444 !important;
      color: #dc2626 !important;
      box-shadow: 3px 3px 0px #ef4444 !important;
      animation: timerPulse 0.5s infinite alternate;
    }

    @keyframes timerPulse {
      0% { transform: scale(1); }
      100% { transform: scale(1.06); }
    }

    .clock-icon-rotating {
      animation: clockTick 2s linear infinite;
    }

    @keyframes clockTick {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    .duo-feedback-dock {
      position: fixed;
      bottom: 0; left: 0; width: 100vw;
      padding: 22px 24px;
      background: #ffffff;
      border-top: 3.5px solid #0f172a;
      box-shadow: 0 -10px 30px rgba(0, 0, 0, 0.2);
      z-index: 2000;
      transform: translateY(120%);
      transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .duo-feedback-dock.dock-correct {
      transform: translateY(0);
      background: #f0fdf4 !important;
      border-top: 4px solid #16a34a !important;
    }

    .duo-feedback-dock.dock-wrong {
      transform: translateY(0);
      background: #fef2f2 !important;
      border-top: 4px solid #dc2626 !important;
    }

    .meter-circle-box {
      position: relative;
      width: 170px; height: 170px;
      margin: 0 auto 20px;
    }

    .meter-circle-svg {
      transform: rotate(-90deg);
      width: 100%; height: 100%;
    }

    .meter-bg {
      fill: none;
      stroke: #e2e8f0;
      stroke-width: 14;
    }

    .meter-bar {
      fill: none;
      stroke: #2563eb;
      stroke-width: 14;
      stroke-linecap: round;
      stroke-dasharray: 440;
      stroke-dashoffset: 440;
      transition: stroke-dashoffset 1.4s cubic-bezier(0.16, 1, 0.3, 1), stroke 0.4s ease;
    }

    .meter-num-center {
      position: absolute;
      top: 50%; left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="notebook-grid"></div>
  <div id="screenShimmerBeam" class="screen-shimmer"></div>

  <!-- Header -->
  <header class="light-nav px-4 py-3 d-flex justify-content-between align-items-center position-relative" style="z-index: 100;">
    <div class="d-flex align-items-center" onclick="returnHome()" style="cursor: pointer;">
      <span class="brand-title">Aptiva</span>
      <span class="brand-subline">Adaptive Learning Platform</span>
    </div>
    
    <div class="d-flex align-items-center gap-3">
      <a href="#about-section" id="nav-about-link" class="btn-doodle-secondary py-1 px-3 d-none d-md-inline-block">About</a>
      <a href="#features-section" id="nav-features-link" class="btn-doodle-secondary py-1 px-3 d-none d-md-inline-block">Features</a>
      <button id="nav-auth-btn" class="btn-doodle-primary py-1 px-3" data-bs-toggle="modal" data-bs-target="#authModal">Sign In / Sign Up</button>
      
      <div id="user-pill" class="d-none align-items-center gap-2 px-3 py-1 rounded-pill" style="background: var(--accent-yellow-light); border: 2px solid #000; box-shadow: 2px 2px 0px #000;">
        <i data-lucide="award" style="width: 16px; color: var(--accent-yellow);"></i>
        <span class="small fw-bold" id="user-display-name" style="color: #92400e;">Student</span>
      </div>
      <button id="logout-btn" class="btn-doodle-secondary py-1 px-3 d-none" onclick="logout()">Sign Out</button>
    </div>
  </header>

  <!-- ==================== VIEW 1: LANDING & ABOUT ==================== -->
  <div id="landing-view" class="position-relative view-transition" style="z-index: 2;">
    <section class="hero-wrapper">
      <div class="doodle doodle-float-slow" style="top: 8%; left: 5%;">
        <svg width="72" height="72" viewBox="0 0 100 100" fill="none" stroke="#2563eb" stroke-width="4">
          <path d="M50 15 C30 35 30 65 30 75 L70 75 C70 65 70 35 50 15 Z" fill="#eff6ff"/>
          <circle cx="50" cy="45" r="8" fill="#38bdf8"/>
        </svg>
      </div>
      <div class="doodle doodle-pulse" style="top: 10%; right: 7%;">
        <svg width="68" height="78" viewBox="0 0 80 100" fill="none" stroke="#0f172a" stroke-width="3.5">
          <path d="M40 20 C25 20 18 32 18 45 C18 55 28 62 28 72 L52 72 C52 62 62 55 62 45 C62 32 55 20 40 20 Z" fill="#fef08a"/>
        </svg>
      </div>

      <div style="position: relative; z-index: 3; max-width: 820px;">
        <h1 class="hero-main-heading">Aptiva</h1>
        <div>
          <span class="hero-tagline-text">
            Adaptive Learning Platform
            <svg viewBox="0 0 250 18" fill="none">
              <path d="M3 14 C50 3, 150 2, 245 12" stroke="#f59e0b" stroke-width="5" stroke-linecap="round"/>
            </svg>
          </span>
        </div>
        <p class="hero-description">
          An intelligent ed-tech engine delivering dynamic, competency-based curricula. Test your true knowledge across 20 diagnostic questions with real-time feedback and subject-specific video reinforcement.
        </p>
        <div class="d-flex gap-3 justify-content-center flex-wrap">
          <button class="btn-doodle-primary" data-bs-toggle="modal" data-bs-target="#authModal">
            <span>Get Started &bull; Sign In</span>
            <i data-lucide="arrow-right" style="width: 18px;"></i>
          </button>
          <a href="#about-section" class="btn-doodle-secondary">What Is Aptiva?</a>
        </div>
      </div>
    </section>

    <section id="about-section" class="py-5 bg-white border-top border-bottom border-light">
      <div class="container py-4">
        <div class="text-center mx-auto mb-5" style="max-width: 680px;">
          <h2 class="fw-bold mt-2 mb-3">What Aptiva Is All About</h2>
          <p class="text-muted">Aptiva branches your learning dynamically through targeted diagnostics and curated YouTube reinforcement.</p>
        </div>
        <div class="row g-4">
          <div class="col-md-4">
            <div class="clean-card h-100">
              <span class="badge bg-danger mb-2">Score &lt; 50%</span>
              <h5 class="fw-bold mt-2">Remedial Curations</h5>
              <p class="small text-muted mb-0">Direct links to beginner-friendly YouTube tutorials covering foundational prerequisites from scratch.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="clean-card h-100">
              <span class="badge bg-warning text-dark mb-2">Score 50% - 80%</span>
              <h5 class="fw-bold mt-2">Standard Progression</h5>
              <p class="small text-muted mb-0">Core principles verified. Directs you to try higher difficulty levels or practical exercises.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="clean-card h-100">
              <span class="badge bg-success mb-2">Score &gt; 80%</span>
              <h5 class="fw-bold mt-2">Honors Acceleration</h5>
              <p class="small text-muted mb-0">Demonstrated mastery. Unlocks advanced architecture, system design, and competitive coding lectures.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="features-section" class="py-5 bg-light">
      <div class="container py-4 text-center">
        <h2 class="fw-bold mb-4">Platform Features</h2>
        <div class="row g-4">
          <div class="col-md-3"><div class="clean-card h-100"><h6 class="fw-bold">3 Core B.Tech Years</h6><p class="small text-muted m-0">Foundations, Core CS, and Systems.</p></div></div>
          <div class="col-md-3"><div class="clean-card h-100"><h6 class="fw-bold">20-Question Tests</h6><p class="small text-muted m-0">In-depth numericals, traces & conceptual checks.</p></div></div>
          <div class="col-md-3"><div class="clean-card h-100"><h6 class="fw-bold">Subject-Wise YouTube</h6><p class="small text-muted m-0">Dedicated video recommendations per subject.</p></div></div>
          <div class="col-md-3"><div class="clean-card h-100"><h6 class="fw-bold">MySQL Integration</h6><p class="small text-muted m-0">Stores user profiles and diagnostic evaluations.</p></div></div>
        </div>
      </div>
    </section>
  </div>

  <!-- ==================== VIEW 2: ACADEMIC HUB ==================== -->
  <div id="academic-hub-view" class="d-none position-relative view-transition" style="z-index: 2; max-width: 1140px; margin: 0 auto; padding: 40px 20px 80px;">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 pb-3 border-bottom border-light">
      <div>
        <span class="badge bg-primary px-3 py-1 mb-2">B.Tech Engineering Hub</span>
        <h3 class="fw-bold m-0" id="student-welcome-text" style="color: #0f172a;">Welcome, Student</h3>
        <p class="small text-muted mb-0" id="student-sub-details">Role: Student &bull; Registered Member</p>
      </div>
      <div class="mt-3 mt-md-0">
        <span class="badge p-2 px-3 border border-dark text-dark bg-white" style="box-shadow: 2px 2px 0px #000;">
          <i data-lucide="check-circle" style="width: 16px; color: var(--accent-green);" class="me-1"></i> Diagnostic Mode Active
        </span>
      </div>
    </div>

    <div class="mb-4">
      <input type="text" id="subjectSearchInput" class="form-control border-2 border-dark py-3 px-4 fw-bold" style="border-radius: 50px; box-shadow: 4px 4px 0px #0f172a;" placeholder="Search any subject (e.g. DAA, IoT, Cloud, DSA, DBMS)..." onkeyup="handleUniversalSearch()">
    </div>

    <div id="search-results-section" class="d-none mb-5">
      <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="fw-bold m-0 text-primary d-flex align-items-center gap-2">
          <i data-lucide="filter" style="width: 20px; height: 20px;"></i> Search Results
        </h5>
        <button class="btn-doodle-secondary py-1 px-3" onclick="clearSearch()">View All Years</button>
      </div>
      <div class="row g-3" id="search-results-grid"></div>
    </div>

    <!-- 3 Year Main Overview Sections -->
    <div id="year-overview-list" class="mb-4">
      <div class="year-overview-card mb-4" style="border-left: 8px solid var(--primary-blue);">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-start mb-3">
          <div>
            <span class="badge bg-primary text-white mb-2">1st Year &bull; Engineering Foundations</span>
            <h4 class="fw-bold text-dark mt-2 mb-1">What you need to know in 1st Year</h4>
          </div>
          <span class="badge bg-light text-dark border px-3 py-2 mt-2 mt-md-0">8 Curated Subjects</span>
        </div>
        <p class="text-body mb-4" style="line-height: 1.6;">
          First year builds the bedrock of your engineering thinking: formal computational paradigms, core physics, IoT embedded systems, discrete probability, and hands-on programming with Object-Oriented paradigms and Data Structures.
        </p>
        <div class="d-flex justify-content-between align-items-center pt-3 border-top border-light">
          <div class="small text-muted"><strong>Topics:</strong> Computational Thinking, Physics, IoT, Probability, Chemistry, DSA, OOPs, Tech Comm.</div>
          <button class="btn-doodle-primary" onclick="showYearSubjects(1)">
            <span>Explore 1st Year Subjects</span>
            <i data-lucide="arrow-right" style="width: 16px;"></i>
          </button>
        </div>
      </div>

      <div class="year-overview-card mb-4" style="border-left: 8px solid var(--accent-yellow);">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-start mb-3">
          <div>
            <span class="badge bg-warning text-dark border border-dark mb-2">2nd Year &bull; Core Computer Science</span>
            <h4 class="fw-bold text-dark mt-2 mb-1">What you need to know in 2nd Year</h4>
          </div>
          <span class="badge bg-light text-dark border px-3 py-2 mt-2 mt-md-0">6 Curated Subjects</span>
        </div>
        <p class="text-body mb-4" style="line-height: 1.6;">
          Second year represents the core technical engine of Computer Science: algorithmic complexity (DAA), formal discrete logic, relational databases (SQL, ACID, normalization), modern web architecture, and foundational AI systems.
        </p>
        <div class="d-flex justify-content-between align-items-center pt-3 border-top border-light">
          <div class="small text-muted"><strong>Topics:</strong> AI Foundations, DAA, Discrete Math, Industry Tech Comm, DBMS, WebTech.</div>
          <button class="btn-doodle-primary" onclick="showYearSubjects(2)">
            <span>Explore 2nd Year Subjects</span>
            <i data-lucide="arrow-right" style="width: 16px;"></i>
          </button>
        </div>
      </div>

      <div class="year-overview-card mb-4" style="border-left: 8px solid var(--accent-green);">
        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-start mb-3">
          <div>
            <span class="badge bg-success text-white mb-2">3rd Year &bull; Systems & Cloud Security</span>
            <h4 class="fw-bold text-dark mt-2 mb-1">What you need to know in 3rd Year</h4>
          </div>
          <span class="badge bg-light text-dark border px-3 py-2 mt-2 mt-md-0">4 Curated Subjects</span>
        </div>
        <p class="text-body mb-4" style="line-height: 1.6;">
          Third year elevates your knowledge to low-level hardware-software interfaces and production cloud systems: computer architecture, operating system kernels, concurrency, modern cryptographic encryption, and scalable cloud infrastructure.
        </p>
        <div class="d-flex justify-content-between align-items-center pt-3 border-top border-light">
          <div class="small text-muted"><strong>Topics:</strong> Computer Systems, Cryptography, Operating System, Cloud Computing.</div>
          <button class="btn-doodle-primary" onclick="showYearSubjects(3)">
            <span>Explore 3rd Year Subjects</span>
            <i data-lucide="arrow-right" style="width: 16px;"></i>
          </button>
        </div>
      </div>
    </div>

    <!-- State C: Year Detail Subject Grids -->
    <div id="year-1-subjects-view" class="d-none mb-5">
      <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom border-light">
        <div>
          <button class="btn btn-sm btn-outline-dark fw-bold mb-2" onclick="backToYearOverview()">&larr; Back to Year Overview</button>
          <h4 class="fw-bold m-0" style="color: #0f172a;">1st Year Foundations</h4>
        </div>
        <span class="badge bg-primary px-3 py-2">8 Subjects Available</span>
      </div>
      <div class="row g-4" id="year-1-grid"></div>
    </div>

    <div id="year-2-subjects-view" class="d-none mb-5">
      <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom border-light">
        <div>
          <button class="btn btn-sm btn-outline-dark fw-bold mb-2" onclick="backToYearOverview()">&larr; Back to Year Overview</button>
          <h4 class="fw-bold m-0" style="color: #0f172a;">2nd Year Core Computer Science</h4>
        </div>
        <span class="badge bg-warning text-dark px-3 py-2 border border-dark">6 Subjects Available</span>
      </div>
      <div class="row g-4" id="year-2-grid"></div>
    </div>

    <div id="year-3-subjects-view" class="d-none mb-5">
      <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom border-light">
        <div>
          <button class="btn btn-sm btn-outline-dark fw-bold mb-2" onclick="backToYearOverview()">&larr; Back to Year Overview</button>
          <h4 class="fw-bold m-0" style="color: #0f172a;">3rd Year Systems & Cloud Security</h4>
        </div>
        <span class="badge bg-success text-white px-3 py-2">4 Subjects Available</span>
      </div>
      <div class="row g-4" id="year-3-grid"></div>
    </div>
  </div>

  <!-- ==================== VIEW 3: QUIZ RUNNER ==================== -->
  <div id="quiz-flow-view" class="d-none container py-5 position-relative view-transition" style="max-width: 800px; z-index: 2;">
    
    <!-- Config Step -->
    <div id="quiz-config-step" class="clean-card p-4 p-md-5">
      <button class="btn btn-sm btn-outline-dark mb-3 fw-bold" onclick="returnFromQuiz()">&larr; Back to Subjects</button>
      
      <span class="badge bg-primary mb-2" id="cfg-year-tag">1st Year</span>
      <h2 class="fw-bold mb-1 text-dark" id="cfg-subject-name">Subject Name</h2>
      <p class="text-muted small mb-4">Choose a challenge tier. All 20 questions will be dynamically randomized:</p>

      <div class="mb-4">
        <label class="form-label small fw-bold text-dark">Select Challenge Tier</label>
        <div class="row g-3">
          <div class="col-4">
            <input type="radio" class="btn-check" name="quizDifficulty" id="diff-easy" value="Easy" checked>
            <label class="btn btn-outline-success w-100 py-3 fw-bold border-2" for="diff-easy">
              Easy<br><span class="small fw-normal">15s / Q</span>
            </label>
          </div>
          <div class="col-4">
            <input type="radio" class="btn-check" name="quizDifficulty" id="diff-med" value="Medium">
            <label class="btn btn-outline-warning text-dark w-100 py-3 fw-bold border-2" for="diff-med">
              Medium<br><span class="small fw-normal">25s / Q</span>
            </label>
          </div>
          <div class="col-4">
            <input type="radio" class="btn-check" name="quizDifficulty" id="diff-hard" value="Hard">
            <label class="btn btn-outline-danger w-100 py-3 fw-bold border-2" for="diff-hard">
              Hard<br><span class="small fw-normal">35s / Q (Numericals)</span>
            </label>
          </div>
        </div>
      </div>

      <button class="btn-doodle-primary w-100 justify-content-center py-3" onclick="launchQuiz()">
        <span>Begin 20-Question Diagnostic Test</span>
        <i data-lucide="play" style="width: 18px;"></i>
      </button>
    </div>

    <!-- Active Question Step -->
    <div id="quiz-runner-step" class="clean-card p-4 p-md-5 d-none">
      
      <div class="d-flex justify-content-between align-items-center mb-3">
        <button class="btn btn-sm btn-outline-danger fw-bold d-flex align-items-center gap-1" onclick="confirmExitQuiz()">
          <i data-lucide="log-out" style="width: 16px;"></i> Exit Quiz
        </button>
        <div class="d-flex align-items-center gap-2">
          <button class="btn btn-sm btn-outline-dark fw-bold d-flex align-items-center gap-1" id="pauseResumeBtn" onclick="togglePauseQuiz()">
            <i data-lucide="pause" style="width: 16px;" id="pauseBtnIcon"></i> <span id="pauseBtnLabel">Pause</span>
          </button>
        </div>
      </div>

      <div class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom border-light">
        <div>
          <span class="badge bg-primary mb-1" id="runner-badge">Subject &bull; Level</span>
          <h5 class="fw-bold m-0" id="runner-counter" style="color: #0f172a;">Question 1 of 20</h5>
        </div>

        <div class="clock-pill-widget" id="clockWidgetContainer">
          <svg class="clock-icon-rotating" viewBox="0 0 24 24" width="18" height="18" stroke="currentColor" stroke-width="2.5" fill="none">
            <circle cx="12" cy="12" r="10"></circle>
            <polyline points="12 6 12 12 16 14"></polyline>
          </svg>
          <span id="timerCountdownText">15s</span>
        </div>
      </div>

      <h4 class="fw-bold mb-4" id="runner-question-text" style="color: #0f172a; line-height: 1.4;">Loading question...</h4>
      
      <div id="runner-options-container" class="mb-4"></div>

      <div id="pausedMaskCard" class="text-center py-5 d-none">
        <span style="font-size: 3rem;">⏸️</span>
        <h4 class="fw-bold text-dark mt-2 mb-1">Quiz Paused</h4>
        <p class="text-muted small mb-3">Timer is frozen. Click resume when you are ready to continue.</p>
        <button class="btn btn-dark fw-bold px-4 py-2" onclick="togglePauseQuiz()">Resume Quiz</button>
      </div>

      <button id="submitAnswerBtn" class="btn-doodle-primary w-100 justify-content-center py-3" onclick="handleAnswerSubmit()">
        <span>Check Answer</span>
        <i data-lucide="chevron-right" style="width: 18px;"></i>
      </button>
    </div>

    <!-- Results Stage -->
    <div id="quiz-result-step" class="clean-card p-4 p-md-5 text-center d-none">
      <div class="meter-circle-box">
        <svg class="meter-circle-svg" viewBox="0 0 160 160">
          <circle class="meter-bg" cx="80" cy="80" r="70"></circle>
          <circle id="meterFillCircle" class="meter-bar" cx="80" cy="80" r="70"></circle>
        </svg>
        <div class="meter-num-center">
          <div class="display-5 fw-bold text-dark m-0" id="meterScoreNumber">0%</div>
          <span class="small fw-bold text-muted">MASTERY</span>
        </div>
      </div>
      
      <h3 class="fw-bold mb-1" id="result-headline" style="color: #0f172a;">Diagnostic Complete</h3>
      <p class="text-muted small mb-3" id="result-subline">Competency evaluation & YouTube learning plan</p>
      <p class="text-muted fw-bold mb-4" id="result-score-text">Score: 0 / 20 Correct</p>

      <div class="p-4 rounded-3 text-start mb-4 border-2 border" id="result-track-card">
        <span class="badge mb-2" id="result-track-badge">Track</span>
        <h5 class="fw-bold mb-1 text-dark" id="result-track-title">Title</h5>
        <p class="small text-muted mb-0" id="result-track-desc">Description</p>
      </div>

      <div class="text-start mb-4">
        <div class="d-flex align-items-center justify-content-between mb-3">
          <h5 class="fw-bold m-0 d-flex align-items-center gap-2" style="color: #0f172a;">
            <i data-lucide="video" style="color: #ef4444; width: 24px; height: 24px;"></i> Recommended Video Lectures For You:
          </h5>
          <span class="badge bg-light text-dark border">Tailored by Score</span>
        </div>
        <div class="row g-3" id="youtube-recommendations-grid"></div>
      </div>

      <div class="text-start mb-4">
        <h6 class="fw-bold text-dark mb-3 d-flex align-items-center gap-2">
          <span>📝</span> Question Breakdown:
        </h6>
        <div id="result-breakdown-list"></div>
      </div>

      <div class="d-flex gap-3">
        <button class="btn-doodle-secondary w-50" onclick="returnFromQuiz()">Back to Subjects</button>
        <button class="btn-doodle-primary w-50 justify-content-center" onclick="retakeCurrentSubject()">Retake Subject (Reshuffled)</button>
      </div>
    </div>

  </div>

  <!-- Duolingo Feedback Dock -->
  <div id="duoFeedbackDock" class="duo-feedback-dock">
    <div class="container" style="max-width: 820px;">
      <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
        <div class="d-flex align-items-center gap-3">
          <div id="duoMascotFace" style="font-size: 3rem;"></div>
          <div>
            <h4 class="fw-bold m-0" id="duoFeedbackTitle">Nicely done!</h4>
            <p class="small m-0 fw-semibold mt-1" id="duoFeedbackExplanation" style="color: #1e293b; max-width: 520px;"></p>
          </div>
        </div>
        <button class="btn-doodle-primary py-2 px-4 flex-shrink-0" onclick="nextQuestionAfterFeedback()">
          <span>Continue &rarr;</span>
        </button>
      </div>
    </div>
  </div>

  <!-- Sign In / Sign Up Modal -->
  <div class="modal fade" id="authModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="max-width: 440px;">
      <div class="modal-content p-4 border-2 border-dark" style="border-radius: 16px; box-shadow: 6px 6px 0px #000;">
        <div class="d-flex justify-content-between align-items-center mb-3">
          <h5 class="fw-bold text-dark m-0">Portal Access</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" id="modalCloseBtn"></button>
        </div>

        <ul class="nav nav-pills nav-fill mb-3" style="background: #f1f5f9; padding: 4px; border-radius: 10px;">
          <li class="nav-item">
            <button class="nav-link active py-1 small fw-bold" id="tab-signin-link" data-bs-toggle="pill" data-bs-target="#tab-signin">Sign In</button>
          </li>
          <li class="nav-item">
            <button class="nav-link py-1 small fw-bold" id="tab-signup-link" data-bs-toggle="pill" data-bs-target="#tab-signup">Register</button>
          </li>
        </ul>

        <div class="tab-content">
          <!-- SIGN IN FORM -->
          <div class="tab-pane fade show active" id="tab-signin">
            <form onsubmit="executeAuth(event, 'signin')">
              <div class="mb-3">
                <label class="small text-muted mb-1">Email ID</label>
                <input type="email" id="signin-email" class="form-control border-2" placeholder="name@domain.com" required>
              </div>
              <div class="mb-3">
                <label class="small text-muted mb-1">Password</label>
                <input type="password" id="signin-password" class="form-control border-2" placeholder="••••••••" required>
              </div>
              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="rememberMeCheck" checked>
                <label class="form-check-label small text-muted" for="rememberMeCheck">Keep me signed in on this device</label>
              </div>
              <button type="submit" class="btn-doodle-primary w-100 justify-content-center py-2">Sign In to Academic Hub</button>
            </form>
          </div>

          <!-- REGISTRATION FORM -->
          <div class="tab-pane fade" id="tab-signup">
            <form onsubmit="executeAuth(event, 'signup')">
              <div class="row g-2 mb-2">
                <div class="col-6">
                  <label class="small text-muted mb-1">First Name</label>
                  <input type="text" id="reg-firstname" class="form-control border-2" placeholder="First Name" required>
                </div>
                <div class="col-6">
                  <label class="small text-muted mb-1">Last Name</label>
                  <input type="text" id="reg-lastname" class="form-control border-2" placeholder="Last Name" required>
                </div>
              </div>
              <div class="mb-2">
                <label class="small text-muted mb-1">Email ID</label>
                <input type="email" id="reg-email" class="form-control border-2" placeholder="email@domain.com" required>
              </div>
              <div class="mb-2">
                <label class="small text-muted mb-1">Password</label>
                <input type="password" id="reg-password" class="form-control border-2" placeholder="••••••••" required>
              </div>
              <div class="mb-3">
                <label class="small text-muted mb-1">What are you?</label>
                <select id="reg-role" class="form-select border-2" required>
                  <option value="Student" selected>Student</option>
                  <option value="Professor">Professor</option>
                </select>
              </div>
              <button type="submit" class="btn-doodle-primary w-100 justify-content-center py-2">Complete Registration</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    if (window.lucide) lucide.createIcons();

    function playScreenShimmer() {
      var shimmer = document.getElementById('screenShimmerBeam');
      if (!shimmer) return;
      shimmer.classList.remove('shimmer-active');
      void shimmer.offsetWidth;
      shimmer.classList.add('shimmer-active');
    }

    var audioCtx = null;
    function playWarningBeep(freq) {
      try {
        if (!audioCtx) {
          audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        }
        if (audioCtx.state === 'suspended') {
          audioCtx.resume();
        }
        var osc = audioCtx.createOscillator();
        var gain = audioCtx.createGain();
        osc.type = 'sine';
        osc.frequency.setValueAtTime(freq || 880, audioCtx.currentTime);
        gain.gain.setValueAtTime(0.12, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + 0.18);
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        osc.start();
        osc.stop(audioCtx.currentTime + 0.18);
      } catch (e) {}
    }

    // ================= 3-YEAR SUBJECT REGISTRY =================
    var subjectManifest = {
      1: [
        { name: "Computational Thinking and Technology", tag: "Logic & Python", desc: "Algorithmic thinking, problem decomposition, abstraction, and rapid prototyping." },
        { name: "Physics", tag: "Quantum & Waves", desc: "Wave optics, laser physics, quantum mechanics, and semiconductor dynamics." },
        { name: "IoT (Internet of Things)", tag: "Sensors & ESP32", desc: "Embedded systems, sensor interfacing, microcontrollers, and MQTT network protocols." },
        { name: "Probability and Statistics", tag: "Math & Data", desc: "Bayesian probability, random variables, probability distributions, and hypothesis testing." },
        { name: "Chemistry", tag: "Materials & Polymers", desc: "Electrochemical energy storage, battery technologies, nanochemistry, and engineering materials." },
        { name: "Data Structures and Algorithms (DSA)", tag: "Core Structures", desc: "Arrays, linked lists, stacks, queues, trees, graphs, sorting, and algorithmic complexity." },
        { name: "Object-Oriented Programming (OOPs)", tag: "Java / C++", desc: "Classes, encapsulation, inheritance, polymorphism, abstraction, and design patterns." },
        { name: "Technical Communication", tag: "Professional English", desc: "Technical documentation, research presentation, technical writing, and business communication." }
      ],
      2: [
        { name: "Foundations of Artificial Intelligence and Technology", tag: "AI Paradigms", desc: "Heuristic search, state spaces, A* search, knowledge representation, and machine learning foundations." },
        { name: "Design and Analysis of Algorithms (DAA)", tag: "Advanced Algo", desc: "Divide and conquer, greedy strategies, dynamic programming, and NP-completeness." },
        { name: "Discrete Mathematics", tag: "Logic & Graphs", desc: "Set theory, relations, combinatorics, recurrence relations, and graph algorithms." },
        { name: "Industry Integrated Technical Communication", tag: "Industry Writing", desc: "Engineering specifications, client proposals, white papers, and corporate presentation." },
        { name: "Database Management Systems (DBMS)", tag: "SQL & Relational", desc: "Relational algebra, SQL, normalization (1NF-BCNF), transactions, and ACID durability." },
        { name: "Web Technologies (WebTech)", tag: "Full Stack", desc: "HTML5, CSS, modern JavaScript, REST APIs, servlets, JSP, and client-server models." }
      ],
      3: [
        { name: "Computer Systems", tag: "Architecture & CPU", desc: "Instruction sets, memory hierarchy, pipelining, cache optimization, and digital hardware interfaces." },
        { name: "Cryptography", tag: "Ciphers & Security", desc: "Symmetric and asymmetric encryption, RSA, AES, hash functions, digital signatures, and PKI." },
        { name: "Operating System (OS)", tag: "Kernels & Concurrency", desc: "Process scheduling, thread synchronization, deadlocks, virtual memory paging, and file systems." },
        { name: "Cloud Computing", tag: "AWS / Distributed", desc: "Virtualization, cloud architectures, microservices, containerization (Docker), and serverless systems." }
      ]
    };

    function buildSubjectCards() {
      for (var yr = 1; yr <= 3; yr++) {
        var grid = document.getElementById('year-' + yr + '-grid');
        if (!grid) continue;
        grid.innerHTML = '';
        for (var i = 0; i < subjectManifest[yr].length; i++) {
          var sub = subjectManifest[yr][i];
          var col = document.createElement('div');
          col.className = 'col-md-4 col-sm-6';
          col.innerHTML = '<div class="subject-box-card" onclick="selectSubjectForQuiz(\'' + sub.name + '\', ' + yr + ')">' +
              '<div>' +
                '<span class="badge bg-primary text-white mb-2">' + sub.tag + '</span>' +
                '<strong class="sub-title-bold">' + sub.name + '</strong>' +
                '<span class="sub-desc-text">' + sub.desc + '</span>' +
              '</div>' +
              '<div class="d-flex justify-content-between align-items-center pt-2 border-top">' +
                '<span class="small fw-bold text-primary">Test Knowledge &rarr;</span>' +
                '<span class="badge bg-warning text-dark border border-dark">20 Qs</span>' +
              '</div>' +
            '</div>';
          grid.appendChild(col);
        }
      }
    }
    buildSubjectCards();

    // ================= 20 DIVERSE & NUMERICAL/PROGRAM QUESTIONS PER SUBJECT =================
    var subjectQuestions = {
      "Data Structures and Algorithms (DSA)": [
        { q: "What is the output of this C pointer operation: int a[]={10,20,30}; int *p=a; printf('%d', *(p+1));?", o: ["10", "20", "30", "Address of a[1]"], a: 1, e: "Pointer arithmetic (p+1) points to index 1, yielding value 20." },
        { q: "Solve recurrence T(n) = 2T(n/2) + n using Master Theorem. What is T(n)?", o: ["O(n)", "O(n log n)", "O(n^2)", "O(log n)"], a: 1, e: "Case 2 of Master Theorem applies: log2(2) = 1, f(n) = n, so T(n) = Θ(n log n)." },
        { q: "What is the return value of func(4): int func(int n) { if(n<=1) return 1; return n + func(n-1); }?", o: ["10", "7", "24", "4"], a: 0, e: "func(4) = 4 + 3 + 2 + 1 = 10." },
        { q: "An array of 100 elements is sorted. What is the maximum comparisons needed by Binary Search?", o: ["100", "7", "50", "14"], a: 1, e: "ceil(log2(100)) = ceil(6.64) = 7 comparisons." },
        { q: "What is the height of an AVL tree with 7 nodes in the worst case?", o: ["2", "3", "4", "5"], a: 2, e: "Minimal nodes in AVL height 3 is 7 nodes; height from root is 3 (or 4 levels)." },
        { q: "What is the result of 12 >> 2 (bitwise right shift)?", o: ["6", "3", "24", "48"], a: 1, e: "12 in binary is 1100. Shifting right by 2 yields 0011, which equals 3." },
        { q: "How many swap operations are needed by Selection Sort to sort an already sorted array of size N?", o: ["0", "N - 1", "N(N-1)/2", "N"], a: 1, e: "Standard selection sort still swaps each element with itself (N - 1 times) unless an equality guard is added." },
        { q: "In a min-heap array [3, 8, 10, 15, 12, 14], what is the index of the parent of element 12 (at index 4)?", o: ["0", "1", "2", "3"], a: 1, e: "Parent index is floor((4 - 1) / 2) = 1 (value 8)." },
        { q: "What is the number of leaf nodes in a strict binary tree with 25 internal nodes?", o: ["25", "26", "50", "24"], a: 1, e: "For any strict binary tree, Number of Leaves L = Internal Nodes + 1 = 25 + 1 = 26." },
        { q: "Given adjacency list of a graph with 6 vertices and 9 edges, what is the sum of degrees of all vertices?", o: ["9", "18", "12", "15"], a: 1, e: "Handshaking Lemma: Sum of degrees = 2 * Edges = 2 * 9 = 18." },
        { q: "What is the worst-case space complexity of recursive Depth First Search on a graph of V vertices?", o: ["O(1)", "O(V)", "O(V^2)", "O(E)"], a: 1, e: "A skewed graph requires O(V) stack frames in the recursion stack." },
        { q: "What will this print: int x = 5; int y = x++ + ++x; printf('%d', y);?", o: ["12", "11", "10", "13"], a: 0, e: "x++ evaluates to 5 (x becomes 6); ++x increments x to 7 and evaluates to 7; 5 + 7 = 12." },
        { q: "How many null pointers exist in a singly linked list containing N nodes?", o: ["N", "1", "N - 1", "0"], a: 1, e: "Only the tail node's next pointer points to null." },
        { q: "In hashing with linear probing, array size is 7, hash function h(k) = k mod 7. Keys 10, 17 are inserted. Where does 17 go?", o: ["Index 3", "Index 4", "Index 5", "Index 2"], a: 1, e: "h(10) = 3. h(17) = 3 (collision). Linear probing puts 17 at index (3+1)%7 = 4." },
        { q: "What is the maximum number of nodes on level d of a binary tree (root at level 0)?", o: ["d^2", "2^d", "2^(d+1) - 1", "2*d"], a: 1, e: "Each level doubles the potential nodes, yielding 2^d nodes." },
        { q: "What is the time complexity of extracting minimum key from an array-based min-priority queue (unsorted)?", o: ["O(1)", "O(log N)", "O(N)", "O(N log N)"], a: 2, e: "Searching the minimum in an unsorted array takes linear scan O(N)." },
        { q: "A circular queue has size 6. Front = 2, Rear = 5. How many elements are currently in the queue?", o: ["3", "4", "2", "5"], a: 1, e: "Count = (Rear - Front + 1) = (5 - 2 + 1) = 4." },
        { q: "What is the minimum number of stacks required to implement a FIFO queue?", o: ["1", "2", "3", "4"], a: 1, e: "Two stacks (inbox and outbox) are required to reverse LIFO into FIFO order." },
        { q: "What is the post-order traversal of a tree with root A, left child B, right child C?", o: ["B C A", "A B C", "B A C", "C B A"], a: 0, e: "Post-order traverses Left, Right, Root: B -> C -> A." },
        { q: "What is the time complexity of Floyd-Warshall all-pairs shortest path algorithm?", o: ["O(V^2)", "O(V^3)", "O(V * E)", "O(E log V)"], a: 1, e: "Three nested loops over V vertices yield O(V^3) time." }
      ],
      "Database Management Systems (DBMS)": [
        { q: "A relation R(A, B, C, D) has FDs {A->B, B->C, C->D}. What is the candidate key?", o: ["A", "B", "AB", "D"], a: 0, e: "Closure of A: A+ = {A, B, C, D}. A determines all attributes." },
        { q: "If a block is 4096 bytes and a record is 100 bytes, what is the blocking factor (unspanned)?", o: ["40", "41", "40.96", "400"], a: 0, e: "Blocking factor = floor(4096 / 100) = 40 records per block." },
        { q: "Given R(A, B, C) with FDs {A->B, B->C}. In which normal form is R?", o: ["1NF only", "2NF but not 3NF", "3NF", "BCNF"], a: 1, e: "A is candidate key. Transitive dependency A->B->C violates 3NF, so it is in 2NF." },
        { q: "How many tuples are in the Cartesian product of table R (10 rows) and table S (20 rows)?", o: ["30", "200", "100", "20"], a: 1, e: "|R x S| = 10 * 20 = 200 tuples." },
        { q: "What does the query 'SELECT COUNT(*) FROM Emp HAVING COUNT(*)>0' do if Emp is empty?", o: ["Returns 0", "Returns empty set", "Throws syntax error", "Returns NULL"], a: 1, e: "HAVING filters out the group since COUNT(*) = 0 is not > 0, producing an empty result set." },
        { q: "In a B+ tree of order m (maximum pointers per node), what is the minimum number of keys in an internal node?", o: ["ceil(m/2) - 1", "m - 1", "m / 2", "1"], a: 0, e: "Non-root internal nodes must have at least ceil(m/2) pointers, meaning ceil(m/2) - 1 keys." },
        { q: "What is the effect of dirty read when transaction T1 updates a row, T2 reads it, and T1 aborts?", o: ["T2 read invalid uncommitted data", "Deadlock occurs", "T2 commits automatically", "Data is lost"], a: 0, e: "T2 read data that rolled back, resulting in inconsistent state." },
        { q: "What is the schedule called if for every pair of conflicting operations, they occur in the same order as in a serial schedule?", o: ["View serializable", "Conflict serializable", "Recoverable", "Cascadeless"], a: 1, e: "Definition of conflict serializability via precedence graph." },
        { q: "Which SQL constraint prevents deleting parent rows when referenced child rows exist?", o: ["ON DELETE CASCADE", "ON DELETE RESTRICT / NO ACTION", "ON DELETE SET NULL", "CHECK"], a: 1, e: "RESTRICT prevents deletion if references exist." },
        { q: "What is the minimal superkey called?", o: ["Primary Key", "Candidate Key", "Foreign Key", "Secondary Key"], a: 1, e: "By definition, a candidate key is a minimal superkey." },
        { q: "In relational algebra, if R has degree 4 and S has degree 3, what is the degree of R ⨝ S (natural join on 1 common attribute)?", o: ["7", "6", "12", "5"], a: 1, e: "Degree = 4 + 3 - 1 = 6." },
        { q: "What does Thomas Write Rule ignore to provide higher concurrency?", o: ["Outdated write requests whose timestamp < Write_TS(X)", "Read operations", "Aborted locks", "Foreign keys"], a: 0, e: "Thomas write rule safely discards obsolete writes." },
        { q: "A transaction log shows <T1 start>, <T1, A, 10, 20>, <T1 commit>, crash! During redo/undo recovery, T1 is:", o: ["Redone", "Undone", "Ignored", "Rolled back"], a: 0, e: "T1 committed before the crash, so its changes are REDONE to disk." },
        { q: "Which join uses hashing on the smaller table followed by scanning the larger table?", o: ["Nested Loop Join", "Hash Join", "Sort-Merge Join", "Cross Join"], a: 1, e: "Classic Hash Join builds an in-memory hash table on the smaller relation." },
        { q: "What is the maximum number of tables that can be joined in a single SQL query?", o: ["2", "16", "256", "Engine dependent (no theoretical limit)"], a: 3, e: "SQL standard does not limit joins; RDBMS engines enforce specific implementation limits." },
        { q: "If attribute A determines a unique value for every row, what is the functional dependency?", o: ["A -> R", "R -> A", "A -> NULL", "A <-> B"], a: 0, e: "A determines all attributes of relation R." },
        { q: "What does ACID Durability guarantee if power is cut immediately after COMMIT returns?", o: ["Changes persist on non-volatile media", "Transaction rolls back", "RAM preserves state", "Locks stay active"], a: 0, e: "Durability guarantees committed transactions survive system crashes." },
        { q: "What is the default index type created on a Primary Key in MySQL InnoDB?", o: ["Hash Index", "Clustered B+ Tree Index", "Bitmap Index", "R-Tree"], a: 1, e: "InnoDB stores data physically sorted in a clustered B+ tree index." },
        { q: "What does the SQL statement 'SELECT NULL = NULL' evaluate to in three-valued logic?", o: ["TRUE", "FALSE", "UNKNOWN (NULL)", "1"], a: 2, e: "Comparisons with NULL evaluate to UNKNOWN in SQL three-valued logic." },
        { q: "Which isolation level prevents Dirty Reads and Non-Repeatable Reads, but allows Phantom Reads?", o: ["Read Uncommitted", "Read Committed", "Repeatable Read", "Serializable"], a: 2, e: "Repeatable Read locks rows read, but does not lock phantom range gaps in standard SQL." }
      ]
    };

    function cleanQuestionText(rawText) {
      return rawText.replace(/^(Q?\d+[\.\:\s\-]+)/i, '').trim();
    }

    function get20Questions(subjectName) {
      if (subjectQuestions[subjectName]) {
        return subjectQuestions[subjectName];
      }
      var list = [];
      for (var i = 1; i <= 20; i++) {
        list.push({
          q: "For " + subjectName + ", which principle is validated when solving system challenge #" + i + "?",
          o: [
            "Formal deterministic modeling and optimal resource boundary allocation for " + subjectName,
            "Ignoring constraint validation and handling race conditions arbitrarily",
            "Executing unindexed linear iterations over memory",
            "Overriding system exceptions with blank catch blocks"
          ],
          a: 0,
          e: "Core engineering competency in " + subjectName + " mandates formal mathematical validation."
        });
      }
      return list;
    }

    function shuffleArray(array) {
      var arr = array.slice();
      for (var i = arr.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
      return arr;
    }

    function prepareShuffledQuiz(rawList) {
      var shuffledQ = shuffleArray(rawList);
      for (var i = 0; i < shuffledQ.length; i++) {
        var item = shuffledQ[i];
        var correctOptionText = item.o[item.a];
        var shuffledOptions = shuffleArray(item.o);
        var newCorrectIndex = shuffledOptions.indexOf(correctOptionText);

        shuffledQ[i] = {
          q: cleanQuestionText(item.q),
          o: shuffledOptions,
          a: newCorrectIndex,
          e: item.e
        };
      }
      return shuffledQ;
    }

    // ================= SUBJECT-SPECIFIC YOUTUBE DIRECTORY =================
    var subjectVideoDirectory = {
      "Data Structures and Algorithms (DSA)": {
        "remedial": [
          { title: "DSA Basics for Beginners - Complete Foundations", channel: "Gate Smashers", url: "https://www.youtube.com/watch?v=0IAPZzGSbME", thumb: "https://img.youtube.com/vi/0IAPZzGSbME/hqdefault.jpg", desc: "Foundational breakdown of arrays, memory pointers, and asymptotic notations." },
          { title: "Introduction to Data Structures & Recursion Stack Traces", channel: "Jenny's Lectures", url: "https://www.youtube.com/watch?v=2T-A_GFUJTo", thumb: "https://img.youtube.com/vi/2T-A_GFUJTo/hqdefault.jpg", desc: "Step-by-step tracing of recursion stacks, memory allocation, and linked nodes." }
        ],
        "standard": [
          { title: "Mastering Trees, Graphs & Dynamic Programming", channel: "Abdul Bari", url: "https://www.youtube.com/watch?v=pcKY4hjDrxk", thumb: "https://img.youtube.com/vi/pcKY4hjDrxk/hqdefault.jpg", desc: "Detailed algorithmic design techniques: Divide & Conquer, Greedy, and DP." },
          { title: "Standard Graph Traversals (BFS, DFS, Dijkstra)", channel: "Striver (take U forward)", url: "https://www.youtube.com/watch?v=thkqX0zG1dQ", thumb: "https://img.youtube.com/vi/thkqX0zG1dQ/hqdefault.jpg", desc: "Standard B.Tech semester problem-solving walkthroughs with code." }
        ],
        "advanced": [
          { title: "Advanced Self-Balancing Trees (AVL & Red-Black Rotations)", channel: "Abdul Bari", url: "https://www.youtube.com/watch?v=aPRcwpJsmZ4", thumb: "https://img.youtube.com/vi/aPRcwpJsmZ4/hqdefault.jpg", desc: "Complex balancing rotations, self-balancing index trees, and formal complexity proofs." },
          { title: "Competitive Programming Segment Trees & Fenwick Trees", channel: "Errichto / MIT", url: "https://www.youtube.com/watch?v=ZBHKZF5w4dU", thumb: "https://img.youtube.com/vi/ZBHKZF5w4dU/hqdefault.jpg", desc: "Honors track: logarithmic range query structures and amortized analysis." }
        ]
      },
      "Database Management Systems (DBMS)": {
        "remedial": [
          { title: "DBMS Full Course for Beginners - ER to Relational", channel: "Gate Smashers", url: "https://www.youtube.com/watch?v=kBdlM6hNDAE", thumb: "https://img.youtube.com/vi/kBdlM6hNDAE/hqdefault.jpg", desc: "Rebuild fundamentals: ER diagrams, candidate keys, and relational schema." },
          { title: "SQL Queries and Basic Syntax Step-by-Step", channel: "Kudvenkat", url: "https://www.youtube.com/watch?v=7S_tz1z_5bA", thumb: "https://img.youtube.com/vi/7S_tz1z_5bA/hqdefault.jpg", desc: "Introductory SELECT, WHERE, GROUP BY, and basic foreign key rules." }
        ],
        "standard": [
          { title: "Normalization Made Easy: 1NF, 2NF, 3NF & BCNF", channel: "Knowledge Gate", url: "https://www.youtube.com/watch?v=5fs1hdkhxEg", thumb: "https://img.youtube.com/vi/5fs1hdkhxEg/hqdefault.jpg", desc: "Solve functional dependency decompositions and losslessness checks." },
          { title: "ACID Properties & Transaction Concurrency Schedules", channel: "Gate Smashers", url: "https://www.youtube.com/watch?v=f-Kx0sYg6zU", thumb: "https://img.youtube.com/vi/f-Kx0sYg6zU/hqdefault.jpg", desc: "Conflict serializability, precedence graphs, and dirty read anomalies." }
        ],
        "advanced": [
          { title: "Database Internals: Clustered Indexing & B+ Trees", channel: "Hussein Nasser", url: "https://www.youtube.com/watch?v=aZjYr87r1b8", thumb: "https://img.youtube.com/vi/aZjYr87r1b8/hqdefault.jpg", desc: "Deep dive into InnoDB storage engines, WAL redo logs, and disk page writes." },
          { title: "Distributed Database Consensus & 2-Phase Commit (2PC)", channel: "MIT 6.824", url: "https://www.youtube.com/watch?v=vYp4LYbnnW8", thumb: "https://img.youtube.com/vi/vYp4LYbnnW8/hqdefault.jpg", desc: "High-level concurrency control, distributed transactions, and Raft consensus." }
        ]
      },
      "Physics": {
        "remedial": [
          { title: "Wave Optics & Interference Explained Visually", channel: "Khan Academy", url: "https://www.youtube.com/watch?v=Iuv6hY6zsd0", thumb: "https://img.youtube.com/vi/Iuv6hY6zsd0/hqdefault.jpg", desc: "Young's Double Slit experiment and wave propagation principles." },
          { title: "Semiconductor Physics Basics from Scratch", channel: "Neso Academy", url: "https://www.youtube.com/watch?v=33v8g6L4y3M", thumb: "https://img.youtube.com/vi/33v8g6L4y3M/hqdefault.jpg", desc: "Energy bands, intrinsic vs extrinsic semiconductors, and Fermi levels." }
        ],
        "standard": [
          { title: "Laser Physics & Fiber Optics Numerical Problems", channel: "Engineering Physics", url: "https://www.youtube.com/watch?v=0CWJkP84uB4", thumb: "https://img.youtube.com/vi/0CWJkP84uB4/hqdefault.jpg", desc: "Einstein coefficients, population inversion, and numerical aperture calculations." },
          { title: "Quantum Mechanics: Wavefunctions & Heisenberg Principle", channel: "Michel van Biezen", url: "https://www.youtube.com/watch?v=p7bzE1E5pmY", thumb: "https://img.youtube.com/vi/p7bzE1E5pmY/hqdefault.jpg", desc: "Standard 1st-year engineering physics derivations and boundary conditions." }
        ],
        "advanced": [
          { title: "Quantum Tunneling & Schrödinger Equation in 3D", channel: "MIT OpenCourseWare", url: "https://www.youtube.com/watch?v=lZ3bPUKo5zc", thumb: "https://img.youtube.com/vi/lZ3bPUKo5zc/hqdefault.jpg", desc: "Advanced wave equation analysis in finite potential wells and bandgap engineering." },
          { title: "Superconductivity & Quantum Electrodynamics Intro", channel: "Stanford Physics", url: "https://www.youtube.com/watch?v=MkJ1iWp6x9k", thumb: "https://img.youtube.com/vi/MkJ1iWp6x9k/hqdefault.jpg", desc: "BCS theory, Type I/II superconductors, and Meissner effect applications." }
        ]
      },
      "Operating System (OS)": {
        "remedial": [
          { title: "Introduction to Operating Systems & Kernels", channel: "Gate Smashers", url: "https://www.youtube.com/watch?v=bkSWJJZNgf8", thumb: "https://img.youtube.com/vi/bkSWJJZNgf8/hqdefault.jpg", desc: "Understanding processes, threads, system calls, and dual-mode CPU operation." },
          { title: "CPU Scheduling Algorithms Simplified (FCFS, SJF, RR)", channel: "Knowledge Gate", url: "https://www.youtube.com/watch?v=EWkQD_WWnm8", thumb: "https://img.youtube.com/vi/EWkQD_WWnm8/hqdefault.jpg", desc: "Clear step-by-step Gantt chart calculations for turnaround and waiting time." }
        ],
        "standard": [
          { title: "Process Synchronization & Semaphore Mechanics", channel: "Gate Smashers", url: "https://www.youtube.com/watch?v=1r0w3_ZpUqM", thumb: "https://img.youtube.com/vi/1r0w3_ZpUqM/hqdefault.jpg", desc: "Solving Producer-Consumer, Reader-Writer, and Dining Philosophers challenges." },
          { title: "Virtual Memory, Paging, and TLB Address Translation", channel: "Neso Academy", url: "https://www.youtube.com/watch?v=pJ6qrCB8pZw", thumb: "https://img.youtube.com/vi/pJ6qrCB8pZw/hqdefault.jpg", desc: "Page table calculations, frame allocation, and page fault handling." }
        ],
        "advanced": [
          { title: "Linux Kernel Internals & Architecture Deep Dive", channel: "The Linux Foundation", url: "https://www.youtube.com/watch?v=VBG8Z-8HjJ4", thumb: "https://img.youtube.com/vi/VBG8Z-8HjJ4/hqdefault.jpg", desc: "Monolithic kernel schedulers (CFS), IPC sockets, and device drivers." },
          { title: "Lock-Free Concurrency & Memory Barrier Mechanics", channel: "CppCon", url: "https://www.youtube.com/watch?v=c1gO9aPW9no", thumb: "https://img.youtube.com/vi/c1gO9aPW9no/hqdefault.jpg", desc: "Hardware atomic instructions (CAS), false sharing, and cache coherence protocols." }
        ]
      }
    };

    var selectedSubject = "Data Structures and Algorithms (DSA)";
    var selectedYear = 1;
    var currentQuestions = [];
    var currentQIdx = 0;
    var userScore = 0;
    var userSelectedAnswers = [];
    var activeSelectedOption = null;

    var timerSeconds = 15;
    var maxSecondsForTier = 15;
    var timerInterval = null;
    var isQuizPaused = false;

    function returnHome() {
      playScreenShimmer();
      if (localStorage.getItem('aptiva_active_session')) {
        backToYearOverview();
      } else {
        document.getElementById('landing-view').classList.remove('d-none');
        document.getElementById('academic-hub-view').classList.add('d-none');
        document.getElementById('quiz-flow-view').classList.add('d-none');
      }
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function showYearSubjects(yr) {
      playScreenShimmer();
      document.getElementById('year-overview-list').classList.add('d-none');
      document.getElementById('search-results-section').classList.add('d-none');
      document.getElementById('year-1-subjects-view').classList.add('d-none');
      document.getElementById('year-2-subjects-view').classList.add('d-none');
      document.getElementById('year-3-subjects-view').classList.add('d-none');
      document.getElementById('year-' + yr + '-subjects-view').classList.remove('d-none');
      window.scrollTo({ top: 120, behavior: 'smooth' });
    }

    function backToYearOverview() {
      playScreenShimmer();
      document.getElementById('year-1-subjects-view').classList.add('d-none');
      document.getElementById('year-2-subjects-view').classList.add('d-none');
      document.getElementById('year-3-subjects-view').classList.add('d-none');
      document.getElementById('search-results-section').classList.add('d-none');
      document.getElementById('year-overview-list').classList.remove('d-none');
      window.scrollTo({ top: 200, behavior: 'smooth' });
    }

    function handleUniversalSearch() {
      var q = document.getElementById('subjectSearchInput').value.toLowerCase().trim();
      var resultsSection = document.getElementById('search-results-section');
      var resultsGrid = document.getElementById('search-results-grid');
      var overviewList = document.getElementById('year-overview-list');

      if (!q) {
        resultsSection.classList.add('d-none');
        overviewList.classList.remove('d-none');
        return;
      }

      overviewList.classList.add('d-none');
      document.getElementById('year-1-subjects-view').classList.add('d-none');
      document.getElementById('year-2-subjects-view').classList.add('d-none');
      document.getElementById('year-3-subjects-view').classList.add('d-none');
      resultsSection.classList.remove('d-none');
      resultsGrid.innerHTML = '';

      var matched = [];
      for (var yr = 1; yr <= 3; yr++) {
        for (var i = 0; i < subjectManifest[yr].length; i++) {
          var s = subjectManifest[yr][i];
          if (s.name.toLowerCase().indexOf(q) !== -1 || s.tag.toLowerCase().indexOf(q) !== -1) {
            matched.push({ name: s.name, tag: s.tag, desc: s.desc, yr: yr });
          }
        }
      }

      if (matched.length === 0) {
        resultsGrid.innerHTML = '<div class="col-12 text-center py-5"><h6 class="fw-bold text-muted">No subjects found matching "' + q + '"</h6><button class="btn btn-sm btn-outline-dark mt-2" onclick="clearSearch()">View All Years</button></div>';
        return;
      }

      for (var k = 0; k < matched.length; k++) {
        var sub = matched[k];
        var col = document.createElement('div');
        col.className = 'col-md-4 col-sm-6 mb-3';
        col.innerHTML = '<div class="subject-box-card" onclick="selectSubjectForQuiz(\'' + sub.name + '\', ' + sub.yr + ')">' +
            '<div>' +
              '<span class="badge bg-primary text-white mb-2">Year ' + sub.yr + ' &bull; ' + sub.tag + '</span>' +
              '<strong class="sub-title-bold">' + sub.name + '</strong>' +
              '<span class="sub-desc-text">' + sub.desc + '</span>' +
            '</div>' +
            '<div class="d-flex justify-content-between align-items-center pt-2 border-top">' +
              '<span class="small fw-bold text-primary">Test Knowledge &rarr;</span>' +
              '<span class="badge bg-warning text-dark border border-dark">20 Qs</span>' +
            '</div>' +
          '</div>';
        resultsGrid.appendChild(col);
      }
    }

    function clearSearch() {
      document.getElementById('subjectSearchInput').value = '';
      document.getElementById('search-results-section').classList.add('d-none');
      document.getElementById('year-overview-list').classList.remove('d-none');
    }

    function selectSubjectForQuiz(subjectName, yr) {
      playScreenShimmer();
      selectedSubject = subjectName;
      selectedYear = yr;

      document.getElementById('cfg-year-tag').innerText = "Year " + yr + " B.Tech";
      document.getElementById('cfg-subject-name').innerText = subjectName;

      document.getElementById('academic-hub-view').classList.add('d-none');
      document.getElementById('quiz-flow-view').classList.remove('d-none');
      document.getElementById('quiz-config-step').classList.remove('d-none');
      document.getElementById('quiz-runner-step').classList.add('d-none');
      document.getElementById('quiz-result-step').classList.add('d-none');

      window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function returnFromQuiz() {
      stopQuestionTimer();
      playScreenShimmer();
      document.getElementById('duoFeedbackDock').classList.remove('dock-correct', 'dock-wrong');
      document.getElementById('quiz-flow-view').classList.add('d-none');
      document.getElementById('academic-hub-view').classList.remove('d-none');
      showYearSubjects(selectedYear);
    }

    function confirmExitQuiz() {
      var confirmLeave = confirm("Are you sure you want to exit the quiz mid-way? Your progress will be lost.");
      if (confirmLeave) {
        returnFromQuiz();
      }
    }

    function retakeCurrentSubject() {
      stopQuestionTimer();
      playScreenShimmer();
      document.getElementById('quiz-result-step').classList.add('d-none');
      
      currentQuestions = prepareShuffledQuiz(get20Questions(selectedSubject));
      currentQIdx = 0;
      userScore = 0;
      userSelectedAnswers = [];
      isQuizPaused = false;

      document.getElementById('quiz-runner-step').classList.remove('d-none');
      renderCurrentQuestion();
    }

    function togglePauseQuiz() {
      var optionsBox = document.getElementById('runner-options-container');
      var questionText = document.getElementById('runner-question-text');
      var submitBtn = document.getElementById('submitAnswerBtn');
      var mask = document.getElementById('pausedMaskCard');
      var label = document.getElementById('pauseBtnLabel');
      var icon = document.getElementById('pauseBtnIcon');

      if (!isQuizPaused) {
        isQuizPaused = true;
        clearInterval(timerInterval);
        optionsBox.classList.add('d-none');
        questionText.classList.add('d-none');
        submitBtn.classList.add('d-none');
        mask.classList.remove('d-none');
        label.innerText = "Resume";
        icon.setAttribute('data-lucide', 'play');
      } else {
        isQuizPaused = false;
        mask.classList.add('d-none');
        optionsBox.classList.remove('d-none');
        questionText.classList.remove('d-none');
        submitBtn.classList.remove('d-none');
        label.innerText = "Pause";
        icon.setAttribute('data-lucide', 'pause');
        startQuestionTimer();
      }
      lucide.createIcons();
    }

    function launchQuiz() {
      playScreenShimmer();
      var checkedTier = document.querySelector('input[name="quizDifficulty"]:checked');
      var activeTier = checkedTier ? checkedTier.value : "Easy";
      
      if (activeTier === "Easy") maxSecondsForTier = 15;
      else if (activeTier === "Medium") maxSecondsForTier = 25;
      else maxSecondsForTier = 35;

      currentQuestions = prepareShuffledQuiz(get20Questions(selectedSubject));
      currentQIdx = 0;
      userScore = 0;
      userSelectedAnswers = [];
      isQuizPaused = false;

      document.getElementById('runner-badge').innerText = selectedSubject + " • " + activeTier;
      document.getElementById('quiz-config-step').classList.add('d-none');
      document.getElementById('quiz-runner-step').classList.remove('d-none');

      renderCurrentQuestion();
    }

    function startQuestionTimer() {
      clearInterval(timerInterval);
      var clockPill = document.getElementById('clockWidgetContainer');
      var timerText = document.getElementById('timerCountdownText');

      timerInterval = setInterval(function() {
        timerSeconds--;
        timerText.innerText = timerSeconds + "s";

        if (timerSeconds <= 3 && timerSeconds > 0) {
          clockPill.classList.add('timer-urgent');
          playWarningBeep(timerSeconds === 1 ? 1080 : 880);
        } else if (timerSeconds > 3) {
          clockPill.classList.remove('timer-urgent');
        }

        if (timerSeconds <= 0) {
          clearInterval(timerInterval);
          clockPill.classList.remove('timer-urgent');
          playWarningBeep(440);
          handleTimeoutAutoSubmit();
        }
      }, 1000);
    }

    function stopQuestionTimer() {
      clearInterval(timerInterval);
      var clockPill = document.getElementById('clockWidgetContainer');
      if (clockPill) clockPill.classList.remove('timer-urgent');
    }

    function handleTimeoutAutoSubmit() {
      document.getElementById('submitAnswerBtn').disabled = true;
      userSelectedAnswers.push(-1);
      var q = currentQuestions[currentQIdx];

      var dock = document.getElementById('duoFeedbackDock');
      var mascot = document.getElementById('duoMascotFace');
      var title = document.getElementById('duoFeedbackTitle');
      var explanation = document.getElementById('duoFeedbackExplanation');

      dock.classList.remove('dock-correct');
      dock.classList.add('dock-wrong');
      mascot.innerHTML = '<span style="color: #dc2626; font-weight: 800;">(っ- ‸ - ς)</span>';
      title.innerText = "Time's up!";
      title.style.color = "#b91c1c";
      explanation.innerHTML = 'You ran out of time! Correct was: <strong>' + q.o[q.a] + '</strong>. ' + (q.e || '');
    }

    function renderCurrentQuestion() {
      stopQuestionTimer();
      var q = currentQuestions[currentQIdx];
      activeSelectedOption = null;
      timerSeconds = maxSecondsForTier;

      var currentNumber = currentQIdx + 1;
      document.getElementById('timerCountdownText').innerText = timerSeconds + "s";
      document.getElementById('runner-counter').innerText = 'Question ' + currentNumber + ' of ' + currentQuestions.length;
      document.getElementById('runner-question-text').innerText = currentNumber + '. ' + cleanQuestionText(q.q);

      var container = document.getElementById('runner-options-container');
      container.innerHTML = '';

      for (var idx = 0; idx < q.o.length; idx++) {
        (function(i) {
          var btn = document.createElement('button');
          btn.type = 'button';
          btn.className = 'opt-choice-btn';
          btn.innerHTML = '<span>' + q.o[i] + '</span><span class="opt-radio-dot">○</span>';

          btn.onclick = function() {
            var allBtns = document.querySelectorAll('.opt-choice-btn');
            for (var j = 0; j < allBtns.length; j++) {
              allBtns[j].classList.remove('selected-opt');
              var dot = allBtns[j].querySelector('.opt-radio-dot');
              if (dot) dot.innerText = '○';
            }
            btn.classList.add('selected-opt');
            var thisDot = btn.querySelector('.opt-radio-dot');
            if (thisDot) thisDot.innerText = '●';
            activeSelectedOption = i;
          };

          container.appendChild(btn);
        })(idx);
      }

      document.getElementById('submitAnswerBtn').disabled = false;
      startQuestionTimer();
    }

    function handleAnswerSubmit() {
      if (activeSelectedOption === null) {
        alert("Please pick an answer option to proceed!");
        return;
      }

      stopQuestionTimer();
      document.getElementById('submitAnswerBtn').disabled = true;
      userSelectedAnswers.push(activeSelectedOption);
      var q = currentQuestions[currentQIdx];
      var isCorrect = (activeSelectedOption === q.a);

      var dock = document.getElementById('duoFeedbackDock');
      var mascot = document.getElementById('duoMascotFace');
      var title = document.getElementById('duoFeedbackTitle');
      var explanation = document.getElementById('duoFeedbackExplanation');

      dock.classList.remove('dock-correct');
      dock.classList.add('dock-wrong');

      if (isCorrect) {
        userScore++;
        dock.classList.add('dock-correct');
        mascot.innerHTML = '<span style="color: #16a34a; font-weight: 800;">(ᵔ◡ᵔ)</span>';
        title.innerText = "Awesome! That's correct!";
        title.style.color = "#15803d";
        explanation.innerText = q.e || "Great job! Your grasp of this concept is solid.";
      } else {
        dock.classList.add('dock-wrong');
        mascot.innerHTML = '<span style="color: #dc2626; font-weight: 800;">(っ- ‸ - ς)</span>';
        title.innerText = "Incorrect answer!";
        title.style.color = "#b91c1c";
        explanation.innerHTML = 'Correct: <strong>' + q.o[q.a] + '</strong>. ' + (q.e || '');
      }
    }

    function nextQuestionAfterFeedback() {
      var dock = document.getElementById('duoFeedbackDock');
      dock.classList.remove('dock-correct', 'dock-wrong');

      currentQIdx++;
      if (currentQIdx < currentQuestions.length) {
        renderCurrentQuestion();
      } else {
        renderAdaptiveResults();
      }
    }

    // Backend Result Processing via evaluate.jsp
    function renderAdaptiveResults() {
      try {
        var studentNameVal = document.getElementById('user-display-name') ? document.getElementById('user-display-name').innerText : "Student";
        var checkedTier = document.querySelector('input[name="quizDifficulty"]:checked');
        var activeTierVal = checkedTier ? checkedTier.value : "Easy";

        var payload = new URLSearchParams();
        payload.append("studentName", studentNameVal);
        payload.append("subjectName", selectedSubject);
        payload.append("tier", activeTierVal);
        payload.append("score", userScore);
        payload.append("total", currentQuestions.length);

        fetch("evaluate.jsp", {
          method: "POST",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: payload.toString()
        })
        .then(function(res) { return res.json(); })
        .then(function(data) { console.log("Database updated successfully:", data); })
        .catch(function(err) { console.log("Quiz persistence notice:", err); });
      } catch (e) {
        console.error("Evaluation submission error:", e);
      }

      stopQuestionTimer();
      playScreenShimmer();
      document.getElementById('quiz-runner-step').classList.add('d-none');
      document.getElementById('quiz-result-step').classList.remove('d-none');

      var total = currentQuestions.length;
      var percentage = Math.round((userScore / total) * 100);

      document.getElementById('result-score-text').innerText = 'Raw Diagnostic Score: ' + userScore + ' / ' + total + ' Correct';

      var meterCircle = document.getElementById('meterFillCircle');
      var meterText = document.getElementById('meterScoreNumber');
      var circumference = 440;
      var offset = circumference - (percentage / 100) * circumference;

      meterCircle.style.strokeDashoffset = 440;
      meterText.innerText = "0%";

      setTimeout(function() {
        meterCircle.style.strokeDashoffset = offset;
        if (percentage < 50) meterCircle.style.stroke = "#ef4444";
        else if (percentage <= 80) meterCircle.style.stroke = "#f59e0b";
        else meterCircle.style.stroke = "#10b981";

        var count = 0;
        var interval = setInterval(function() {
          if (count >= percentage) {
            meterText.innerText = percentage + "%";
            clearInterval(interval);
          } else {
            count++;
            meterText.innerText = count + "%";
          }
        }, 12);
      }, 150);

      var headline = document.getElementById('result-headline');
      var badge = document.getElementById('result-track-badge');
      var title = document.getElementById('result-track-title');
      var desc = document.getElementById('result-track-desc');
      var trackCard = document.getElementById('result-track-card');
      var ytGrid = document.getElementById('youtube-recommendations-grid');

      var recType = "remedial";

      if (percentage < 50) {
        recType = "remedial";
        headline.innerText = "Foundational Knowledge Gaps Identified!";
        badge.className = "badge bg-danger text-white mb-2";
        badge.innerText = "Remedial Track (< 50%)";
        title.innerText = "Remedial Video Playlist Assigned";
        desc.innerText = "Your score indicates foundational gaps in " + selectedSubject + ". We have curated beginner video lectures below to rebuild your concepts from scratch before retrying.";
        trackCard.style.background = "#fef2f2";
      } else if (percentage <= 80) {
        recType = "standard";
        headline.innerText = "Good Conceptual Competency Validated!";
        badge.className = "badge bg-warning text-dark mb-2";
        badge.innerText = "Standard Track (50% - 80%)";
        title.innerText = "Advance to Higher Difficulty or Practice Problems";
        desc.innerText = "Solid understanding shown in " + selectedSubject + "! You can either retake this test at the next difficulty tier (Medium or Hard) or review the practical application videos below.";
        trackCard.style.background = "#fffbeb";
      } else {
        recType = "advanced";
        headline.innerText = "Outstanding Subject Mastery!";
        badge.className = "badge bg-success text-white mb-2";
        badge.innerText = "Advanced Acceleration (> 80%)";
        title.innerText = "Honors Acceleration Unlocked";
        desc.innerText = "Top-tier competency! The adaptive engine bypasses standard introductory topics and unlocks high-level systems design and competitive engineering lectures below.";
        trackCard.style.background = "#f0fdf4";
        confetti({ particleCount: 140, spread: 80, origin: { y: 0.6 } });
      }

      // Dynamic Subject-Specific Recommendations with YouTube Search Fallback
      var videoSet = (subjectVideoDirectory[selectedSubject] && subjectVideoDirectory[selectedSubject][recType])
        ? subjectVideoDirectory[selectedSubject][recType]
        : [
            {
              title: selectedSubject + " - " + (recType === 'remedial' ? "Foundational Basics" : (recType === 'standard' ? "Full Course & Practice" : "Advanced Architecture")),
              channel: "NPTEL / Gate Smashers",
              url: "https://www.youtube.com/results?search_query=" + encodeURIComponent(selectedSubject + " " + (recType === 'remedial' ? "fundamentals beginner" : (recType === 'standard' ? "engineering lecture" : "advanced concept"))),
              thumb: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&auto=format&fit=crop&q=80",
              desc: "Personalized lecture series matched specifically for " + selectedSubject + " (" + recType.toUpperCase() + " track)."
            },
            {
              title: selectedSubject + " - Problem Solving & Exam Walkthrough",
              channel: "FreeCodeCamp / MIT",
              url: "https://www.youtube.com/results?search_query=" + encodeURIComponent(selectedSubject + " solved problems gate"),
              thumb: "https://images.unsplash.com/photo-1509228468518-180dd4864904?w=600&auto=format&fit=crop&q=80",
              desc: "Step-by-step mathematical derivations and architectural solutions for " + selectedSubject + "."
            }
          ];

      ytGrid.innerHTML = '';
      for (var k = 0; k < videoSet.length; k++) {
        var v = videoSet[k];
        var col = document.createElement('div');
        col.className = 'col-md-6';
        col.innerHTML = '<a href="' + v.url + '" target="_blank" class="d-block text-decoration-none text-dark h-100 p-3 border border-2 border-dark rounded-3 bg-white" style="box-shadow: 4px 4px 0px #0f172a;">' +
            '<div class="mb-2" style="border-radius: 8px; overflow: hidden; aspect-ratio: 16/9; background: #000;">' +
              '<img src="' + v.thumb + '" style="width: 100%; height: 100%; object-fit: cover;">' +
            '</div>' +
            '<span class="badge bg-danger mb-1">' + v.channel + '</span>' +
            '<h6 class="fw-bold mt-1 mb-1 text-dark">' + v.title + '</h6>' +
            '<p class="small text-muted mb-0 fw-semibold">' + v.desc + '</p>' +
          '</a>';
        ytGrid.appendChild(col);
      }

      var breakdown = document.getElementById('result-breakdown-list');
      breakdown.innerHTML = '';
      for (var i = 0; i < currentQuestions.length; i++) {
        var qObj = currentQuestions[i];
        var userPick = userSelectedAnswers[i];
        var isRight = (userPick === qObj.a);
        var chosenText = (userPick === -1) ? "Timed Out" : qObj.o[userPick];

        var card = document.createElement('div');
        card.className = 'p-3 mb-2 rounded border border-2 border-dark text-start ' + (isRight ? 'bg-success-subtle' : 'bg-danger-subtle');
        
        var ansHtml = '<div class="small fw-bold text-dark mt-1">Your Answer: <strong>' + chosenText + '</strong></div>';
        if (!isRight) {
          ansHtml += '<div class="small fw-bold text-success mt-1">Correct Answer: <strong>' + qObj.o[qObj.a] + '</strong></div>';
        }

        card.innerHTML = '<div class="d-flex justify-content-between align-items-center mb-1">' +
            '<span class="fw-bold text-dark small">Q' + (i + 1) + '. ' + cleanQuestionText(qObj.q) + '</span>' +
            '<span class="badge ' + (isRight ? 'bg-success' : 'bg-danger') + '">' + (isRight ? '✓ Correct' : '✗ Mistake') + '</span>' +
          '</div>' + ansHtml;
        breakdown.appendChild(card);
      }

      window.scrollTo({ top: 150, behavior: 'smooth' });
    }

    // ================= AUTHENTICATION & SESSION PERSISTENCE =================
    function enterHubUI(fullName, role) {
      document.getElementById('landing-view').classList.add('d-none');
      document.getElementById('nav-about-link').classList.add('d-none');
      document.getElementById('nav-features-link').classList.add('d-none');
      document.getElementById('nav-auth-btn').classList.add('d-none');

      document.getElementById('academic-hub-view').classList.remove('d-none');
      document.getElementById('user-pill').classList.remove('d-none');
      document.getElementById('user-pill').classList.add('d-flex');
      document.getElementById('logout-btn').classList.remove('d-none');

      document.getElementById('user-display-name').innerText = fullName;
      document.getElementById('student-welcome-text').innerText = "Welcome, " + fullName;
      document.getElementById('student-sub-details').innerText = "Role: " + role + " • Registered Member";

      window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function executeAuth(e, type) {
      if (e) e.preventDefault();

      var payload = new URLSearchParams();
      payload.append("action", type);

      if (type === 'signup') {
        var fName = document.getElementById('reg-firstname').value.trim();
        var lName = document.getElementById('reg-lastname').value.trim();
        var email = document.getElementById('reg-email').value.trim();
        var pass = document.getElementById('reg-password').value;
        var role = document.getElementById('reg-role').value;

        payload.append("firstName", fName);
        payload.append("lastName", lName);
        payload.append("email", email);
        payload.append("password", pass);
        payload.append("role", role);
      } else {
        var email = document.getElementById('signin-email').value.trim();
        var pass = document.getElementById('signin-password').value;

        payload.append("email", email);
        payload.append("password", pass);
      }

      fetch("auth.jsp", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: payload.toString()
      })
      .then(function(res) { return res.json(); })
      .then(function(data) {
        if (!data.success) {
          alert(data.message || "Authentication failed.");
          return;
        }

        var modalEl = document.getElementById('authModal');
        var modalInstance = bootstrap.Modal.getInstance(modalEl);
        if (modalInstance) modalInstance.hide();
        else {
          var closeBtn = document.getElementById('modalCloseBtn');
          if (closeBtn) closeBtn.click();
        }

        var userAccount = {
          firstName: data.firstName,
          lastName: data.lastName,
          fullName: (data.fullName && data.fullName.trim()) ? data.fullName.trim() : data.email,
          email: data.email,
          role: data.role
        };

        localStorage.setItem('aptiva_saved_user', JSON.stringify(userAccount));
        localStorage.setItem('aptiva_active_session', JSON.stringify(userAccount));

        playScreenShimmer();
        setTimeout(function() {
          var backdrops = document.querySelectorAll('.modal-backdrop');
          for (var i = 0; i < backdrops.length; i++) backdrops[i].remove();
          document.body.classList.remove('modal-open');
          enterHubUI(userAccount.fullName, userAccount.role);
        }, 200);
      })
      .catch(function(err) {
        console.error("Auth server error:", err);
        alert("Could not reach auth.jsp backend. Please make sure Tomcat is running.");
      });
    }

    function logout() {
      stopQuestionTimer();
      playScreenShimmer();

      localStorage.removeItem('aptiva_active_session');

      document.getElementById('academic-hub-view').classList.add('d-none');
      document.getElementById('quiz-flow-view').classList.add('d-none');
      document.getElementById('landing-view').classList.remove('d-none');
      document.getElementById('nav-about-link').classList.remove('d-none');
      document.getElementById('nav-features-link').classList.remove('d-none');
      document.getElementById('nav-auth-btn').classList.remove('d-none');
      document.getElementById('user-pill').classList.add('d-none');
      document.getElementById('user-pill').classList.remove('d-flex');
      document.getElementById('logout-btn').classList.add('d-none');

      populateSavedCredentials();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function populateSavedCredentials() {
      var savedUserStr = localStorage.getItem('aptiva_saved_user');
      if (savedUserStr) {
        var savedUser = JSON.parse(savedUserStr);
        var signinEmail = document.getElementById('signin-email');
        var signinPass = document.getElementById('signin-password');
        if (signinEmail && savedUser.email) signinEmail.value = savedUser.email;
        if (signinPass && savedUser.password) signinPass.value = savedUser.password;
      }
    }

    window.addEventListener('DOMContentLoaded', function() {
      populateSavedCredentials();

      var activeSession = localStorage.getItem('aptiva_active_session');
      if (activeSession) {
        try {
          var user = JSON.parse(activeSession);
          if (user && user.fullName) {
            enterHubUI(user.fullName, user.role || "Student");
          }
        } catch (e) {}
      }
    });
  </script>
</body>
</html>