<%-- 
    Document   : index
    Created on : 17 Dec, 2012, 2:17:54 PM
    Author     : DELL
--%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.io.*, org.jsoup.Jsoup,org.jsoup.helper.Validate, org.jsoup.nodes.Document, org.jsoup.nodes.Element, org.jsoup.select.Elements" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC</title>
    </head>
     <center>
     <f:view>
     <h1>
     <h:outputText value="Problem code: #{spojBean.code.toUpperCase()}"/>
     
     
     </h1>
     
    <body>
    	<%    		
    		/**
    		
    			Methods used to do the task:4
    			1. Directly opening the stream and treating it as xml 
    			and using xpath to query the stream to get the result.
    			Problem: White space error.
    			2. Opening the stream and by using BufferedInputStream or BufferedReader, read the 
    			stream and make a xml file on the host and then using it further for querying using xpath.
    			Problem: White space error still persists.
    			3. Opening stream ,reading form the stream and using basic string manipulation
    			techniques to search for the useful information.
    			Problem: Too slow!
    			4. Using an HTML parsing tool Jsoup and parsing the document for 
    			the appropriate information. There are ways in which the parsing can be done,
    			Selected the most optimal one based on there time of task completion.
    		
		try {
			    //String code=request.getParameter("code");
		            String code="PRIME1";
		            //String code=#{spojBean.code};
		            
		            //out.println(code);
		            String url="http://www.spoj.com/ranks/"+code;
		            URL u=new URL(url);
		            HttpURLConnection con=(HttpURLConnection)u.openConnection();
		
		            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		            DocumentBuilder builder = factory.newDocumentBuilder();
				InputStream is=con.getInputStream();
		            BufferedReader in=new BufferedReader(new InputStreamReader(is));
		            String inputLine,str=null;
		            int flag=0;
		            while((inputLine=in.readLine())!=null){
				if(inputLine.indexOf("lightrow")>-1){
					flag=1;
					inputLine=in.readLine();
					int i=inputLine.indexOf("<td>");
					int j=inputLine.indexOf("</td>");
					str=inputLine.substring(i+4,j);
				}
		                
		            }
		            if(flag==1){
		            	float points=(float)(80.00/(40+Integer.parseInt(str)));
		            	out.println(points);
		            }
				
				
		            Document doc = builder.parse(con.getInputStream());
		            out.println("exception1");
		            XPath xpath = XPathFactory.newInstance().newXPath();
		            XPathExpression expr = xpath.compile("//tr[@class='lightrow']/td/text()");
		            
		            Object result = expr.evaluate(doc, XPathConstants.NODESET);
			      NodeList nodes = (NodeList) result;
			      for (int i = 0; i < nodes.getLength(); i++) {
 				out.println(nodes.item(i).getNodeValue()); 
 				}
 				
		
		        }
		        catch(ParserConfigurationException e){out.println("exception1");}
		        //catch(SAXException e){out.println("exception2");}
		**/
		
		Validate.isTrue(true, "usage: supply url to fetch");
		try{
			
			//out.println("#{spojBean.code}");
			String code="TEST";
			String url="http://www.spoj.pl/ranks/"+code;			
			Document doc = Jsoup.connect(url).timeout(20000).get();
			//Element e=doc.getElementsByAttributeValue("class","lightrow").first();
			//Element e=doc.select("tr[class=lightrow] > td").get(0);			
			//System.out.println(e.text());			
			Elements es=doc.getElementsByAttributeValue("class","lightrow");
	        	int a=Integer.parseInt(es.get(0).child(0).text());
	        	double points=(80.00)/(40.0+(double)a);
	        	out.println("Awarded points after correct submission: "+points);
	        	
		}catch(Exception e){e.printStackTrace();}	
		
		
		
    	%>
    	<br/>
    	<form>
    		<button value="Go Back" onclick="history.back()">Go Back</button>
    	</form>
    	</center>
        </f:view>
    </body>
</html>
