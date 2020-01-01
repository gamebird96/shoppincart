 
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
<font face="bookman" font-weight: bold; text-align:center; size="25" color=#FFFFFF>

<div>
      <%
          String buy= "user_login.html";
          Cookie cookie=null;
          Cookie[] cookies=null;
          Cookie k=null;
          cookies=request.getCookies();
            try{
          for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
              String cName=cookie.getName();
              if(cName.equals("login"))
              {
                out.print("<h2>Welcome:"+cookie.getValue()+"</h2>");
                buy="buy.jps";
                break;
              }
                 
          }
            }
        catch(Exception e) {out.print(e);}
        %>
    </div>

<%
int resNo=3; //Stores Number of Column in a Row
  String s=request.getParameter("ItmId");
  



     // variables
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
 
        // Step 1: Loading or 
        // registering Oracle JDBC driver class
        try {
 
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        }
        catch(ClassNotFoundException cnfex) {
 
            out.println("Problem in loading or "
                    + "registering MS Access JDBC driver");
            cnfex.printStackTrace();
        }
 
        // Step 2: Opening database connection
        try {
 
            //String msAccDB = "C:\\Users\\Emlon LOL\\Desktop\\ShoppingKart.accdb";
            String msAccDB = "C:\\Users\\Samrat utta\\Documents\\ShoppingKart.accdb";
            String dbURL = "jdbc:ucanaccess://"
                    + msAccDB; 
            

            // Step 2.A: Create and 
            // get connection using DriverManager class
            connection = DriverManager.getConnection(dbURL); 
            
            // Step 2.B: Creating JDBC Statement 
            statement = connection.createStatement();
 
            // Step 2.C: Executing SQL and 
            // retrieve data into ResultSet
            resultSet = statement.executeQuery("SELECT * FROM item where itemid like '%"+s+"%'");
 
 
            // processing returned data and printing into console
            int count=0;
            while(resultSet.next()) {
                count++;
                String itm=resultSet.getString("itemid");
                String name=resultSet.getString(1);
                String price=resultSet.getString(2);
                String seller=resultSet.getString(3);
                String desc=resultSet.getString(4);
                String path=resultSet.getString(8);
                String type=resultSet.getString(9);
            
                String q="<h1>"+name+"<p>By: "+seller+"</p><p>Price:"+price+"</p></h1><img src=\"img\\"+type+"\\"+path+"\" height=\"50%\" width=\"25%\"></img> ";
                out.print(q);

            }
                
        }
        catch(SQLException sqlex){
            sqlex.printStackTrace();
        }
        finally {
            // Step 3: Closing database connection
            try {
                if(null != connection) {
                    // cleanup resources, once after processing
                    resultSet.close();
                    statement.close();
 
                    // and then finally close connection
                    connection.close();
                }
            }
            catch (SQLException sqlex) {
                sqlex.printStackTrace();
            }
        }

%>

</body>




</form>
</div>
<div id="example2">
<a href=\shoppingkart\addcart.jsp?ItmId=<% out.println(s); %>+"\" class="btn btn-info"> Add to Cart </a>
<a href=\shoppingkart\ class="btn btn-info"> Back</a>
</div>
</div>
</font>
</html>
