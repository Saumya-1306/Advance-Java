/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mybean;

import static java.lang.System.out;
import javax.ejb.Stateful;
import java.sql.*;

@Stateful
public class RRBean {

    //default constructor
    public void RRBean(){}
    
    String msg = "";
    public String roombooking(String customername, String customermobile, String typeofroom) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            String query = "select * from roombook_120 where roomtype=? and statusroom='Not Booked'" ;
            
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1,typeofroom);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next())
            {
                String roomnumber = rs.getString(1);
                PreparedStatement pst1 = conn.prepareStatement("update roombook_120 set cust=?, mob=?, statusroom='Booked' where roomid=?");
                pst1.setString(1,customername);
                pst1.setString(2,customermobile);
                pst1.setString(3,roomnumber);
                pst1.executeUpdate();
                
                msg = "Room " + typeofroom + " Booked Charges = "+rs.getString(3);
            }
            else
            {
                msg = "Room" + typeofroom + "not available";
            }
            
        }
        catch(Exception e){
            out.println("Exception" +e);
        }
        return msg;
        
    }

    
}
