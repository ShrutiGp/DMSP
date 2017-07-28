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
    <title>Dealer Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>

    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript">
        function validateop() {
            if (document.myopform.UserName.value.length <= 3) {
                alert("Minimum length is 3 characters!");
                document.myopform.UserName.focus();
                return false;
            }
            var nameRegex = /^[a-zA-Z\-]+$/;
            var validUsername = document.myopform.UserName.value.match(nameRegex);
            if (validUsername == null) {
                alert("Your first name is not valid. Only characters A-Z, a-z and '-' are  acceptable.");
                document.myopform.UserName.focus();
                return false;
            }

            if (document.myopform.Password.value.length < 5) {
                alert("Minimum length is 5 characters!");
                document.myopform.Password.focus();
                return false;
            }

            return true;
        }
        function validateop1() {
            if (document.myopform1.vname.value.length < 3) {
                alert("Vehicle name should be atleast 3 characters!");
                document.myopform1.vname.focus();
                return false;
            }
            if (document.myopform1.vmodel.value.length < 2) {
                alert("Vehicle model should be atleast 2 characters!");
                document.myopform1.vname.focus();
                return false;
            }
            return true;
        }
        function validateop2() {
            if (document.myopform2.sname.value.length < 3) {
                alert("Sparepart name should be atleast 3 characters!");
                document.myopform2.sname.focus();
                return false;
            }
            if (document.myopform2.smodel.value.length < 2) {
                alert("Sparepart model should be atleast 2 characters!");
                document.myopform2.sname.focus();
                return false;
            }
            return true;
        }
        function change() {
            var x = document.getElementById("23");
            x.value = x.value.toUpperCase();
            alert("value is  : " + x.value);

        }

    </script>


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
                <p contenteditable="true"><h2  style="font-family: 'Franklin Gothic Medium';"><center><b>Login to continue <h3><a href="/indexlogin.jsp">Login </a></h3></b></center></h2><br></p>
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
               <li class="active"> <div><h3><input type="button" class="hey" value="Add Operator" onclick="addoperator();"></h3></div></li>
                <li><div><h3><input type="button" class="hey" value="Remove Operator" onclick="removeoperator();"></h3></div></li>
                <li><h3><input type="button"  class="hey" value="Add Vehicle" onclick="addvehicle();"></h3></li>
                <li><h3><input type="button"  class="hey" value="Remove Vehicle" onclick="removevehicle();"></h3></li>
                <li><h3><input type="button"  class="hey" value="Add Sparepart" onclick="addsparepart();"></h3></li>
                <li><h3><input type="button"  class="hey" value="Remove Sparepart" onclick="removesparepart();"></h3></li>

            </ul>
        </div>
    </nav>






</div>
<div class="col-md-2"></div>
</div>


<div class="row" id="main" >

</div>

<!-- Addition of operator-->
<div class = "row" id="addoperator" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

    <form name="myopform" action="/AdminOperations.jsp" onsubmit="return(validateop());">
        <p>
        <div class="panel panel-default text-center">
            <div class="editform">
                <h3>Operator Details : </h3><br><br>
                <div class="row">
                    <div class="col-md-4">
                        <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Operator Username : </b></h5></div>
                    <div class="col-md-6"><input type="text" class="form-control" placeholder="Username" name="UserName" onblur="change()" id="23" required></div>
                </div><br><br>
                <div class="row">
                    <div class="col-md-4">
                        <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Password : </b></h5></div>
                    <div class="col-md-6"><input type="password" class="form-control" placeholder="Password" name="Password" required></div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-6"><input type="submit" value="ADD OPERATOR"></div>
                </div>
            </div>
        </div>
        </p>
    </form>
    </div>

    <div class="col-md-2"></div>
</div>

<!-- Removal of Operator-->
<div class = "row" style="display: none" id="removeoperator" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/AdminOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Operator Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Username : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Username " name="UserName1" required></div>
                    </div><br><br>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="REMOVE OPERATOR"></div>
                    </div>
                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>


<!-- Add vehicles-->
<div class = "row" style="display: none" id="addvehicle" >
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form name="myopform1" action="/AdminOperations.jsp" onsubmit="return(validateop1());">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Vehicle Deatils : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true" required></i> <b>Vehicle Name : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Vehile Name " name="vname" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Model : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model" name="vmodel" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b>Brand : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Brand" name="vbrand" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Price : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Price" name="vprice" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Units : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="vunits" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Tax : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Tax" name="vtax" required></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b>Profit : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Profit" name="vprofit" required></div>
                    </div><br><br>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="ADD VEHICLE"></div>
                    </div>

                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>


<!-- Remove Vehicles -->
<div class = "row" style="display: none" id="removevehicle" >
    <div class="col-md-2"></div>
     <div class="col-md-8">

        <form action="/AdminOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>Vehile Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true" required></i> <b>Vehicle Model : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model Number" name="model1" required></div>
                    </div><br><br>

                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="REMOVE VEHICLE" required></div>
                    </div>

                </div>
            </div>
            </p>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>

<div class = "row" id="addsparepart" style="display: none">
    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form name="myopform2" action="/AdminOperations.jsp" onsubmit="return(validateop2());">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>SparePart Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true" ></i> <b> SparePart Name : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Sparepart Name " name="sname"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b> Model : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model" name="smodel"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i><b> Brand : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Brand" name="sbrand"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Price : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Price" name="sprice"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Units : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Units" name="sunits"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Vehicle ID : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Sparepart's Vehicle ID" name="svid"></div>
                    </div><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> Tax : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Tax" name="stax"></div>
                    </div><br><br>

                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="ADD SPAREPART"></div>
                    </div>

                </div>
            </div>
            </p>
        </form>
    </div>

    <div class="col-md-2"></div>
</div>


<div class = "row" style="display: none" id="removesparepart" >

    <div class="col-md-2"></div>

    <div class="col-md-8">

        <form action="/AdminOperations.jsp">
            <p>
            <div class="panel panel-default text-center">
                <div class="editform">
                    <h3>SparePart Details : </h3><br><br>
                    <div class="row">
                        <div class="col-md-4">
                            <h5><i class="fa fa-hand-o-right" aria-hidden="true"></i> <b> SparePart Model No. : </b></h5></div>
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="Model No. " name="smodel2"></div>
                    </div><br><br>
                    <br><br>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-6"><input type="submit" value="REMOVE SPAREPART"></div>
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

<script src="js/index.js"></script>

</body>
</html>

