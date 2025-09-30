<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update-election</title>
</head>
<body>
<%
	String msg = (String)request.getAttribute("msg");
	if(msg != null) out.print(msg);
%>
<h2>Add New Election</h2>
    <form method="POST" action="update">
     	<p>
            <label for="election_id">Election ID:</label>
            <input type="number" id="id" name="election_id" required>
        </p>
        <p>
            <label for="name">Election Name:</label>
            <input type="text" id="name" name="name" required>
        </p>
        <p>
            <label for="date">End Date:</label>
            <input type="date" id="date" name="date" required>
        </p>
        <p>
            <label for="position">Position:</label>
            <input type="text" id="position" name="position" required>
        </p>
        <p>
            <input type="submit" value="Update Election">
        </p>
    </form>
    <a href="admin-dashboard">admin dashboard</a>
</body>
</html>