
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head> 
 
<body>
<%@page import="bean.LoginBean"%>
<%@page import="bean.Login_DAO"%>  
<jsp:useBean id="obj1" class="bean.LoginBean"/>
<jsp:setProperty property="*" name="obj1"/>  

<%
boolean status=Login_DAO.validate(obj1);

if(status){
	out.println(" Welcome--"+ obj1.getEmail()+ "--Successfully loggedin " );
	
	session.setAttribute("session","TRUE");
     request.getRequestDispatcher("q1.jsp").include(request,response);


  }
else{
	out.println(obj1.getEmail()+"Sorry......login unsuccessfully");
	
	}


%>


</body>
</html>