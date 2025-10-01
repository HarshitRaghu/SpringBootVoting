<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oep.pojo.Candidate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Dashboard - <%= session.getAttribute("username") %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/candidateDashStyle.css">
</head>
<body>

    <!-- Top Navigation -->
    <nav class="top-nav">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h5 class="mb-0">Welcome, <span id="username"><%=session.getAttribute("username") %></span></h5>
                </div>
                <div>
                    <a href="logout" class="btn btn-outline-primary">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-container">
        <div class="container py-4">
            <!-- Candidate Profile Section -->
            <div class="row mb-5">
                <div class="col-12 mb-4">
                    <h2 class="text-center text-primary">
                        <i class="fas fa-user-circle me-2"></i>Candidate Profile
                    </h2>
                    <hr class="mb-4">
                </div>
                
                <!-- Profile Card -->
                <div class="col-lg-4 mb-4">
                    <div class="card profile-card">
                        <div class="card-body text-center">
                            <img src="<%= session.getAttribute("profilePhoto") %>" 
                                 alt="Profile Picture" class="profile-img mb-3" id="profilePhoto">
                            <h4 class="mb-2" id="username"><%=session.getAttribute("username") %></h4>
                            <p class="text-muted mb-3"><%= session.getAttribute("constituency") %></p>
                            <div class="contact-info">
                                <p class="mb-1"><i class="fas fa-phone me-2 text-primary"></i><span><%=session.getAttribute("phone") %></span></p>
                                <p class="mb-1"><i class="fas fa-envelope me-2 text-primary"></i><span><%=session.getAttribute("email") %></span></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Address & Party Info -->
                <div class="col-lg-8">
                    <div class="row">
                        <!-- Address Card -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <h5 class="mb-0"><i class="fas fa-map-marker-alt me-2"></i>Address</h5>
                                </div>
                                <div class="card-body">
                                    <p class="mb-0" id="address"><%= session.getAttribute("address") %></p>
                                </div>
                            </div>
                        </div>

                        <!-- Party Info Card -->
                        <div class="col-md-6 mb-3">
                            <div class="card h-100">
                                <div class="card-header">
                                    <h5 class="mb-0"><i class="fas fa-flag me-2"></i>Political Party</h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <img src="<%= session.getAttribute("partyLogo") %>" 
                                             alt="Party Logo" class="party-logo me-3" >
                                        <div>
                                            <h6 class="mb-1"><%=session.getAttribute("partyName") %></h6>
                                            <small class="text-muted"><%=session.getAttribute("constituency") %></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Active Election Section -->
            <div class="row">
                <div class="col-12 mb-4">
                    <h2 class="text-center text-success">
                        <i class="fas fa-calendar-check me-2"></i>Active Election Details
                    </h2>
                    <hr class="mb-4">
                </div>

                <!-- Election Header -->
                <div class="col-12 mb-4">
                    <div class="card election-header">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-md-8">
                                    <h3 class="mb-2" id="electionType"><%= session.getAttribute("electionType") != null ? session.getAttribute("electionType") : "No Active Election" %></h3>
                                    <p class="mb-1"><strong>Phase:</strong> <span id="electionPhase"><%= session.getAttribute("electionPhase") != null ? session.getAttribute("electionPhase") : "-" %></span></p>
                                    <p class="mb-0"><strong>Status:</strong> 
                                        <span class="status status--success" id="electionStatus"><%= session.getAttribute("electionStatus") != null ? session.getAttribute("electionStatus") : "Inactive" %></span>
                                    </p>
                                </div>
                                <div class="col-md-4 text-md-end text-start">
                                    <div class="election-dates">
                                        <p class="mb-1"><strong>Voting Date:</strong> <span id="votingDate"><%= session.getAttribute("votingDate") != null ? session.getAttribute("votingDate") : "-" %></span></p>
                                        <p class="mb-0"><strong>Result Date:</strong> <span id="resultDate"><%= session.getAttribute("resultDate") != null ? session.getAttribute("resultDate") : "-" %></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Constituency Details -->
                <div class="col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="fas fa-map me-2"></i>Constituency Details</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Name:</strong> <%= session.getAttribute("constituency") %></p>
                            <p><strong>Code:</strong> <%= session.getAttribute("constituencyCode") != null ? session.getAttribute("constituencyCode") : "N/A" %></p>
                            <p><strong>Polling Stations:</strong> <%= session.getAttribute("pollingStations") != null ? session.getAttribute("pollingStations") : "N/A" %></p>
                            <div class="mt-3 text-center">
                                <h6>Total Registered Voters</h6>
                                <h4 class="text-primary" id="totalVoters"><%= session.getAttribute("totalVoters") != null ? session.getAttribute("totalVoters") : "N/A" %></h4>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Campaign Progress -->
                <div class="col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="fas fa-chart-line me-2"></i>Campaign Progress</h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Rallies Completed:</strong> <%= session.getAttribute("ralliesCompleted") != null ? session.getAttribute("ralliesCompleted") : "0" %> /
                                <%= session.getAttribute("totalRallies") != null ? session.getAttribute("totalRallies") : "0" %></p>
                            <div class="progress mb-3">
                                <div class="progress-bar bg-success" role="progressbar" style="width: <%= session.getAttribute("ralliesProgress") != null ? session.getAttribute("ralliesProgress") : "0" %>%"></div>
                            </div>
                            <div class="row text-center">
                                <div class="col-6">
                                    <h5 class="text-info mb-1"><%= session.getAttribute("doorsKnocked") != null ? session.getAttribute("doorsKnocked") : "0" %></h5>
                                    <small class="text-muted">Doors Knocked</small>
                                </div>
                                <div class="col-6">
                                    <h5 class="text-warning mb-1"><%= session.getAttribute("volunteerCount") != null ? session.getAttribute("volunteerCount") : "0" %></h5>
                                    <small class="text-muted">Active Volunteers</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/candidateDash.js"></script>
</body>
</html>
