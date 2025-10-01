<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oep.pojo.Candidate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Dashboard - Rajesh Kumar Sharma</title>
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
                    <button class="btn btn-outline-primary">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </button>
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
                            <img src="<%= session.getAttribute("partyLogo") %>" 
                                 alt="Profile Picture" class="profile-img mb-3" id="partyLogo">
                            <h4 class="mb-2" id="username"><%=session.getAttribute("username") %></h4>
                            <p class="text-muted mb-3" ><%= session.getAttribute("constituency") %></p>
                            <div class="contact-info">
                                <p class="mb-1" ><i class="fas fa-phone me-2 text-primary"></i><span ><%=session.getAttribute("phone") %></span></p>
                                <p class="mb-1" ><i class="fas fa-envelope me-2 text-primary"></i><span "><%=session.getAttribute("email") %></span></p>
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
                                            <h6 class="mb-1" ><%=session.getAttribute("partyName") %></h6>
                                            
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
                                    <h3 class="mb-2" id="electionType">Lok Sabha General Election 2024</h3>
                                    <p class="mb-1"><strong>Phase:</strong> <span id="electionPhase">Phase 3</span></p>
                                    <p class="mb-0"><strong>Status:</strong> 
                                        <span class="status status--success" id="electionStatus">Campaign Active</span>
                                    </p>
                                </div>
                                <div class="col-md-4 text-md-end text-start">
                                    <div class="election-dates">
                                        <p class="mb-1"><strong>Voting Date:</strong> <span id="votingDate">May 25, 2024</span></p>
                                        <p class="mb-0"><strong>Result Date:</strong> <span id="resultDate">June 4, 2024</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Constituency Details & Campaign Progress -->
                <div class="col-lg-6 mb-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h5 class="mb-0"><i class="fas fa-map me-2"></i>Constituency Details</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <p class="mb-2"><strong>Name:</strong><br><span id="constituencyName">New Delhi</span></p>
                                    <p class="mb-2"><strong>Code:</strong><br><span id="constituencyCode">PC07</span></p>
                                </div>
                                <div class="col-6">
                                    <p class="mb-2"><strong>Area:</strong><br><span id="constituencyArea">22.75 sq km</span></p>
                                    <p class="mb-2"><strong>Polling Stations:</strong><br><span id="pollingStations">1,247</span></p>
                                </div>
                            </div>
                            <div class="mt-3 text-center">
                                <h6>Total Registered Voters</h6>
                                <h4 class="text-primary" id="totalVoters">14,56,789</h4>
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
                            <div class="mb-4">
                                <div class="d-flex justify-content-between mb-2">
                                    <span><strong>Rallies Completed</strong></span>
                                    <span><span id="ralliesCompleted">45</span>/<span id="totalRallies">57</span></span>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 79%" id="ralliesProgress"></div>
                                </div>
                            </div>
                            <div class="row text-center">
                                <div class="col-6">
                                    <h5 class="text-info mb-1" id="doorsKnocked">25,670</h5>
                                    <small class="text-muted">Doors Knocked</small>
                                </div>
                                <div class="col-6">
                                    <h5 class="text-warning mb-1" id="volunteerCount">2,340</h5>
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