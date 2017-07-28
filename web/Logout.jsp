<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="database.ConnectionFactory" %><%--
  Created by IntelliJ IDEA.
  User: guptash
  Date: 7/20/2017
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dealer Management System</title>
</head>
<body>
<%
   String loginuser = (String)session.getAttribute("username");
   Connection con = ConnectionFactory.getConnection();
    PreparedStatement st = con.prepareStatement("insert into logs(username, time, description) values(?, ?, ?)");

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Calendar cal = Calendar.getInstance();
    String dd = dateFormat.format(cal.getTime());

    st.setString(1, loginuser);
    st.setString(2, dd);
    st.setString(3, "Logout");

    st.executeUpdate();

    session.invalidate();
    response.sendRedirect(request.getContextPath() + "/indexlogin.jsp");
%>

</body>
</html>
