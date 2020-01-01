
 
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
            resultSet = statement.executeQuery("SELECT * FROM item");
 
            out.println("ID\tName\t\t\tAge\tMatches");
            out.println("==\t================\t===\t=======");
 
            // processing returned data and printing into console
            while(resultSet.next()) {
                out.println(resultSet.getString(1));
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
    </html>
