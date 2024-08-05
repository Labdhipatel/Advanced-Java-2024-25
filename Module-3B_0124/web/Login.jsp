<%-- 
    Document   : Login
    Created on : Jul 14, 2024, 4:30:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s1=request.getParameter("Name");
            String s2=request.getParameter("Password");
            try
            {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst = conn.prepareStatement("select * from Registration_124 where Username=?");
                pst.setString(1, s1);
                ResultSet rs = pst.executeQuery();
                if(rs.next())
                {
                    if(rs.getString(2).equals(s2))
                    {
                        out.print("Login Sucessfull...!");
                    }
                    else
                    {
                        out.print("Incorrect Password Login Failed...!..Try once again");
                        %>
                        <jsp:include page="Login.html"></jsp:include>
                        <%
                    }
                }
                else
                {
                    out.print("Username Does Not Exist. Please Register");
                    %>
                    <jsp:include page="Registration.html"></jsp:include>
                    <%
                }
            }
            catch(Exception e)
            {
                out.print("Exception = "+e);
            }
        %>
    </body>
</html>
