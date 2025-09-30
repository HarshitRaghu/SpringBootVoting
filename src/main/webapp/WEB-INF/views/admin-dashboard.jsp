
<%@ page import="java.util.List" %>
<%@ page import="com.oep.pojo.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting Portal Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/adminDashStyle.css">
</head>
<body>
    <!-- Header Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">
                <i class="bi bi-vote-fill me-2"></i>VotePortal Admin
            </a>
            <div class="navbar-nav ms-auto">
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-person-circle me-2"></i>Admin User
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Layout -->
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="#" data-section="dashboard">
                                <i class="bi bi-house-door me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-section="candidates">
                                <i class="bi bi-people me-2"></i>Candidates
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-section="voters">
                                <i class="bi bi-person-check me-2"></i>Voters
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-section="elections">
                                <i class="bi bi-calendar-event me-2"></i>Elections
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-section="results">
                                <i class="bi bi-bar-chart me-2"></i>Results
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
                <!-- Dashboard Section -->
                <div id="dashboard-section" class="content-section">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Dashboard</h1>
                    </div>
                    
                    <div class="row mb-4">
                        <div class="col-md-3 mb-3">
                            <div class="card bg-primary text-white stats-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title stats-label">Total Candidates</h5>
                                            <h2 class="mb-0 stats-number">15</h2>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="bi bi-people fs-1"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card bg-success text-white stats-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title stats-label">Total Voters</h5>
                                            <h2 class="mb-0 stats-number">2,847</h2>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="bi bi-person-check fs-1"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card bg-warning text-white stats-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title stats-label">Active Elections</h5>
                                            <h2 class="mb-0 stats-number">3</h2>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="bi bi-calendar-event fs-1"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="card bg-info text-white stats-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title stats-label">Completed Elections</h5>
                                            <h2 class="mb-0 stats-number">12</h2>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="bi bi-check-circle fs-1"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Recent Activity</h5>
                                </div>
                                <div class="card-body">
                                    <div class="activity-item mb-3">
                                        <i class="bi bi-person-plus text-success me-2"></i>
                                        <span>New voter "Alice Wilson" registered</span>
                                        <small class="text-muted ms-auto">2 hours ago</small>
                                    </div>
                                    <div class="activity-item mb-3">
                                        <i class="bi bi-calendar-plus text-primary me-2"></i>
                                        <span>New election "Student Council Election" created</span>
                                        <small class="text-muted ms-auto">5 hours ago</small>
                                    </div>
                                    <div class="activity-item mb-3">
                                        <i class="bi bi-check-circle text-info me-2"></i>
                                        <span>Election "Presidential Election 2024" status updated</span>
                                        <small class="text-muted ms-auto">1 day ago</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Quick Actions</h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-outline-primary btn-sm" onclick="window.location.href='reg'">
                                            <i class="bi bi-person-plus me-2"></i>Add Candidate / Voter
                                        </button>
                                        <!--  
                                        <button class="btn btn-outline-success btn-sm">
                                            <i class="bi bi-person-check me-2"></i>Add Voter
                                        </button>
                                        -->
                                        <button class="btn btn-outline-warning btn-sm" onclick="window.location.href='election/add-election'">
                                            <i class="bi bi-calendar-plus me-2"></i>Create Election
                                        </button>
                                        <button class="btn btn-outline-info btn-sm">
                                            <i class="bi bi-bar-chart me-2"></i>View Results
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Candidates Section -->
                <div id="candidates-section" class="content-section" style="display: none;">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Candidates Management</h1>
                        <button class="btn btn-primary">
                            <i class="bi bi-person-plus me-2"></i>Add New Candidate
                        </button>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h5 class="card-title mb-0">All Candidates</h5>
                                </div>
                                <div class="col-auto">
                                    <input type="search" class="form-control form-control-sm" placeholder="Search candidates...">
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Party</th>
                                            <th>Email</th>
                                            <th>Bio</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                   		<%
											List<Candidate> candidate_list = (List<Candidate>)request.getAttribute("candidate_list");
											if(candidate_list.size()>0){
												for(Candidate candidate: candidate_list){
													%>
													<tr>
														<td><%=candidate.getCandidate_id() %></td>
														<td><%=candidate.getName() %></td>
														<td><%=candidate.getParty() %></td>
														<td><%=candidate.getEmail() %></td>
														<td><%=candidate.getBio() %></td>	
														<td>
			                                                <button class="btn btn-sm btn-outline-primary me-1">
			                                                    <i class="bi bi-pencil"></i>
			                                                </button>
			                                                <button class="btn btn-sm btn-outline-danger">
			                                                    <i class="bi bi-trash"></i>
			                                                </button>
			                                            </td>
			                                        </tr>
													<%
												}
											}
											
										%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <nav>
                                <ul class="pagination pagination-sm mb-0 justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Voters Section -->
                <div id="voters-section" class="content-section" style="display: none;">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Voters Management</h1>
                        <button class="btn btn-success">
                            <i class="bi bi-person-check me-2"></i>Add New Voter
                        </button>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h5 class="card-title mb-0">All Voters</h5>
                                </div>
                                <div class="col-auto">
                                    <input type="search" class="form-control form-control-sm" placeholder="Search voters...">
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Date of birth</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
											List<Voter> voter_list = (List<Voter>)request.getAttribute("voter_list");
											if(voter_list.size()>0){
												for(Voter voter: voter_list){
													if(!voter.getRole().toString().equalsIgnoreCase("admin")){
													%>
													<tr>
														<td><%=voter.getId() %></td>
														<td><%=voter.getName() %></td>
														<td><%=voter.getEmail() %></td>
														<td><%=voter.getDob() %></td>	
														<td>
				                                                <button class="btn btn-sm btn-outline-primary me-1">
				                                                    <i class="bi bi-pencil"></i>
				                                                </button>
				                                                <button class="btn btn-sm btn-outline-danger">
				                                                    <i class="bi bi-trash"></i>
				                                                </button>
														</td>
													</tr>
													<%
													}
												}
											}
											
										%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <nav>
                                <ul class="pagination pagination-sm mb-0 justify-content-end">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Elections Section -->
                <div id="elections-section" class="content-section" style="display: none;">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Elections Management</h1>
                        <button class="btn btn-warning">
                            <i class="bi bi-calendar-plus me-2"></i>Create New Election
                        </button>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">All Elections</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <%
											List<Election> election_list = (List<Election>)request.getAttribute("election_list");
											if(election_list.size()>0){
												for(Election election: election_list){
													%>
													<tr>
														<td><%=election.getElection_id() %></td>
														<td><%=election.getElection_name()%></td>
														<td><%=election.getDate()%></td>
														<td><%=election.getPosition() %></td>
			                                            <td>	
			                                            	<!-- i want to send the election id to the update-election page,just after the recored is updated generate a popup with message record deleted-->
			                                                <button class="btn btn-sm btn-outline-primary me-1" name="election_id" value="<%=election.getElection_id()%>" onclick="window.location.href='election/update-election'">
			                                                	<i class="bi bi-pencil"></i>
				                                            </button>
				                                            <!--  after i click the below button the record will be deleted you don't need to add the fuctionality, just after the recored is deleted generate a popup with message record deleted -->
			                                                <button class="btn btn-sm btn-outline-danger" name="election_id" value="<%=election.getElection_id()%>">
			                                                    <i class="bi bi-trash"></i>
			                                                </button>
			                                            </td>
			                                        </tr>
													<%
												}
											}
											
										%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Results Section -->
                <div id="results-section" class="content-section" style="display: none;">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Election Results</h1>
                    </div>
                    
                    <div class="row mb-4">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Select Election</h5>
                                </div>
                                <div class="card-body">
                                    <select class="form-select mb-3">
                                        <option selected>Choose election...</option>
                                        <option value="1">Presidential Election 2024</option>
                                        <option value="2">Student Council Election</option>
                                    </select>
                                    <button class="btn btn-primary">
                                        <i class="bi bi-search me-2"></i>Load Results
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Results Status</h5>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex gap-3">
                                        <button class="btn btn-success">
                                            <i class="bi bi-check-circle me-2"></i>Publish Results
                                        </button>
                                        <button class="btn btn-outline-primary">
                                            <i class="bi bi-download me-2"></i>Export Results
                                        </button>
                                        <span class="badge bg-warning fs-6 align-self-center">Draft</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Presidential Election 2024 - Results</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Candidate Name</th>
                                            <th>Party</th>
                                            <th>Votes</th>
                                            <th>Percentage</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="table-success">
                                            <td><strong>John Smith</strong></td>
                                            <td>Democratic Party</td>
                                            <td>1,250</td>
                                            <td>45.5%</td>
                                            <td><span class="badge bg-success">Winner</span></td>
                                        </tr>
                                        <tr>
                                            <td>Sarah Johnson</td>
                                            <td>Republican Party</td>
                                            <td>1,100</td>
                                            <td>40.0%</td>
                                            <td><span class="badge bg-info">Runner-up</span></td>
                                        </tr>
                                        <tr>
                                            <td>Michael Brown</td>
                                            <td>Independent</td>
                                            <td>400</td>
                                            <td>14.5%</td>
                                            <td><span class="badge bg-secondary">Candidate</span></td>
                                        </tr>
                                    </tbody>
                                    <tfoot class="table-light">
                                        <tr>
                                            <th colspan="2">Total Votes</th>
                                            <th>2,750</th>
                                            <th>100%</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Candidate Modal (non-functional) -->
    <div class="modal fade" id="candidateModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Candidate</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Party Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="tel" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Photo</label>
                            <input type="file" class="form-control" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Save Candidate</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Voter Modal (non-functional) -->
    <div class="modal fade" id="voterModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Voter</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="tel" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea class="form-control" rows="2" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">ID Proof</label>
                            <input type="file" class="form-control" accept=".pdf,.jpg,.jpeg,.png" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success">Save Voter</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Election Modal (non-functional) -->
    <div class="modal fade" id="electionModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create New Election</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Election Title</label>
                            <input type="text" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Start Date</label>
                                    <input type="datetime-local" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">End Date</label>
                                    <input type="datetime-local" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Select Candidates</label>
                            <div class="border rounded p-3" style="max-height: 200px; overflow-y: auto;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="1">
                                    <label class="form-check-label">John Smith (Democratic Party)</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="2">
                                    <label class="form-check-label">Sarah Johnson (Republican Party)</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="3">
                                    <label class="form-check-label">Michael Brown (Independent)</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-warning">Create Election</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/adminDash.js"></script>
</body>
</html>