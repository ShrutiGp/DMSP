
<%@ page import="java.sql.SQLException" %>

<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="models.VehicleDisplay" %>
<%@ page import="models.VehicleDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
        <title>Logs</title>
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
                <li><a href="/admin.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                <li><a href="/display.jsp"><i class="fa fa-circle" aria-hidden="true"></i> Display</a></li>
                <li><a href="/logs.jsp?page=1"><i class="fa fa-history" aria-hidden="true"></i> Logs</a></li>
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

    String spageid=request.getParameter("page");
    int pageid=Integer.parseInt(spageid);
    int total=30;
    if(pageid==1){}
    else{
        pageid=pageid-1;
        pageid=pageid*total+1;
    }
    ArrayList<VehicleDisplay> list=  obj1.getRecords(pageid,total);

    Connection con = ConnectionFactory.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from logs"); %>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel" style="background-color: lemonchiffon">

            <h3 align="center"> <b>Vehicles</b></h3><br><br>

            <table class="table table-bordered" style="mso-cellspacing: 10px; align-content: center">
                <tr align-content="center">
                    <th>ID</th>
                    <th>Action Performed By</th>
                    <th>Action Time</th>
                    <th>Action Description</th>
                </tr>


                <% for(VehicleDisplay vd : list) {
                %>

                <tr>
                    <td><%=vd.getId()%></td>
                    <td><%=vd.getPerf()%></td>
                    <td><%=vd.getTime()%></td>
                    <td><%=vd.getDesc()%></td>
                </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </div>
    <div class="col-md-2">
        <a href="logs.jsp?page=1">1</a>
        <a href="logs.jsp?page=2">2</a>
        <a href="logs.jsp?page=3">3</a>
        <a href="logs.jsp?page=4">4</a>
        <a href="logs.jsp?page=5">5</a>
        <a href="logs.jsp?page=6">6</a>
        <a href="logs.jsp?page=7">7</a>

    </div>
</div>
<% } %>
</div>
</body>
</html>
