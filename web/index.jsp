<%--
  Created by IntelliJ IDEA.
  User: guptash
  Date: 7/19/2017
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.sun.org.apache.regexp.internal.RE" %>
<jsp:useBean id="obj" class="models.User"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LoginPage</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<%

    String user = request.getParameter("UserName");
    String pass = request.getParameter("Password");
    try {
        int privilege = obj.isValid(user, pass);

        session.setAttribute("username", user);
        session.setAttribute("password", pass);
        session.setAttribute("pvlg", privilege);
        if(privilege == 0){
            response.sendRedirect("http://localhost:8080/user.jsp");
        } else if(privilege == 1){
            response.sendRedirect("http://localhost:8080/operator.jsp");
        } else if(privilege == 2) {
            response.sendRedirect("/admin.jsp");
        } else {
             %>
            <h2 align="center">Invalid User! Please Login Again.</h2>
            <div class="row" align="center"><form action="indexlogin.jsp">
                <input type="submit" value="Login" style="width: 200px; height: 50px;">
            </form></div>
        <%
        }
    } catch(Exception e) {
        e.printStackTrace();
    }

%>

</body>
</html>
