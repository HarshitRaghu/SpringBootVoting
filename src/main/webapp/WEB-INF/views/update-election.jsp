<%@page import="com.oep.pojo.Election"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Election</title>
    <link rel="stylesheet" href="css/updateElectionStyle.css">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <h1>Update Election</h1>
            <p class="header-subtitle">Modify election details and information</p>
        </header>

        <!-- Main Content -->
        <main class="main-content">
            <div class="form-container">
                <div class="card">
                    <div class="card__header">
                        <h2>Election Information
                 		<%
                 			String msg = (String)request.getAttribute("msg");
                        	if(msg != null) out.print(msg);
                        %></h2>
                    </div>
                    
                    <div class="card__body">
                        <form id="updateElectionForm" action="update" method="post" novalidate>
                            <!-- Election ID -->
                            <div class="form-group">
                                <label for="electionId" class="form-label">
                                    Election ID
                                </label>
                                <input 
                                    type="text" 
                                    class="form-control" 
                                    id="electionId" 
                                    name="election_id"
                                    value="ELC-2025-001"
                                    placeholder="Enter election ID"
                                >
                            </div>

                            <!-- Election Name -->
                            <div class="form-group">
                                <label for="electionName" class="form-label">
                                    Election Name
                                </label>
                                <input 
                                    type="text" 
                                    class="form-control" 
                                    id="electionName" 
                                    name="name"
                                    placeholder="Enter election name"
                                >
                                <div class="invalid-feedback">
                                    Please provide a valid election name.
                                </div>
                            </div>

                            <!-- Election Date -->
                            <div class="form-group">
                                <label for="electionDate" class="form-label">
                                    Election Date
                                </label>
                                <input 
                                    type="date" 
                                    class="form-control date-input" 
                                    id="electionDate" 
                                    name="date"
                                    placeholder="MM/DD/YYYY"
                                    pattern="^(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/\d{4}$"
                                >
                                <div class="invalid-feedback">
                                    Please enter a valid date in MM/DD/YYYY format.
                                </div>
                            </div>

                            <!-- Position -->
                            <div class="form-group">
                                <label for="position" class="form-label">
                                    Position
                                </label>
                                <input 
                                    type="text" 
                                    class="form-control" 
                                    id="position" 
                                    name="position"
                                    placeholder="Enter position name"
                                >
                                <div class="invalid-feedback">
                                    Please enter a position.
                                </div>
                            </div>

                            <!-- Update Button -->
                            <div class="button-group">
                                <button 
                                    type="submit" 
                                    class="btn btn--primary btn--full-width"
                                    id="updateButton"
                                >
                                    Update Election
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Election Management System. All rights reserved.</p>
        </footer>
    </div>

    <script src="js/updateElection.js"></script>
</body>
</html>