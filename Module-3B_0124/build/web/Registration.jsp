<%-- 
    Document   : Registration
    Created on : Jul 14, 2024, 4:29:50 PM
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
            //jsp scriptlet
            String s1=request.getParameter("Uname");
            String s2=request.getParameter("Pass");
            String s3=request.getParameter("Re-pass");
            String s4=request.getParameter("Email");
            String s5=request.getParameter("Country");
            if(s2.equals(s3))
                    {
                        //database connectivity code
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                            PreparedStatement pst = conn.prepareStatement("Insert into Registration_124 values(?,?,?,?)");
                            pst.setString(1, s1);
                            pst.setString(2, s2);
                            pst.setString(3, s4);
                            pst.setString(4, s5);
                            int rows = pst.executeUpdate();
                            if(rows==1)
                            {
                                out.print("Registration Successful....!");
                            }
                            else
                            {
                                out.print("Registration Failed....!...Try once again");
                                %>
                                <jsp:include page="Registration.html"></jsp:include>
                                <%
                            }
                        }
                        catch(Exception e)
                                {
                                    out.print("Exception = "+e);
                                }
                    }
            else
            {
                out.print("Password mismatch...!, Register once again");
                %>
                <jsp:include page="Registration.html"></jsp:include>
                <%
            }
        %>
       
    </body>
</html>
