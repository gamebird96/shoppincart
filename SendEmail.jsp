
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.mail.Message,javax.activation.*,javax.mail.Session"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.mail.internet.InternetAddress,javax.mail.Transport"%>
<%
	String result;
	//Recipient's email ID needs to be mentioned.
	
	String to = "duttasamrat614@gmail.com";
	
	// Sender's email ID needs to be mentioned
	String from = "duttasamrat614@gmail.com";
	final String username = "duttasamrat614";
	final String password = "Sam#1234";



   String msg;
   String from_user;
   String sub;

   String frm=request.getParameter("from");
   msg=request.getParameter("message");


   if(frm==null)   // Custormer is sending message
   {
	  
	
   from_user=request.getParameter("from_user");
   sub=request.getParameter("subject");
   
	msg="From: "+from_user+"\n"+" "+msg;
}
	else   // if company sending email to customer
	{
		to=frm;
		sub="Order Accepted";

	}

   
				



	// Assuming you are sending email through relay.jangosmtp.net
	Properties props=null;
try{
	props = System.getProperties();
	props.put("mail.smtp.host", "smpt.gmail.com");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	
	props.put("mail.smtp.port", "25");
	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.fallback", "false");

}

catch(Exception e){out.print(e);}

    //Get the Session object.
	 Session mailSession=null;

    try{
	 mailSession = Session.getInstance(props,null);
	  
    }

    catch(Exception e){out.print(e);}

	try {
		// Create a default MimeMessage object.
		Message message = new MimeMessage(mailSession);

		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));

		// Set To: header field of the header.
		message.setRecipient(Message.RecipientType.TO,
				new InternetAddress(to));

		// Set Subject: header field
		message.setSubject(sub);

		// Now set the actual message
		message.setContent(msg , "text/html");


		// Send message
		Transport transport = mailSession.getTransport("smtp");
		
		
		transport.connect("smtp.gmail.com",username,password);
		
		
		transport.sendMessage(message,message.getAllRecipients());



		System.out.println("Sent message successfully....");
		result = "Sent message successfully....";

	} catch (MessagingException e) {
		out.print(e);
		result = "Error: unable to send message....";

	}
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
	<center>
		<h1>Confirmation Mail Sent</h1>
	</center>
	<p align="center">
		<%
			out.println("Result: " + result + "\n");
			response.setHeader("Refresh", "5;url=buy.jsp");
		%>
	</p>
</body>
</html>