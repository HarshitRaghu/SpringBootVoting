<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oep.pojo.Election" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election list</title>
</head>
<body>
<h2>All Approved Candidates</h2>
    <%
     List<Election> election_list = (List<Election>)request.getAttribute("election_list");
    
    if(election_list.size()>0)
	{
		for(int i=0; i<election_list.size();i++)
		{
			Election e = election_list.get(i);
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=e.getElection_id()%></td>
				<td><%=e.getElection_name()%></td>
				<td><%=e.getDate() %></td>
			</tr>
			<%
		}
	}
    
    %>
        <a href="admin-dashboard">admin dashboard</a>
    
</body>
</html>