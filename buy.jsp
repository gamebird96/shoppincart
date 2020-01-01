
 
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
  background-color:#8B220B;
  background-position: right bottom, left top;
  background-repeat: no-repeat, repeat;
  padding: 0px;
}

</style>
</head>
<body>
<form class="form-inline" action="search_page.jsp" method="GET">
<div id="example1">
	<img src="img\front\MarC.jpg" class="img-rounded" width=15% height=15% >
      <div class="input-group-inline">
      <input id="Search" type="text" class="form-control" name="Search" placeholder="Search">  <input type="submit" class="btn btn-default btn-lg" value="Search"> 
      <span class="icon-input-btn"><span class="glyphicon glyphicon-search"></span> </span>
     </div>
</div>
</form>

  <div>
      <%
        String username="";
        String buy= "user_login.html";
          Cookie cookie=null;
          Cookie[] cookies=null;
          Cookie k=null;
          cookies=request.getCookies();


          String mailMsg="";
            String toMail="";

            try{
          for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
              String cName=cookie.getName();
              if(cName.equals("login"))
              {
                  username=cookie.getValue();
                out.print("<h2>Welcome:"+cookie.getValue()+"</h2>");
                buy="buy.jsp";
                break;
              }
                 
          }
            }
        catch(Exception e) {out.print(e);}

        %>
    </div>

<%
int resNo=3; //Stores Number of Column in a Row
int total=0;
double totald=0;
String product="";
String usernm="";
  String s=request.getParameter("ItmId");

     // variables
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
	PreparedStatement stat = null;
 
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
           

            //For each cookie print it
            
            cookies=request.getCookies();
             
            for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
                String cName=cookie.getName();
                if(cName.indexOf("itm")<0)
                    continue;
                int cVal=Integer.parseInt(cookie.getValue());
                
                    // Step 2.C: Executing SQL and 
                    // retrieve data into ResultSet
                    try{
                     
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM item where itemid like '%"+cName+"%'");
        
        
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
                            // String q="<h3>"+name+"<p>By: "+seller+"</p><p>Price:"+price+"</p></h3><img src=\"img\\"+type+"\\"+path+"\" height=\"50%\" width=\"25%\"></img> ";
                            
                            total+=cVal*Integer.parseInt(price);
                            //String q="<tr><td><img src=\"img\\"+type+"\\"+path+"\" height=\"20%\" width=\"20%\"></img></td>   <td><h3>"+name+" By: "+seller+"</td>   <td>"+cVal+"</td>    <td>"+cVal*Integer.parseInt(price)+"</td>   <td><a href=\\shoppingkart/addcart.jsp?ItmId=" + s + " class=\"btn btn-info\"> Add More </a></td></tr>";
                            
                            
                        product+=name+"("+cVal+"),";
                           
                            
                        }
                        
                    resultSet.close();
                    statement.close();

                    }
                    catch(Exception e){e.printStackTrace();}
            }

            try{
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM user_info where username like '%"+username+"%'");
                    
                    while(resultSet.next()) {
                    String usr=resultSet.getString("username");
                    String add=resultSet.getString("address");
                    String ph=resultSet.getString("phone");
                    
                 toMail=resultSet.getString("email");

                   usernm=usr;
                        String op="<h2>Billing Address:"+add+" <p>Phone:"+ph+"</h1>";
                    out.print(op);
                    }
		String tot=total+"";
		String query="insert into order_details(username,amount) values ('"+username+"','"+tot+"')";

                    mailMsg="Your order amounting to "+total+" has been accepted";
            stat = connection.prepareStatement(query);
 
            // Step 2.C: Executing SQL and 
            // retrieve data into ResultSet

		
		try{
           	 boolean c = stat.execute(); 
		}
		catch(Exception e)
		{
			out.print(e);
		}
                    resultSet.close();
                    statement.close();
			stat.close();
    
                }
            catch(Exception e){out.print(e);}
                
        }
        catch(SQLException sqlex){
            sqlex.printStackTrace();
        }
        finally {
            // Step 3: Closing database connection
            try {
                if(null != connection) {
                    // cleanup resources, once after processing
                    
 
                    // and then finally close connection
                    connection.close();
                }
            }
            catch (SQLException sqlex) {
                sqlex.printStackTrace();
            }


        }

        cookies=request.getCookies();
             
          for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
              
                String cn=cookie.getName();
                if(cn.equals("mailed"))
                {
                    
                    String v=cookie.getValue();
                   
                    if(v.equals("false"))
                    {
                        cookie.setMaxAge(0);
		                response.addCookie(cookie);
                        
                        Cookie kk=new Cookie("mailed","true");  //mailed
                        response.addCookie(kk);
                        
                        response.setHeader("Refresh", "1;url=SendEmail.jsp?from="+toMail+"&&message="+mailMsg);

                    }
                }
          }

%>
</table>
<h3> Your Items:<% out.print(product);  %></h3>
<h2> Amount to pay:<% out.print(total);  %></h2>
<h2> Amount to pay in Dollar:<% totald=(total*0.014); out.print(totald + "$");  %></h2>
<div id="paypal-button"></div>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>

paypal.Button.render({
// Configure environment
env: 'sandbox',
client: {
sandbox: 'demo_sandbox_client_id',
production: 'demo_production_client_id'
},
// Customize button (optional)
locale: 'en_US',
style: {
size: 'small',
color: 'gold',
shape: 'pill',
},
// Set up a payment
payment: function (data, actions) {
return actions.payment.create({
transactions: [{
amount: {

total: <%out.print("'"+totald+"'");%>,
currency: 'USD'
}
}]
});
},
// Execute the payment
onAuthorize: function (data, actions) {
return actions.payment.execute()
.then(function () {
// Show a confirmation message to the buyer
window.alert('Thank you for your purchase!');
});
}
}, '#paypal-button');
</script>
</body>


<p><p><p>
<a href=\shoppingkart/ class="btn btn-success"> Continue Shopping </a>
</form>

</html>





