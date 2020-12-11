<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Aquí podemos adjuntar estilos CSS -->
<link href="estilos/facilito.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function f_ingresa(){
	// También podemos jugar con java script
	}
</script>
</head>
<body>
	<!-- Invocamos mediante post al servlet salimostemprano -->
	<form action="salimostemprano" method="post" > 
 		<table>
    		<tr class="etiqueta">
      			<td colspan="2"><img alt="El loguito" src="imagenes/logo_tiny.png"></td>
    		</tr>
    		<tr class="etiqueta">
      			<td>Usuario:</td>
      			<td><input type="text" name="usuario"></td>
    		</tr>
    		<tr class="etiqueta">
      			<td>Clave:</td>
      			<td><input type="password" name="clave"></td>
    		</tr>
    		<tr class="error general">
      			<td colspan="2" align="center">
      				${requestScope.mensaje}
      			</td>  
    		</tr>
    		<tr>
      			<td colspan="2" align="right">
      				<input type="submit" name="boton01" value="Ingresar">
   				</td>
    		</tr>
  		</table>
	</form>
</body>
</html>