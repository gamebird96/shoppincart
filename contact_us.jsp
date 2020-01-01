<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
<style> 
#example1 {
  background-color:#000000;
  background-position: right bottom, left top;
  background-repeat: no-repeat, repeat;
  padding: 0px;
}
#example2 {
	background-image: url("gal2.jpg");
	/*background-color:#FFFFFF;*/
}

</style>
</head>
<body>
<font face="bookman" font-weight: bold; text-align:center; size="25" color=#030662>
<form class="form-inline" action="search_page.jsp" method="GET">
<div id="example1">
	  <div class="input-group-inline">
	<p><a href="index.jsp" style="color:white"><img src="img\front\logo.jpg" class="img-rounded-inline" width=15% height=15% <h1> Let all the superpowers be yours!!</h1></a>
    	</div></font>
	 <div class="input-group-inline">
      <input id="Search" type="text" class="form-control" size="100" name="Search" placeholder="Search">    <input type="submit" class="btn btn-default btn-lg" value="Search"> <span class="icon-input-btn"><span class="glyphicon glyphicon-search"></span> </span>
 
   	<div class="dropdown form-group" style="float:right;">
   	 <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Login & SignUp
   	 <span class="caret"></span></button>
   	 <ul class="dropdown-menu"x>
   	   <li><a href="admin_login.html">Admin Login</a></li>
   	   <li><a href="user_login.html">User Login</a></li>
        <li><a href="PROJECT_REGISTRATION_FORM.html">User SignUp</a></li>
        <li><a href="addcart.jsp?ItmId=null">My Cart</a></li>
           	 </ul>
 </div>
    </div>
</div>
</form>

<div id="example2">
  <div class="container">
    <form class="well form-horizontal" action="SendEmail.jsp" method="GET"  id="contact_form">
  <fieldset>
  <legend><center><h2><b>Email Us</b></h2></center></legend><br>
    <div class="form-group">
    <label class="col-md-4 control-label">Your Email</label>  
      <div class="col-md-4 inputGroupContainer">
        <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input  name="from_user" placeholder="abc@def.com" class="form-control"  type="text">
        </div>
      </div>
    </div>

    <div class="form-group">
    <label class="col-md-4 control-label">Subject</label>  
      <div class="col-md-4 inputGroupContainer">
        <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <input  name="subject" placeholder="subject" class="form-control"  type="text">
        </div>
      </div>
    </div>

    
<div class="form-group">
  <label class="col-md-4 control-label" >Mesage</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="message" placeholder="message" class="form-control"  type="textarea">
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="send" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspLOGIN<span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>


</div>
</fieldset>
</form>