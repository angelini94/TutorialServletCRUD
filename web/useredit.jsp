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
    <title>1st Web App - Edit User</title>
</head>
<body>
<h1>Edit User</h1>


<form action="/EditUser.do" method="POST">

First name: <input type="text" size="40" maxlength="40" name="firstname" value="<c:out value="${user.firstname}"/>"/><br>
Last name:  <input type="text" size="40" maxlength="40" name="lastname"  value="<c:out value="${user.lastname}"/>"/><br>
Country:    <input type="text" size="40" maxlength="40" name="country"   value="<c:out value="${user.country}"/>"/><br>
Birth date:   <input type="date" name="birth_date"  value="<c:out value="${user.birth_date}"/>"/><br>

Role: <c:out value="${user.role.name}"/>
    <select name="role" class="form-control">
        <c:forEach items="${role}" var="item">
            <option value="${item.id}">
                <c:out value="${item.name}"/>
            </option>
        </c:forEach>
    </select>
    <br>
    Status:  <c:out value="${user.status.name}"/>
    <select name="status" class="form-control">
        <c:forEach items="${status}" var="item">
            <option  value="${item.id}">
                <c:out value="${item.name}"/>
            </option>
        </c:forEach>
    </select>
    <br>
    Skills:
    <c:forEach items="${skill}" var="s1">
        <c:set var="find" value="false" scope="page"/>
            <c:forEach items="${user.skills}" var="s2">
                <c:if test="${s1.id == s2.id}">
                    <c:set var="find" value="true" scope="page"/>
                </c:if>
            </c:forEach>
        <label class="checkbox-inline">
        <c:choose>
        <c:when test="${find == true}">
            <input name="skill" type="checkbox" value="${s1.id}" checked>
                    <c:out value="${s1.name}"/>
        </c:when>
        <c:otherwise>
            <input name="skill" type="checkbox" value="${s1.id}">
            <c:out value="${s1.name}"/>

        </c:otherwise>

        </c:choose>
        </label>
     </c:forEach>


    <%--
        <c:forEach items="${skill}" varStatus="loopStatus" var="item">
            <c:out value="${item.name}"/>
            <c:if test="${!loopStatus.last}">,</c:if>
        </c:forEach>
        --%>

    <input type="hidden" name="user_id" value="<c:out value="${user.id}"/>">
    <br>
    <input type="submit" value="Edit User" />

</form>
<%--
    <% out.print(u.getFirstname()); %>
    <% out.print(u.getLastname()); %>
    <% out.print(u.getCountry()); %>
    <% out.print(u.getBirth_date()); %>
--%>
</body>
</html>
