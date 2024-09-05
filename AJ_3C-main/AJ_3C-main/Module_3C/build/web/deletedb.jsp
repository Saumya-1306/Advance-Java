<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM product_details120 WHERE pid='${param.pid}';
            
        </sql:update>
        
        <c:if test="${count>=1}">
            <font size="5" color="green"> Data deleted successfully! </font><br>
            <a href="index.html">Go Home</a>
        </c:if>
    </body>
</html>