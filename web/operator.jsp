<%--
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
    <title>Operator-DMS</title>
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
                <ul class="nav navbar-nav" style="align-items: center; align-content: center">
                    <div class="col-md-3"><li class="active"> <div><h3><input type="button" class="hey2" value="Add Vehicle Stock" onclick="addvehiclestock();"></h3></div></li></div>
                    <li><div><h3><input type="button" class="hey2" value="Sell Vehicle Stock" onclick="removevehiclestock();"></h3></div></li>
                    <li><h3><input type="button"  class="hey2" value="Add Sparepart Stock" onclick="addsparepartstock();"></h3></li>
                    <li><h3><input type="button"  class="hey2" value="Remove Sparepart Stock" onclick="removesparepartstock();"></h3></li>

                </ul>
            </div>
        </nav>






    </div>
    <div class="col-md-2"></div>
</div>


<div class="row" id="main1" >

</div>

<!-- Addition of operator-->
<div class = "row" id="addvehiclestock1" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/OperatorOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Vehicle Stock Addition Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>Model No. : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model Number" name="ovmodel" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Units to be added : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="ovunit" required></div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="ADD STOCK"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>

<!-- Removal of Operator-->
<div class = "row" style="display: none" id="removevehiclestock1">
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/OperatorOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Vehile Stock Deletion Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>Model No. : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model Number" name="ovmodel2" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Units to be removed : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="ovunit2" required></div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="UPDATE STOCK"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>

<div class = "row" style="display: none" id="addsparepartstock2" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/OperatorOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Sparepart Stock Addition Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>Model No. : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model Number" name="osmodel" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Units to be added : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="osunit" required></div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="ADD STOCK"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>

<!-- Removal of Operator-->
<div class = "row" style="display: none" id="removesparepartstock2">
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/OperatorOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>SparePart Stock Deletion Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>Model No. : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model Number" name="osmodel2" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Units to be removed : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="osunit2" required></div>
                    </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="UPDATE STOCK"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>
<% } %>


<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="js/index2.js"></script>

</body>
</html>

