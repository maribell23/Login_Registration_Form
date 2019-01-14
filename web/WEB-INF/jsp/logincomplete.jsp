<%-- 
    Document   : logincomplete
    Created on : 10 Νοε 2018, 6:35:52 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="${pageContext.request.contextPath}/css_js/success_login.css" rel="stylesheet">

        <title>Success Login</title>
    </head>
    <body>
        <h1>Welcome ${user.username}</h1>
        <canvas></canvas>
        <script src="${pageContext.request.contextPath}/css_js/successlog.js"></script>
    </body>
</html>
