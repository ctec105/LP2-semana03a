package sisepuede;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogueoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. Recuperamos los datos que llegan en el request
		String vusuario = request.getParameter("usuario");
		String vclave = request.getParameter("clave");
		System.out.println(vusuario);
		System.out.println(vclave);

		// 2. "validamos" (creamos un poco de l�gica)
		boolean ok = false;
		if (vusuario.equals("jose") && vclave.equals("123")){
			ok = true;
		}
		
		// 3. Dependiendo del resultado de la validaci�n invocamos a bienvenida.jsp o rebotamos a logueo.jsp
		// Para que un servlet pueda invocar a otro componente, usamos el famoso objeto RequestDispatcher (Despachador del request)
		if (ok == true) {
			System.out.println("Caso de �xito");
			// Cargamos informaci�n adicional en el request, antes de despacharlo
			String nombre = "Jos� Luis :)";
			Calendar c = Calendar.getInstance();
			c.set(1992, 1, 30);
			Date fecnac = c.getTime();
			// El primer par�metro representa el nombre del objeto a cargar en el request
			// El segundo par�metro es el objeto que estamos cargando en el request
			request.setAttribute("nombre", nombre);
			request.setAttribute("fecha", fecnac);
			
			// VERIFICAR SI EXISTE UNA SESI�N ACTIVA, SI EXISTE LA MATAMOS
			if (request.isRequestedSessionIdValid()){
				HttpSession tempo = request.getSession(); // Apunta a la zona de memoria, da lo mismo poner true o false
				tempo.invalidate(); // Matamos la sesi�n
				System.out.println("La sesi�n murio :( " + tempo);
			}
			
			// CREAMOS UNA SESI�N NUEVA
			HttpSession lasesion = request.getSession(true); // Siempre va a crear la sesi�n, pues lo matamos anteriormente
			System.out.println("Id de la sesi�n: " + lasesion.getId());
			System.out.println("Tiempo m�ximo de inactividad: " + lasesion.getMaxInactiveInterval());
			System.out.println("La sesi�n es nueva? " + lasesion.isNew()); // Retorna un booleano
			
			// CARGAMOS OBJETOS A LA SESI�N
			lasesion.setAttribute("nombre", nombre);
			lasesion.setAttribute("fecha", fecnac);
			
			RequestDispatcher rd = request.getRequestDispatcher("/bienvenida.jsp");
			// Despachamos
			rd.forward(request, response);
		} else {
			System.out.println("Caso de error");
			
			// Cargamos otros datos al request
			String mensaje = "Usuario y/o clave erradas";
			
			request.setAttribute("mensaje", mensaje);
			RequestDispatcher rd = request.getRequestDispatcher("/logueo.jsp");
			
			// Despachamos
			rd.forward(request, response);
		}
	}
}