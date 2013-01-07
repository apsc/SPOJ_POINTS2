<%-- 
    Document   : index
    Created on : 17 Dec, 2012, 2:17:54 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
	<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
	<center>
	<f:view>
		<head>
		</head>
		<h1>Welcome to SPOJ points calculator...</h1>
		<body>  
			<h:form>
				<h:outputText id="label" value="Please enter the problem code :"/>&nbsp
				<h:inputText id="code"   value="#{spojBean.code}"/><br/>
				<h:commandButton value="Calculate!" action ="#{spojBean.submit}"/>
			</h:form>

		</body>
	</f:view>
	</center>
</html>
