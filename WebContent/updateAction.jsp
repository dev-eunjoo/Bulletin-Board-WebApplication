<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDao" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %> 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">

<title>BULLETIN BOARD </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please log in first')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('This post is not valid')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");			
		}		
		
		Bbs bbs = new BbsDao().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('You are not authorized to edit the post')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");			
		} else{
			if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
				|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('Complete all required fields'')");
						script.println("history.back()");
						script.println("</script>");
					} else{
						BbsDao bbsDAO = new BbsDao();
						int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),  request.getParameter("bbsContent"));
						if(result == - 1){ 
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('You failed to edit the post')");
							script.println("history.back()");
							script.println("</script>");
						}
						else if(result == 1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}			
			}
	
		}

	%>
</body>
</html>