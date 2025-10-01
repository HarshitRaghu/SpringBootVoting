<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="candidate/search">
        <p>
            <label for="candidate_id">Candidate ID:</label>
            <input type="text" id="candidate_id" name="candidate_id" required>
        </p>
        <p>
            <input type="submit" value="Search">
        </p>
    </form>
        <a href="admin-dashboard">admin dashboard</a>
    
</body>
</html>