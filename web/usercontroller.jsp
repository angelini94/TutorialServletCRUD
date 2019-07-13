<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SI2001
  Date: 14/05/2019
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import="Model.User"%>
<%@include file="header.html"%>

    <c:choose>
        <c:when test="${user.id == null}">
            <br>
            <div style="text-align: center"><h4><b>Create new user</b></h4></div>
            <br>
            <form method="POST" action="/ControllerUser.do">
                <div class="container">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="grass">First Name</label>
                            <input type="text" class="form-control" placeholder="firstname" name="firstname"/>
                    </div>
                </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="grass">Last Name</label>
                            <input type="text" class="form-control" placeholder="lastname" name="lastname"/>
                        </div>
                    </div>
                </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Country</label>
                                <input type="text" class="form-control" placeholder="country" name="country"/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Birth Date</label>
                                <input type="date" class="form-control" name="birth_date"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Role</label>
                                <select name="role" class="form-control">
                                    <c:forEach items="${role}" var="item">
                                        <option value="${item.id}">
                                            <c:out value="${item.name}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Status</label>
                                <select name="status" class="form-control">
                                    <c:forEach items="${status}" var="item">
                                        <option  value="${item.id}">
                                            <c:out value="${item.name}"/>
                                        </option>

                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Skills</label><br>
                                <c:forEach items="${skill}" var="item">
                                    <label class="checkbox-inline">
                                        <input name="skill" type="checkbox" value="${item.id}">
                                        <c:out value="${item.name}"/>
                                    </label>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success">Create User</button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <br>
            <div style="text-align: center"><h4><b>Edit user</b></h4></div>
            <br>
            <form action="/ControllerUser.do" method="POST">
                <div class="container">
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label class="grass">First Name</label>
                            <input type="text" class="form-control" name="firstname" value="<c:out value="${user.firstname}"/>" />
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label class="grass">Last Name</label>
                            <input type="text" class="form-control" name="lastname" value="<c:out value="${user.lastname}"/>" />
                        </div>
                    </div>
                </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Country</label>
                                <input type="text" class="form-control" name="country" value="<c:out value="${user.country}"/>"/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Birth Date</label>
                                <input type="date" class="form-control" name="birth_date" value="<c:out value="${user.birth_date}"/>"/>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Role: <c:out value="${user.role.name}"/> </label>
                                <select name="role" class="form-control">
                                    <c:forEach items="${role}" var="item">
                                        <option value="${item.id}">
                                            <c:out value="${item.name}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Status: <c:out value="${user.status.name}"/> </label>
                                <select name="status" class="form-control">
                                    <c:forEach items="${status}" var="item">
                                        <option  value="${item.id}">
                                            <c:out value="${item.name}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label class="grass">Skills</label><br>
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
                            </div>
                        </div>
                    </div>

                <input type="hidden" name="user_id" value="<c:out value="${user.id}"/>">
                    <button type="submit" class="btn btn-success">Edit User</button>
                </div>
                </div>
            </form>
        </c:otherwise>
    </c:choose>

</body>
</html>
