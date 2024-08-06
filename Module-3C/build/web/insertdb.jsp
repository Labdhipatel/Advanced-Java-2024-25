<%-- 
    Document   : insertdb
    Created on : Jul 21, 2024, 3:31:22 AM
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
        <c:if test="${empty param.Pid or empty param.Pname or empty param.Quantity}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg" value="Please Enter Product Details"/>
            </c:redirect>
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO product_detail VALUES (?,?,?);
            <sql:param value="${param.Pid}"/>
            <sql:param value="${param.Pname}"/>
            <sql:param value="${param.Quantity}"/>
        </sql:update>
            <c:if test="${result>=1}">
                <font size="5" color="green">Congratulations !! Data Inserted successfully.</font>
                <c:redirect url="insert.jsp">
                    <c:param name="susMsg" value="Congratulations !! Data Inserted successfully"/>
                </c:redirect>
            </c:if>
    </body>
</html>
