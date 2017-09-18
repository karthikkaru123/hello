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
<centre>
<form action="q2.jsp"><centre>
1.What is your name ?<br>
<input type="checkbox" name="q1" value="karthik">karthik<br>
<input type="checkbox" name="q1" value="uday">uday<br>
<input type="checkbox" name="q1" value="pavan">pavan<br>
<input type="checkbox" name="q1" value="chetan">chetan<br>
<input type="submit" value="submit"></centre>
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