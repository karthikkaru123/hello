<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><body style="background-color:red;">
<centre>
<%int marks=0;int ques=0;

String q1=(String)pageContext.getAttribute("q1",PageContext.SESSION_SCOPE);  
String q2=request.getParameter("q2");

 if(q1.equals("karthik"))
{
	marks++;
	ques++;
}else{ques++;}
if(q2.equals("tirupati"))
{
	marks++;ques++;
} else{ques++;}
out.println(" total marks="+ques+"___"+ "obtained marks="+marks);
%>
<form action="logout.jsp">

<input type="submit" name="logout" value="LOGOUT">
</form>
</centre>
</body>
</html>