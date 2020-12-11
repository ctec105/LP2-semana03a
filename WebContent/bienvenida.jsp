<!-- IMPORTAR LIBRERÍAS -->
<%@ page import="java.util.Date" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Adjuntar estilos CSS -->
<link href="estilos/facilito.css" rel="stylesheet" type="text/css">
</head>

<!-- CUERPO DE LAPAGINA-->
<body>
  <table>        
    <tr>
	  <!--  CABECERA -->
	  <td colspan="2" align="center"><jsp:include page="cabecera.jsp"/></td>
	</tr>
    <tr>
      <!-- MENÚ -->
  	  <td><jsp:include page="menu.jsp"/></td>
	  <!--  CUERPO -->
	  <td>
		<table class="contorl">
			<!-- Ya no usamos Scriptlets y Expressions
			Ahora vamos a utilizar JSTL para recuperar los parametros y objetos que han sido cargados
			al request y a la sesión...
			
			Existen objetos predefinidos tales como:
			param; permite referencia a los parámetros de la solicitud
			requestScope; permite referenciar a los objetos de la solicitud
			sessionScope; permite referenciar a los objetos de la sesión web
			 -->
			<tr>
		    	<td colspan="2">Bienvenido estimado usuario, sus datos son:</td>
		  	</tr>
		  <tr>
		    <td>Usuario:</td>
			<td>${param.usuario}</td>
		  </tr>
		  <tr>
		    <td>Nombre:</td>
			<td>${requestScope.nombre}</td>
		  </tr>
		  <tr>
		    <td>Fecha de nacimiento:</td>
			<td>${requestScope.fecha}</td>
		  </tr>
		  <tr>
		    <td>Nombre (recuperado de la sesión):</td>
			<td>${sessionScope.nombre}</td>
		  </tr>
		  <tr>
		    <td>Fecha de nacimiento (recuperado de la sesión):</td>
			<td>${sessionScope.fecha}</td>
		  </tr>
        </table>			
	  </td>
	</tr>
	<tr>
		<!--  PIE DE PÁGINA -->
		<td colspan="2" align="center"><jsp:include page="pie.jsp"/></td>
	</tr>
  </table>
</body>
</html>