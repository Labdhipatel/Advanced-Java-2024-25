<%-- 
    Document   : update
    Created on : Aug 5, 2024, 7:30:46 AM
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
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * FROM product_detail where Pid=?;
            <sql:param value="${param.Pid}"/>
        </sql:query>
            <form action="updatedb.jsp">
                <table border="2">
                    <caption>Update Product</caption>
                    <tr>
                        
                        <th>Product Name</th>
                        <th>Quantity</th>
                    </tr>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td><input type="hidden" value="${param.Pid}" name="Pid"/>
                            <input type="text" value="${row.Pname}" name="Pname"/></td>
                            <td><input type="text" value="${row.Quantity}" name="Quantity"/></td>
                            <td><input type="submit" value="Update"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <a href="index.html">Go Back</a>
            </form>
    </body>
</html>
