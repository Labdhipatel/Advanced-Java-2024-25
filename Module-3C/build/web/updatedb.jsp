<%-- 
    Document   : updatedb
    Created on : Aug 5, 2024, 7:31:05 AM
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
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE product_detail SET Pname =?,Quantity =? WHERE Pid='${param.Pid}';
            <sql:param value="${param.Pname}"/>
            <sql:param value="${param.Quantity}"/>
        </sql:update>
            <c:if test="${count==1}">
                <font color="green" size="5">Congratulations ! Data updated successfully</font>
                <a href="index.html">Go Back</a>
            </c:if>
    </body>
</html>
