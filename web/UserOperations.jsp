<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="obj" class="models.users.Admin"/>
<jsp:useBean id="obj1" class="models.Vehicle"/>
<jsp:useBean id="obj2" class="models.SparePart"/>
<jsp:useBean id="obj3" class="models.users.Operator"/>
<jsp:useBean id="obj4" class="guestuser.ManageUser"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Operations</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dealer Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <link rel="stylesheet" href="css/style.css">

</head>
<body>



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
                <li><a href="/operator.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
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
                <p contenteditable="true"><h2  style="font-family: 'Franklin Gothic Medium';"><center><b>Login to continue <a href="/indexlogin.jsp">Login </a></b></center></h2><br></p>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<%} else  {

    String loginuser = (String)session.getAttribute("username");
%>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-body" style="background-color: lemonchiffon">
                <p contenteditable="true"><h2  style="font-family: 'Franklin Gothic Medium';"><center><b>Welcome <%= session.getAttribute( "username" )%></b></center></h2><br></p>

            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8 panel" style="border-color: black; height: 200px;">


        <%


            String page1 = "";
            if(session.getAttribute("pvlg").equals(1)) {
                page1 = "/operator.jsp";
            } else if(session.getAttribute("pvlg").equals(2)) {
                page1 = "/admin.jsp";
            } else if(session.getAttribute("pvlg").equals(0)) {
                page1 = "/user.jsp";
            }
            String v1 = request.getParameter("vehicles");

            try {

                if(v1 != null) {
                    int result = obj3.remove_vstock(v1, 1, loginuser);
                    if (result == 1) {
                        int res = obj1.userBuyLog(v1,loginuser);
                        if(res == 1) {
                 %>
        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i> <b><%=v1%> is sold successfully !<br>Happy Booking </b></i></h3></center>
        <%}
        else { %>

        <center><i class="fa fa-exclamation-triangle"></i><br> <h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i><b> Transaction unsuccessful! <%=v1%> ! </b></i></h3></center>
        <%} }%>

        <% } } catch(Exception e) {}

            String mod = request.getParameter("vmod");
            String reg = request.getParameter("vehicleregno");
           try { int reg_no = Integer.parseInt(reg);
            String radio = request.getParameter("optradio");
            String dd = request.getParameter("vdate");


            session.setAttribute("Registration", reg_no);
            session.setAttribute("Modelno", mod);
            session.setAttribute("Type", radio);
            session.setAttribute("Pay", dd);
                if(mod !=null) {
                    int id = obj4.servicing(reg_no, mod, radio, dd, loginuser);

                    if(id == 1) {%>
        <center><i class="fa fa-check fa-lg"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> Service request successfull! </h3><br>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"><form action="http://localhost:8080/PdfServlet"><input type="submit" value="Generate PDF" name="buypdf"></form></div>
        </div></center>
        <%}
        else {%>
        <center><i class="fa fa-exclamation-triangle"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> Failed to apply for servicing! </h3></center>
        <%}
        } } catch(Exception e) {}

       %>
        <center><a href="<%=page1%>"><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;">Go to Home</h3></a></center>
        <br><br>
        <%


            }
        %>


    </div>
    <div class="col-md-2">
    </div>
</div>


</body>
</html>
