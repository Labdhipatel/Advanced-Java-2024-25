/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean;

import static java.lang.System.out;
import javax.ejb.Stateful;
import java.sql.*;


/**
 *
 * @author Admin
 */
@Stateful
public class RRBean {
    String msg=" ";
    public String roombooking(String s1,String s2,String s3)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            String query="select * from roombook_0124 where roomtype=? and statusroom='Not Booked'";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1,s3);
            ResultSet rs = pst.executeQuery();
            if (rs.next())
            {
                String roomnumber = rs.getString(1);
                PreparedStatement pst1 = conn.prepareStatement("Update roombook_0124 set cust=?, mob=?, statusroom='Booked' where roomid=?");
                pst1.setString(1,s1);
                pst1.setString(2,s2);
                pst1.setString(3,roomnumber);
                pst1.executeUpdate();
                msg="Room"+s3+"Booked and charges = "+rs.getString(3);
            }
            else
            {
                msg="Room"+s3+"not available";
            }
            return msg;
        }
        
        catch(Exception e)
                {
                    out.print("Exception = "+e);
                }
        return msg;
    }
    

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
