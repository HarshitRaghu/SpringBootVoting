<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nomination Page</title>
</head>
<body>
    <h1>Nominate a Candidate</h1>
    <form id="electionForm">
        <label for="electionSelect">Select Election:</label>
        <select id="electionSelect" name="electionSelect">
            <!-- Populate election options dynamically -->
            <option value="1">Presidential Election</option>
            <option value="2">Senate Election</option>
            <!-- ... more elections -->
        </select>
    </form>

    <div id="candidatesList">
        <!-- Candidates will be displayed here dynamically -->
        <!-- Example structure:
        <div class="candidate">
            <span>Candidate Name</span>
            <button onclick="nominateCandidate(candidateId)">Nominate</button>
        </div>
        -->
    </div>
</body>
</html>