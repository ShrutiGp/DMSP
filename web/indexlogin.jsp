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
    <style type="text/css">
        body {
            background-image: url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqagW1-M0jlNqlyM9UuZEJYGWHM3Y9w7JEMJ3ZpI90y4t2wLVTXA");
            background-size: cover;
        }
        </style>

</head>

<body background="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqagW1-M0jlNqlyM9UuZEJYGWHM3Y9w7JEMJ3ZpI90y4t2wLVTXA">
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
            <a href="indexlogin.jsp" class="navbar-brand">CDK-Dealer Management System</a>
        </div>
        <!-- Collection of nav links and other content for toggling -->
        <div id="navbarCollapse" class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                <li><a href="/Logout.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
            </ul>
        </div>
    </nav>

</header>
<form  name="myForm1" action="/index.jsp">
<div class="login-form">
    <h1>Login</h1><br><br>
    <div class="form-group ">

        <input type="text" class="form-control" placeholder="Username " name="UserName" required>
        <i class="fa fa-user"></i>
    </div>
    <div class="form-group log-status">
        <input type="password" class="form-control" placeholder="Password" name="Password" required>
        <i class="fa fa-lock"></i>
    </div>
    <span class="alert">Invalid Credentials</span>

    <input type="submit" value="Submit">

</div>
</form>

</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="C:\Users\guptash\Downloads\DMSProject\web\js\index.js"></script>

</body>
<footer class></footer>
</html>
