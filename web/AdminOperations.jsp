<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="obj" class="models.users.Admin"/>
<jsp:useBean id="obj1" class="models.Vehicle"/>
<jsp:useBean id="obj2" class="models.SparePart"/>
<jsp:useBean id="obj3" class="models.users.Operator"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DMS</title>
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
                <li><a href="/admin.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                <li><a href="/Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                <li><a href="/display.jsp"><i class="fa fa-circle" aria-hidden="true"></i> Display</a></li>
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
    <div class="col-md-8 panel" style="border-color: black; height: 150px;">


        <!-- AMDMIN OPERTIONS -->

        <%



    String username = request.getParameter("UserName");
    String password = request.getParameter("Password");

        if(username!=null) {
        int result = obj.add_operator(username, password, loginuser);
        if (result == 1) {%>

        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i> <b><%=username%> added successfully! </b></i></h3></center>
        <%}else { %>

        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i><b> Failed to add operator <%=username%> ! </b></i></h3></center>
        <%}%>

       <% }
        String opremove = request.getParameter("UserName1");
        if(opremove!=null) {
            int result1 = obj.remove_operator(opremove, loginuser);
            if(result1 ==1) {%>
        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3> <%=opremove%> removed successfully! </h3></center>
            <%}
            else {%>
        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3> Failed to remove operator <%=username%> ! </h3></center>
            <%}
        }

        String vname = request.getParameter("vname");
        String mno = request.getParameter("vmodel");
        String bname = request.getParameter("vbrand");
        String price = request.getParameter("vprice");
        String units = request.getParameter("vunits");
        String tax = request.getParameter("vtax");
        String profit = request.getParameter("vprofit");

        if(vname!=null) {
            int result = obj.add_v(mno,vname,bname,Double.parseDouble(price),Integer.parseInt(units),Double.parseDouble(tax),Double.parseDouble(profit),loginuser);
            if(result ==1) {%>
       <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br> <h3> <%=vname%> added successfully! </h3></center>
            <%}
            else {%>
        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3> Failed to add vehicle <%=vname%> ! </h3></center>
            <%}

        }
        String modelno=request.getParameter("model1");
        if(modelno!=null){
            int result4 = obj.remove_v(modelno, loginuser);
            if(result4 ==1) {%>
        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3> <%=modelno%> removed successfully! </h3></center>
    <%}
    else {%>
        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3>Failed to remove vehicle <%=modelno%> !</h3></center>
    <%}
        }

        String svname = request.getParameter("sname");
        String smno = request.getParameter("smodel");
        String sbname = request.getParameter("sbrand");
        String sprice = request.getParameter("sprice");
        String sunits = request.getParameter("sunits");
        String stax = request.getParameter("stax");
        String vehicle_id = request.getParameter("svid");

        if(svname != null) {
            int result3 = obj.add_s(smno,svname,sbname,Double.parseDouble(sprice), Integer.parseInt(sunits),Integer.parseInt(vehicle_id),Double.parseDouble(stax), loginuser);
            if(result3 == 1) {%>
        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3> <%=svname%> sparepart is added successfully </h3></center>
    <%}
    else {%>
        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3> Failed to add sparepart <%=svname%> ! </h3></center>
    <%}

        }
        String smodelno = request.getParameter("smodel2");
        if(smodelno!=null){
            int result5 = obj.remove_s(smodelno, loginuser);
            if(result5 ==1) {%>
        <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3> <%=smodelno%> sparepart is removed successfully! </h3></center>
    <%}
    else {%>
        <center><i class="fa fa-exclamation-triangle" aria-hidden="true"></i><br><h3> Failed to remove sparepart <%=smodelno%> ! </h3></center>
    <%}

    }
%>

        <%
        }
            String page1 = "";
            if(session.getAttribute("pvlg").equals(1)) {
                page1 = "/operator.jsp";
            } else if(session.getAttribute("pvlg").equals(2)) {
                page1 = "/admin.jsp";
            }


        %>



        <center><a href="<%=page1%>"><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;">Go to Home</h3></a></center>
            <br><br>

    </div>
    <div class="col-md-2">
</div>
</div>
</body>
</html>
