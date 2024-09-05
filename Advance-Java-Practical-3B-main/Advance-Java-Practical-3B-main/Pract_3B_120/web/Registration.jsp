<%-- 
    Document   : Registration
    Created on : 15 Jul, 2024, 8:04:13 AM
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
        String s1 = request.getParameter("name");
        String s2 = request.getParameter("pass");
        String s3 = request.getParameter("re-pass");
        String s4 = request.getParameter("email");
        String s5 = request.getParameter("country");
        
        if(s2.equals(s3))
        {
            //database connectivity
            try 
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst = conn.prepareStatement("insert into registration_120 values(?,?,?,?)");
                pst.setString(1,s1);
                pst.setString(2,s2);
                pst.setString(3,s4);
                pst.setString(4,s5);
                int rows = pst.executeUpdate();
                if(rows==1)
                {
                    out.println("Registration successful..!!");
                }
                else
                {
                    out.println("Registration failerd..!Try once again");
                    %>
                    <jsp:include page="Registration.html"></jsp:include>
                    <%
                }
            }
            catch(Exception e)
            {
                        
            }               
        } 
        else
        {
            out.println("Password mismatch...!,Register once again");
            %>
            <jsp:include page="Registration.html"></jsp:include>
            <%
        }
        %>
    </body>
</html>
