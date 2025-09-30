<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.oep.pojo.Candidate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>All Approved Candidates</h2>
    <%
     List<Candidate> candidate_list = (List<Candidate>)request.getAttribute("candidate_list");
    
    if(candidate_list.size()>0)
	{
		for(int i=0; i<candidate_list.size();i++)
		{
			Candidate c = candidate_list.get(i);
			%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=c.getId()%></td>
				<td><%=c.getEmail()%></td>
				<td><%=c.getBio() %></td>
			</tr>
			<%
		}
	}
    
    %>
    <p><a href="/admin/dashboard">Back to Dashboard</a></p>
</body>
</html>