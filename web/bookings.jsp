<%--
  Created by IntelliJ IDEA.
  User: guptash
  Date: 7/27/2017
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: guptash
  Date: 7/20/2017
  Time: 11:27 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="obj" class="models.users.Admin"/>
<jsp:useBean id="obj1" class="models.Vehicle"/>
<jsp:useBean id="obj2" class="models.SparePart"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Display</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

        <link rel="stylesheet" href="css/style.css">


    </head>
</head>
<body>
<%
    String page1 = "";
    if(session.getAttribute("pvlg").equals(1)) {
        page1 = "/operator.jsp";
    } else if(session.getAttribute("pvlg").equals(2)) {
        page1 = "/admin.jsp";
    } else if(session.getAttribute("pvlg").equals(0)) {
        page1 = "/user.jsp";
    }

%>
<header>
    <nav class="navbar navbar-inverse">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="indexlogin.jsp" class="navbar-brand"><b>CDK-Dealer Management System</b></a>
        </div>
        <!-- Collection of nav links and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=page1%>"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                <li><a href="/display.jsp"><i class="fa fa-circle" aria-hidden="true"></i> Display</a></li>
                <li><a href="/bookings.jsp"><i class="fa fa-circle" aria-hidden="true"></i> Bookings</a></li>
                <li><a href="/Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
            </ul>
        </div>
    </nav>

</header>

<%
    if(session.getAttribute("username") == null && session.getAttribute("password")==null)
    {
%>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-body" style="background-color: lemonchiffon">
                <p contenteditable="true"><h2  style="font-family: 'Franklin Gothic Medium';"><center><b>Login to continue<br> <h3><a href="/indexlogin.jsp">Login </a></h3></b></center></h2><br></p>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<%} else  {


%>




<%
    String loginuser = (String)session.getAttribute("username");
    Connection con = ConnectionFactory.getConnection();
    PreparedStatement st1 = con.prepareStatement("select * from userservice where username = ? ");
    st1.setString(1, loginuser);
    ResultSet rs = st1.executeQuery(); %>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel" style="background-color: lemonchiffon">

            <h3 align="center"> <b>Service Bookings</b></h3><br><br>

            <table class="table table-bordered" style="mso-cellspacing: 10px; align-content: center; align-items: center">
                <tr>
                    <th>Service ID</th>
                    <th>Registration ID</th>
                    <th>Username</th>
                    <th>Vehicle Model No.</th>
                    <th>Type</th>
                    <th>Payment</th>
                    <th>Status</th>
                </tr>


                <% while(rs.next()) {
                %>

                <tr>
                    <td><%=rs.getInt(1)%></td>
                    <td><%=rs.getInt(2)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<%
        st1.close();
    con.close();
    } %>
</body>
</html>

