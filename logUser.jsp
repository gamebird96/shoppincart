<%@page import ="java.sql.*"%> 
<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
    <link href="css/global.css" type="text/css" rel="stylesheet">

    <title>Admin Page</title>
</head>


<body  style="background-color:black">

<div class="container-fluid">
    <div class="jumbotron" >
        <div class="row">
            <div class="col-md-4 col-sm-4 com-xs-12" >
                <img src="img/logo.png"></img>
            </div>
            <div class="col-md-4 col-sm-4 com-xs-12" style="float:left;"></div>
            <div class="col-md-4 col-sm-4 com-xs-12">
                <h1><i> The MarC Store</i></h1> 
                    <p><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;-For The People of NexGen</i></p> 
            </div>
            
            </div>

        </div>
    </div>

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
            
            String dbURL = "jdbc:ucanaccess://" + msAccDB; 
            
            // Step 2.A: Create and 
            // get connection using DriverManager class
            connection = DriverManager.getConnection(dbURL); 

            // Step 2.B: Creating JDBC Statement 
            statement = connection.createStatement();
 
            // Step 2.C: Executing SQL and 
            // retrieve data into ResultSet

                String adm=request.getParameter("user");
                String pwd=request.getParameter("Password");
                
                
                resultSet = statement.executeQuery("SELECT * FROM user_info where username like '"+adm+"' and pass like '"+pwd+"' ");
 
        
 
            // processing returned data and printing into console
            if(resultSet.next())
            {
                String success="<h1> Welcome "+adm+"</h1><br>";
                
                Cookie k=new Cookie("login",adm);
                response.addCookie(k);

                 k=new Cookie("mailed","false");
                response.addCookie(k);


                out.print(success);
                response.sendRedirect("\\shoppingkart/");
            }
            else{
                String failure="<h1> Sorry Invalid Credentials!!!</h1><br>";
                out.print(failure);
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

</div>

</body>
</html> 
