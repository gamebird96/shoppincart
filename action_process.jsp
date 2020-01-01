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
String itm=request.getParameter("Item_Id");
String nm=request.getParameter("name");
int price=Integer.parseInt(request.getParameter("Price"));
String seller=request.getParameter("Seller");
String desc=request.getParameter("Description");
String type=request.getParameter("Type");
String img=request.getParameter("img");
String keyword=request.getParameter("keyword");




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
 
            String msAccDB = "C:\\Users\\Emlon LOL\\Desktop\\ShoppingKart.accdb";
		//String msAccDB = "C:\\Users\\Samrat utta\\Documents\\ShoppingKart.accdb";
            String dbURL = "jdbc:ucanaccess://"
                    + msAccDB; 
            

            // Step 2.A: Create and 
            // get connection using DriverManager class
            connection = DriverManager.getConnection(dbURL); 
            
            // Step 2.B: Creating JDBC Statement 
		String query="insert into item(itemid,name,price,seller,desc,keyword,totalrate,totalrater,pic,type,visitor)"
+" values ('"+itm+"','"+nm+"',"+price+",'"+seller+"','"+desc+"','"+keyword+"',0,0,'"+img+"','"+type+"',0)";
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




%>

</body>
</html>