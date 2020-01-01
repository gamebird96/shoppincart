  <div>
      <%
          Cookie cookie=null;
          Cookie[] cookies=null;
          Cookie k=null;
          cookies=request.getCookies();
             
          for(int i=0; i<cookies.length;i++)
	        {
		        cookie=cookies[i];
              
             
                cookie.setMaxAge(0);
		response.addCookie(cookie); //After this, although cookie will be not be visible from browser
          }
		String redirectURL = "index.jsp";
        	response.sendRedirect(redirectURL);
              
                 
          


        %>