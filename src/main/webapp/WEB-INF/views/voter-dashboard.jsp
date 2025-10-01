<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oep.pojo.Voter" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voter Dashboard - Election Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/voterDashStyle.css">
</head>
<body>
<%
	Voter voter = (Voter)request.getAttribute("voter");
%>
    <!-- Header -->
    <header class="voter-header">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center py-3">
                <div class="header-info">
                    <h1 class="mb-0"><i class="fas fa-vote-yea me-2"></i>Election Portal</h1>
                    <p class="mb-0 text-secondary"></p>
                </div>
                <div class="header-actions">
                    <button class="btn btn--outline">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </button>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-container">
        <div class="container">
            <!-- Voter Information -->
            <div class="voter-info-section mb-4">
                <div class="card">
                    <div class="card__body">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h2 class="mb-2" id="username"><%=session.getAttribute("username")%></h2>
                                <div class="voter-details">
                                    <p class="mb-1"><i class="fas fa-id-card me-2"></i><strong>Voter ID:</strong> <span id="Id"><%=session.getAttribute("userId") %></span></p>
                                    <p class="mb-1"><i class="fas fa-map-marker-alt me-2"></i><strong>Date of birth:</strong> <span id="dob"><%=session.getAttribute("dob")%></span></p>
                                    <p class="mb-1"><i class="fas fa-map-marker-alt me-2"></i><strong>Address:</strong> <span id="address"><%=session.getAttribute("address")%></span></p>
                                    <p class="mb-0"><i class="fas fa-phone me-2"></i><strong>Phone:</strong> <span id="phone"><%=session.getAttribute("phone") %></span></p>
                                    <p class="mb-0"><i class="fas fa-phone me-2"></i><strong>Email:</strong> <span id="email"><%=session.getAttribute("email")%></span></p>
                                </div>
                            </div>
                            <div class="col-md-4 text-center">
                                <div class="voter-status">
                                    <span class="status status--success">
                                        <i class="fas fa-check-circle me-1"></i>Eligible to Vote
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Election Selection -->
            <div class="election-selection-section mb-4">
                <div class="card">
                    <div class="card__header">
                        <h3 class="mb-0"><i class="fas fa-ballot-check me-2"></i>Select Active Election</h3>
                    </div>
                    <div class="card__body">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="electionSelect" class="form-label">Choose an election to view candidates:</label>
                                <select id="electionSelect" class="form-control">
                                    <option value="">-- Select an Election --</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <div id="electionDetails" class="election-details" style="display: none;">
                                    <h5 id="selectedElectionTitle"></h5>
                                    <p class="mb-1"><strong>Constituency:</strong> <span id="selectedConstituency"></span></p>
                                    
                                    <p class="mb-0"><strong>Voting Date:</strong> <span id="selectedVotingDate"></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Candidates Display -->
            <div class="candidates-section" id="candidatesSection" style="display: none;">
                <div class="card">
                    <div class="card__header">
                        <h3 class="mb-0"><i class="fas fa-users me-2"></i>Candidates</h3>
                    </div>
                    <div class="card__body">
                        <div id="candidatesList" class="row">
                            <!-- Candidates will be populated by JavaScript -->
                        </div>
                    </div>
                </div>
            </div>

            <!-- Instructions -->
            <div class="instructions-section mt-4">
                <div class="card">
                    <div class="card__body">
                        <h4 class="mb-3"><i class="fas fa-info-circle me-2"></i>Voting Instructions</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="instruction-list">
                                    <li>Select an active election from the dropdown above</li>
                                    <li>Review all candidates carefully before making your choice</li>
                                    <li>You can only vote once per election</li>
                                    <li>Voting is anonymous and secure</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="instruction-list">
                                    <li>Ensure you have proper identification</li>
                                    <li>Vote according to your conscience</li>
                                    <li>Report any irregularities to election officials</li>
                                    <li>Your vote matters - exercise your democratic right</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
    <script src="js/voterDash.js"></script>
</body>
</html>