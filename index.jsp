<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style> 
#example1 {
  background-color:#000000;
  background-position: right bottom, left top;
  background-repeat: no-repeat, repeat;
  padding: 0px;
}
#example2 {
	/*background-image: url("gal3.jpg");*/
	background-color:#FFFFFF;
}

.parallax { 
  /* The image used */
  background-image: url("gal2.jpg");

  /* Set a specific height */
  height: 500px; 

  /* Create the parallax scrolling effect */
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
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

  <div>
      <%
          Cookie cookie=null;
          Cookie[] cookies=null;
          Cookie k=null;
          cookies=request.getCookies();
             
          for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
              String cName=cookie.getName();
              if(cName.equals("login"))
              {
                out.print("<h2>Welcome:"+cookie.getValue()+"</h2>");
                out.print("<a href=\\shoppingkart/logout.jsp class=\"btn btn-success\" > Logout </a> ");
		break;
              }
                 
          }
        %>
    </div>


<font face="bookman" font-weight: bold; text-align:center; size="25" color=#030662>
<div class="parallax"></div>
<div id="example2">
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comics</h1>
<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
       <a href="product.jsp?ItmId=itm_book_01"><img class="center-block" src="img\Book\dc1.jpg" alt="im1"style="width:20%;"></a>
      </div>

      <div class="item">
        <a href="product.jsp?ItmId=itm_book_08"><img class="center-block" src="img\Book\dc4.jpg" alt="im2" style="width:20%;"></a>
      </div>
    
      <div class="item">
      <a href="product.jsp?ItmId=itm_book_04">  <img class="center-block" src="img\Book\m1.jpg" alt="im3" style="width:20%;"></a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<div class="parallax"></div>

<div id="example2">
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TShirt</h1>
<div class="container">
  <div id="myCarousel2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
       <li data-target="#myCarousel2" data-slide-to="3"></li>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
       <a href="product.jsp?ItmId=itm_tshirt_01"> <img class="center-block" src="img\Tshirt\dd1.jpg" alt="dc1" style="width:25%;"></a>
      </div>

      <div class="item">
        <a href="product.jsp?ItmId=itm_tshirt_03"><img class="center-block" src="img\Tshirt\dd3.jpg" alt="dc2" style="width:25%;"></a>
      </div>
    
      <div class="item">
       <a href="product.jsp?ItmId=itm_tshirt_06"> <img class="center-block" src="img\Tshirt\md1.jpg" alt="mar1" style="width:25%;"></a>
      </div>

      <div class="item">
       <a href="product.jsp?ItmId=itm_tshirt_07"> <img class="center-block" src="img\Tshirt\md2.jpg" alt="mar2" style="width:25%;"></a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<div class="parallax"></div>

<div id="example2">
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Toys</h1>
<div class="container">
  <div id="myCarousel3" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel3" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel3" data-slide-to="1"></li>
      <li data-target="#myCarousel3" data-slide-to="2"></li>
       <li data-target="#myCarousel3" data-slide-to="3"></li>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
       <a href="product.jsp?ItmId=itm_toy_04"> <img class="center-block" src="img\Toy\dc1.jpeg" alt="t1" style="width:25%;"></a>
      </div>

      <div class="item">
        <a href="product.jsp?ItmId=itm_toy_05"><img class="center-block" src="img\Toy\dc2.jpeg" alt="t2" style="width:25%;"></a>
      </div>
    
      <div class="item">
        <a href="product.jsp?ItmId=itm_toy_01"><img class="center-block" src="img\Toy\m1.jpeg" alt="t3" style="width:25%;"></a>
      </div>

      <div class="item">
       <a href="product.jsp?ItmId=itm_toy_02"> <img class="center-block" src="img\Toy\m2.jpeg" alt="t4" style="width:25%;"></a>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel3" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel3" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

</div>
</font>
</div>
</div>