<%-- 
    Document   : display
    Created on : Jul 21, 2024, 3:31:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmGo(m,u)
            {
                if(confirm(m))
                {
                    window.location = u;
                }
            }
        </script>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * FROM product_detail;
        </sql:query>
    <center>
            <form>
                <table border="2">
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.Pid}"/></td>
                        <td><c:out value="${row.Pname}"/></td>
                        <td><c:out value="${row.Quantity}"/></td>
                        <td><a href="update.jsp?Pid=<c:out value="${row.Pid}"/>">Update</a></td>
                        <td><a href="javascript:confirmGo('Sure to delete this record','deletedb.jsp?Pid=<c:out value="${row.Pid}"/>')">Delete</a></td>
                    </tr>                
                </c:forEach>
                </table>
            </form>
            <a href="index.html">Go Back</a>
    </center>
    </body>
</html>
