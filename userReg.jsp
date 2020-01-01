<%@ page import="java.sql.*" %>

<html>
<head>
<title>
My Form Page
</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<% 
String firstname=request.getParameter("first_name");
String lastname=request.getParameter("last_name");
String username=request.getParameter("user_name");
String userpass=request.getParameter("user_password");
String confpass=request.getParameter("confirm_password");
String email=request.getParameter("email");
String phone=request.getParameter("contact_no");
String address=request.getParameter("address");

if(userpass.equals(confpass))  //Both password match

{



//DATABASE CONNECTIVITY

        // variables
        Connection connection = null;
        PreparedStatement statement = null;
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
		String query="insert into user_info(pass,username,address,phone,firstname,lastname,email)"
+" values ('"+userpass+"','"+username+"','"+address+"','"+phone+"','"+firstname+"','"+lastname+"','"+email+"')";
            statement = connection.prepareStatement(query);
 
            // Step 2.C: Executing SQL and 
            // retrieve data into ResultSet

		
try{
            boolean c = statement.execute(); //Update("insert into admin (admin,pass) values (\'adminn\',\'passs\')");
}
catch(Exception e)
{
	out.print(e);
}

		
//out.print("Rows Inserted"+c);
		
 
            
            
        }
        catch(Exception sqlex){
            sqlex.printStackTrace();
        }
        finally {
            // Step 3: Closing database connection
            try {
                if(null != connection) {
                    // cleanup resources, once after processing
                    //resultSet.close();
                    statement.close();
 
                    // and then finally close connection
                    connection.close();
                }
            }
            catch (SQLException sqlex) {
                sqlex.printStackTrace();
            }
        }


  



//DATABASE CONN END


out.println("Registration successful. Redirecting shortly");
response.setHeader("Refresh", "2;url=index.jsp");

}

else
{
        out.println("password do not match. Redirecting shortly");
        response.setHeader("Refresh", "2;url=PROJECT_REGISTRATION_FORM.html");
}


%>

</body>
</html>