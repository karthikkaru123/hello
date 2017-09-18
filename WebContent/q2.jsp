<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body style="background-color:red;">
 <%String q1=request.getParameter("q1"); 
 pageContext.setAttribute("q1",q1,PageContext.SESSION_SCOPE);  %>
 <centre>
<form action="q3.jsp">

2.where are you from ?<br>

<input type="checkbox" name="q2" value="tirupati">tirupati<br>
<input type="checkbox" name="q2" value="guntur">guntur<br>
<input type="checkbox" name="q2" value="nellore">nellore<br>
<input type="checkbox" name="q2" value="bangalore">bangalore<br>
<input type="submit" value="submit">
</form>
<form action="logout.jsp">

<input type="submit" name="logout" value="LOGOUT">
</form>
</centre>




  <div class="stage" data-stage></div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/three.js/84/three.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/cannon.js/0.6.2/cannon.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/46992/CannonDebugRenderer.js'></script>

    <script src="js/index.js"></script>
</body>
</html>