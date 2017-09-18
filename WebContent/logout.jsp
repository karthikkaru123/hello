<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%request.getSession().invalidate(); %>
<h2>LOGGED OUT SUCCESSFULLY</h2>
<a href="index.html"/>MAIN PAGE








  <div class="stage" data-stage></div>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/three.js/84/three.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/cannon.js/0.6.2/cannon.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/46992/CannonDebugRenderer.js'></script>

    <script src="js/index.js"></script>
</body>
</html>