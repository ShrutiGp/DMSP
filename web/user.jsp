<%@ page import="database.ConnectionFactory" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: guptash
  Date: 7/19/2017
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User-DMS</title>
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
                <p contenteditable="true"><h2  style="font-family: 'Franklin Gothic Medium';"><center><b>Login to continue<br> <h3><a href="/indexlogin.jsp">Login </a></h3></b></center></h2><br></p>
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

<%} else  {
    String loginuser = (String)session.getAttribute("username");
    Connection con = ConnectionFactory.getConnection();
    Statement st = null;

    st =con.createStatement();
    ResultSet rs = st.executeQuery("select * from vehicles");
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
    <div class="col-md-8">


        <nav class="navbar navbar-default" id="operations">
            <div class="container-fluid">
                <div class="navbar-header">

                </div>
                <ul class="nav navbar-nav row" style="align-items: center; align-content: center">
                    <li class="active"> <div><h3><input type="button" class="hey3" value="Buy Car" onclick="buycar();"></h3></div></li>
                    <li><div><h3><input type="button" class="hey3" value="Servicing" onclick="servicecar();"></h3></div></li>

                </ul>
            </div>
        </nav>






    </div>
    <div class="col-md-2"></div>
</div>


<div class="row" id="main1" >

</div>

<div class = "row" id="buycar" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/UserOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Enter Details Of Vehicle : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b> Model No. : </b></h5></div>
                        <div class="col-md-6"><select name="vehicles">
                           <% while(rs.next()) { %>

                            <b> <option value=<%=rs.getString(2)%>><%=rs.getString(2)%> : <%= rs.getString(3)%> - <%=rs.getString(4)%></option></b>
                            <% }
                           %>
                        </select>

                        </div></div><br><br>
                        <br><br>

                        <div class="row">
                            <div clas="col-md-8"></div>
                        <div class="col-md-4"><input type="submit" value="BUY" name="confirmbuy"></div>


                    </div>
                </div>
            </div>
            </p>
        </form>

    <div class="col-md-2"></div>
</div>

</div>

<div class = "row" style="display: none" id="servicecar">
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/UserOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Enter Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b> Registration No. : </b></h5></div>
                        <div class="col-md-6">

                            <select name="vehicleregno">
                                <optgroup label="----------Registration No. of Vehicles Purchased By You--------------">
                                <%
                                    PreparedStatement ps = con.prepareStatement("select DISTINCT id, vmodel from userbuy where name = ?");
                                    ps.setString(1, loginuser);
                                    ResultSet rs1 = ps.executeQuery();
                                    while(rs1.next()) { %>

                                <option value=<%=rs1.getInt(1)%>><%=rs1.getInt(1)%></option>
                                <% }
                                    try {
                                        rs1.close();
                                        ps.close();

                                    } catch(Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                </optgroup><br><br>
                                <optgroup label="------------------------No Vehicle Purchased--------------------------">
                                <option value="0">0 </option>
                                </optgroup>
                            </select>

                        </div></div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b> Vehicle Model No. : </b></h5></div>
                        <div class="col-md-6">
                            <select name="vmod">
                                    <optgroup label="------------------Vehicles Purchased By You-----------------------">
                                        <%
                                            PreparedStatement ps1 = con.prepareStatement("select DISTINCT vmodel from userbuy where name = ?");
                                            ps1.setString(1, loginuser);
                                            ResultSet rss = ps1.executeQuery();
                                    while(rss.next()) { %>

                                <b> <option value=<%=rss.getString(1)%>><%=rss.getString(1)%></option></b>
                                <% }
                                try {
                                    rss.close();
                                    ps1.close();

                                    } catch(Exception e) {
                                        e.printStackTrace();
                                }
                                %></optgroup><br><br>
                            <optgroup label="---------------------Other Vehicles Serviced Here------------------">

                            <% ResultSet rs2 = st.executeQuery("select * from vehicles");
                                 while(rs2.next()) { %>

                                <b> <option value=<%=rs2.getString(2)%>><%=rs2.getString(2)%> : <%= rs2.getString(3)%> - <%=rs2.getString(4)%></option></b>
                                <% }
                                try {
                                    rs.close();
                                    rs2.close();
                                    st.close();
                                    con.close();
                                } catch(Exception e) {
                                     e.printStackTrace();
                                }
                                %>

                            </optgroup>
                            </select>
                    </div><br><br>

                    <br>

                    <h3>Servicing Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>TYPE : </b></h5></div>
                        <div class="col-md-6">
                            <label class="radio-inline"><input type="radio" name="optradio" value="First Service">First Service</label>
                            <label class="radio-inline"><input type="radio" name="optradio" value="Second Service">Second Service</label>
                            <label class="radio-inline"><input type="radio" name="optradio" value="Additional">Additional</label></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>PAY : </b></h5></div>
                        <div class="col-md-6">
                            <label class="radio-inline"><input type="radio" name="vdate" value="Free Service">Free Service</label>
                            <label class="radio-inline"><input type="radio" name="vdate" value="Paid Service">Paid Service</label>
                    </div><br><br>

                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="CONFIRM"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>



    <div class="col-md-2"></div>
</div>
<% } %>


<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="js/index3.js"></script>

</body>
</html>

