<%-- 
    Document   : insertdb
    Created on : 29 Jul, 2024, 7:54:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${empty param.pid or empty param.pname or empty param.quantity}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg" value="Please enter product details"/>
            </c:redirect>
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:update dataSource="${dbsource}" var="result"> 
            Insert into product_details120 VALUES(?,?,?)
            <sql:param value="${param.pid}"/>
             <sql:param value="${param.pname}"/>
              <sql:param value="${param.quantity}"/>
            </sql:update>
            <c:if test="${result>=1}">
                <font size="5" color="green">Data inserted</font>
                <c:redirect url="insert.jsp">
                    <c:param name="susMsg" value="Data inserted"/>
                </c:redirect>
            </c:if>
    </body>
</html>
