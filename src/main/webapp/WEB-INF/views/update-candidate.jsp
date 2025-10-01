<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>Update Candidate</h2>
    <!-- Display error message if update fails -->
    <form method="POST" action="candidate/update">
        <p>
            <label for="user_id">Candidate ID:</label>
            <input type="text" id="user_id" name="user_id" required>
        </p>
        <p>
            <label for="party">Party Affiliation:</label>
            <input type="text" id="party" name="party">
        </p>
        <p>
            <label for="bio">Bio:</label>
            <textarea id="bio" name="bio" rows="4" cols="50"></textarea>
        </p>
        <p>
            <input type="submit" value="Update Candidate">
        </p>
    </form>
        <a href="admin-dashboard">admin dashboard</a>
    
</body>
</html>