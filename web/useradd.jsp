<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1>Create new user</h1>
<form method="POST" action="/CreateUser.do">
    First name: <input type="text" size="40" maxlength="40" name="firstname"/><br>
    Last name:  <input type="text" size="40" maxlength="40" name="lastname" /><br>
    Country:    <input type="text" size="40" maxlength="40" name="country"  /><br>
    Birth date:   <input type="date" name="birth_date"  /><br>
    Role: <select name="role" class="form-control">
        <c:forEach items="${role}" var="item">
            <option value="${item.id}">
                <c:out value="${item.name}"/>
            </option>

        </c:forEach>
    </select>
    <br>
    Status: <select name="status" class="form-control">
    <c:forEach items="${status}" var="item">
        <option  value="${item.id}">
            <c:out value="${item.name}"/>
        </option>

    </c:forEach>
</select>
<br>
    Skills:
    <c:forEach items="${skill}" var="item">
    <label class="checkbox-inline">
        <input name="skill" type="checkbox" value="${item.id}">
            <c:out value="${item.name}"/>
    </label>
    </c:forEach>


    <br>
    <br>
    <input type="SUBMIT" value="create">
</form>
<%--
<% User u = (User)request.getAttribute("user"); %>
First Name: <% out.print(u.getFirstname()); %> <br/>
Last Name:  <% out.print(u.getLastname()); %> <br/>
Country:    <% out.print(u.getCountry()); %> <br/>
Birth date: <% out.print(u.getBirth_date()); %>
<p>

</p>
--%>
</body>
</html>
