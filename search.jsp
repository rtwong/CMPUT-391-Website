<%@ page import="java.sql.*, java.util.*" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
    <head>
	<!-- http://jqueryui.com/datepicker/ -->
        <title>Search</title>
	 <meta charset="utf-8">
	<title>jQuery UI Datepicker - Default functionality</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/	jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script>
	$(function() {
		$( "#datepicker" ).datepicker();
		});
		</script>
	<script>
	$(function() {
		$( "#datepicker2" ).datepicker();
		});
		</script>
    </head>
    <body>

        <%
        //HttpSession session = request.getSession(true);
        if (!request.isRequestedSessionIdValid()){
            out.print("Appropriate authorization required."); 
            return;
        }
        Cookie[] cookies = request.getCookies();
        String auth = "null";
        for (int i=0; i<cookies.length; i++) {
            if(cookies[i].getName().equals("type")) {
                auth = cookies[i].getValue();
            }
        }
        %>

	<%
	      String m_url = "jdbc:oracle:thin:@gwynne.cs.ualberta.ca:1521:CRS";
	      String m_driverName = "oracle.jdbc.driver.OracleDriver";
	      
	      String m_userName = "rtwong"; //supply username
	      String m_password = "rtwong1234"; //supply password
	      
	      String addItemError = "";
	      
	      Connection m_con;
	      String createString;
	      String selectString = "select itemName, description from item";
	      Statement stmt;
	      
	      try
	      {
	      
		Class drvClass = Class.forName(m_driverName);
		DriverManager.registerDriver((Driver)
		drvClass.newInstance());
		m_con = DriverManager.getConnection(m_url, m_userName, m_password);
		
	      } 
	      catch(Exception e)
	      {      
		out.print("Error displaying data: ");
		out.println(e.getMessage());
		return;
	      }

	%>	     
    <form name=insertData method=post action=search.jsp> 

      Search by Keyword(s)<br>
      <table>
          <tr>
              <td>
                <input type=text name=query><br><br><br>
              </td>
           </tr>

      </table>
      <table>

          <tr>
          Search by Test Date(s)
          </tr>
          <tr>
              <td>FROM:</td>
              <td><input name="from_date" type="text" id="datepicker"></td>
              <td>TO</td>
              <td><input name="to_date" type="text" id="datepicker2"></td>
           </tr>
       </table>
       <table>
           <tr>
                <br><br>
                <td>
                <input type="radio" name="rank" value="newest">Show Newest First<br>
                <input type="radio" name="rank" value="oldest">Show Oldest First<br>
                <input type="radio" name="rank" value="rank">Show by Ranking
                </td>
            </tr>
       </table>
       <input type=submit value="Search" name="search">
    </form>

    <%
    try
    {
        // sort by newest to oldest
        if (request.getParameter("rank").equals("newest")) {
            if(!(request.getParameter("insertData") != null) {
                // case 1: keyword search, no date
                if(!(request.getParameter("query").equals("")) 
                    && (request.getParameter("from_date").equals("")) 
                    && (request.getParameter("to_date").equals(""))){}

                // case 2: date search, no keyword
                else if((request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}

                // case 3: search by both parameters
                else if(!(request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}
            }
        }

        // sort by oldest to newest
        else if (request.getParameter("rank").equals("oldest")) {
            if(!(request.getParameter("insertData") != null) {
                // case 1: keyword search, no date
                if(!(request.getParameter("query").equals("")) 
                    && (request.getParameter("from_date").equals("")) 
                    && (request.getParameter("to_date").equals(""))){}

                // case 2: date search, no keyword
                else if((request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}

                // case 3: search by both parameters
                else if(!(request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}
            }
        }

        // sort by ranking parameter
        else if (request.getParameter("rank").equals("rank")) {
            if(!(request.getParameter("insertData") != null) {
                // case 1: keyword search, no date
                if(!(request.getParameter("query").equals("")) 
                    && (request.getParameter("from_date").equals("")) 
                    && (request.getParameter("to_date").equals(""))){}

                // case 2: date search, no keyword
                else if((request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}

                // case 3: search by both parameters
                else if(!(request.getParameter("query").equals("")) 
                    && !(request.getParameter("from_date").equals("")) 
                    && !(request.getParameter("to_date").equals(""))){}
            }
        }

        // return with error, one must be checked
        else{}
    }
    catch(Exception e)
    {
        System.out.println("SQLException: " +
        e.getMessage());
	m_con.rollback();
    }
    %>
 

    </body>
</html>        
