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
    <div class="col-md-8 panel" style="border-color: black; height: 200px;">


        <%


                String page1 = "";
                if(session.getAttribute("pvlg").equals(1)) {
                    page1 = "/operator.jsp";
                } else if(session.getAttribute("pvlg").equals(2)) {
                    page1 = "/admin.jsp";
                }
                String vmodel = request.getParameter("ovmodel");
                String vunit = request.getParameter("ovunit");
                try { int units1 = Integer.parseInt(vunit);
                if(vmodel != null) {
                    int result = obj3.add_vstock(vmodel, units1, loginuser);
                    if (result == 1) {%>

            <center><i class="fa fa-check fa-lg" aria-hidden="true"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i> <b><%=vmodel%> is updated successfully ! </b></i></h3></center>
                    <%}
                 else { %>

                <center><i class="fa fa-exclamation-triangle"></i><br> <h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i><b> Failed to update vehicle stock <%=vmodel%> ! </b></i></h3></center>
                    <%}%>

        <% } } catch(Exception e) {}

            String new1 = request.getParameter("ovmodel2");
            String new2 = request.getParameter("ovunit2");
            try {
                int units2 = Integer.parseInt(new2);


            if(new1 !=null) {
                int result1 = obj3.remove_vstock(new1, units2, loginuser);

                if(result1 ==1) {%>
        <center><i class="fa fa-check fa-lg"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> <%=new1%> is updated successfully! </h3></center>
        <%}
        else {%>
        <center><i class="fa fa-exclamation-triangle"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> Failed to update vehicle stock <%=new1%> ! </h3></center>
        <%}
        } } catch(Exception e) {}

            String smodel = request.getParameter("osmodel");
            String sunit = request.getParameter("osunit");
            try {
                int units11 = Integer.parseInt(sunit);

            if(smodel!=null) {
                int result = obj3.add_sstock(smodel, units11, loginuser);
                if (result == 1) {%>

        <center><i class="fa fa-check fa-lg"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i> <b><%=smodel%> is updated successfully! </b></i></h3></center>
        <%}else { %>

        <center><i class="fa fa-exclamation-triangle"></i><br> <h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"><i><b> Failed to update sparepart stock <%=smodel%> ! </b></i></h3></center>
        <%}%>

        <% } } catch(Exception e) {}
            String smodel2 = request.getParameter("osmodel2");
            String sunit2 = request.getParameter("osunit2");
            try {
            int units22 = Integer.parseInt(sunit2);
            if(smodel2 !=null) {
                int result1 = obj3.remove_sstock(smodel2, units22, loginuser);
                if(result1 ==1) {%>
        <center><i class="fa fa-check fa-lg"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> <%=smodel2%> is updated successfully! </h3></center>
        <%}
        else {%>
        <center><i class="fa fa-exclamation-triangle"></i><br><h3 align="center" style="font-family: 'Franklin Gothic Medium Cond'; padding-bottom: 30px;"> Failed to update sparepart stock <%=smodel2%> ! </h3></center>
        <%} } } catch(Exception e) {}%>
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
