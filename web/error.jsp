<%--
  Created by IntelliJ IDEA.
  User: SI2001
  Date: 07/05/2019
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="Model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>1st Web App - New User Created</title>
</head>
<body>
<h1>ERROREEE</h1>

<p>
    <% Exception e = (Exception)request.getAttribute("Exception");
    out.print(e.getMessage());  %>
</p>
</body>
</html>
