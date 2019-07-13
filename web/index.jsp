<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: SI2001
  Date: 06/05/2019
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.html"%>
<div class="container">
<br>
<div class="container">
        <form action="Home" method="post">
            <div class="row">
            <div class="col">
                <h5>Filter By:</h5>
        <select name="filter" class="form-control">
            <option value="firstname">First Name</option>
            <option value="lastname">Last Name</option>
            <option value="country">Country</option>
        </select>
    </div>


    <div class="col">
        <h5>Insert Text:</h5>

            <div class="input-group">
                <input class="form-control" type="search" placeholder="Search" name="search">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-info"><i class="fa fa-search"></i></button>
                </div>
            </div>

    </div>
</div>
        </form>

</div>
<br>
  <table class="table table-striped">
        <tr>
          <th>Firstname</th>
          <th>Lastname</th>
          <th>Country</th>
          <th>Birth Date</th>
            <th>Role</th>
            <th>Status</th>
            <th>Skills</th>
            <th>Action</th>
        </tr>
  <c:forEach items="${users}" var="item">

      <tr>
          <td><c:out value="${item.firstname}"/></td>
          <td><c:out value="${item.lastname}"/></td>
          <td><c:out value="${item.country}"/></td>
          <fmt:parseDate pattern="yyyy-MM-dd" value="${item.birth_date}" var="formatedDate"/>
          <td><fmt:formatDate value="${formatedDate}" pattern="dd/MM/yyyy" type="DATE"/> </td>
          <td><c:out value="${item.role.name}"/></td>
          <td><c:out value="${item.status.name}"/></td>
          <td>
              <c:forEach items="${item.skills}" varStatus="loopStatus" var="ski">

                  <c:out value="${ski.name}"/>
                  <c:if test="${!loopStatus.last}">,</c:if>
              </c:forEach>
          </td>


          <td>
              <form action="/ControllerUser.do" method="GET">
                  <input type="hidden" name="user_id" value="<c:out value="${item.id}"/>">
                  <button type="submit" class="btn btn-success">Edit User</button>
              </form>

                <p></p>
             <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal<c:out value="${item.id}"/>" >
                  Delete
              </button>
          </td>
      </tr>


  <div class="modal fade" id="exampleModal<c:out value="${item.id}"/>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <div class="modal-body">
                  Sei sicuro di voler cancellare <b><c:out value="${item.firstname} ${item.lastname}"/></b>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <form action="/DeleteUser.do" method="GET">
                  <button type="submit" class="btn btn-primary" name="user_id" value="<c:out value="${item.id}"/>">YES</button>
                  </form>
              </div>
          </div>
      </div>
  </div>


  </c:forEach>

  </table>

</div>
  </body>
</html>
