
PRÁCTICA DE LABORATORIO 
 
 
CARRERA: INGENIERIA DE SISTEMAS 	ASIGNATURA: APLICACIONES DISTRIBUIDAS 
NRO. PRÁCTICA: 	2 	TÍTULO PRÁCTICA: Desarrollo de una aplicación JEE basado en Servlets, JSP y JDBC para el intercambio de datos en un modelo de tres capas aplicando los patrones diseño de software MVC y DAO 
OBJETIVOS 
• Diseña y desarrolla modelos de software en diferentes niveles de abstracción y modelos de datos a nivel transaccional y analítico con entornos de desarrollo actuales  
INSTRUCCIONES  	 
Se pide desarrollar una aplicación JEE que permita implementar una agenda telefónica en donde se tendrán usuarios con datos como cedula, nombres, apellidos, correo y contraseña. Y cada uno de estos usuarios podrá tener asignado uno o más teléfonos de contacto de diferente tipo y operador, por ejemplo: 
 
•	El usuario “Juanito” tiene los teléfonos 0998121212 de tipo celular y operadora Movistar; así como también tiene asignado el teléfono 0728222111 de tipo convencional y operador CNT. 
 
Para lo cuál, se propone el siguiente diagrama de clases: 
![image](https://user-images.githubusercontent.com/62858551/118599483-31d48500-b775-11eb-9b86-d4c7eaffbe01.png)

 
Los requerimientos funcionales del sistema son: 
•	Los usuarios pueden registrarse en la aplicación a través de un formulario de creación de cuentas. 
•	Un usuario puede iniciar sesión usando su correo y contraseña. 
•	Una vez iniciado sesión el usuario podrá: 

• Registrar, modificar, eliminar, buscar y listar sus teléfonos o Listar los números de teléfono de un usuario usando su número de cédula o correo electrónico 
• Podrá llamar o enviar un correo electrónico desde el sistema usando aplicaciones externas. 
• 	Los datos siempre deberán ser validados cuando se trabaje a través de formularios. 
De igual manera, se pide manejar sesiones y filtros para que existe seguridad en el sistema de agenda telefónica. Por lo qué, debe existir una parte pública y una privada. La parte privada ha sido descrita en los requisitos antes planteados. Y la parte pública será una página index.html a través de la cuál podrán acceder al sistema. No obstante, se debe generar una página con la experiencia e interfaz de usuario apropiada, como la que se muestra en la Fig 3. Finalmente, el sistema de agenda telefónica debe aplicar los patrones de diseño de software MVC y DAO, en donde, el modelo será clases POJOs de Java, la vista será JSP + JSTL y los controladores serán a través de DAOs y Servlets. 
 
 ![image](https://user-images.githubusercontent.com/62858551/118599552-54669e00-b775-11eb-8600-ff98441c618a.png)

Fig 3. Pagina pública index.html propuesta para el sistema de agenda telefónica 
 
ACTIVIDADES POR DESARROLLAR  
1. Crear un repositorio en GitHub con el nombre “Práctica de laboratorio 02: Agenda Telefónica en JEE” 

https://github.com/AngelJadan/AgendaTelefonica 
 
2. Desarrollar una aplicación con tecnología JEE para gestionar requerimientos de compra en la web. 

•	Los usuarios pueden registrarse en la aplicación a través de un formulario de creación de cuentas. 

<img width="399" alt="Captura de Pantalla 2021-05-18 a la(s) 00 34 22" src="https://user-images.githubusercontent.com/62858551/118599595-68120480-b775-11eb-9ef6-8505b13615ec.png">

 
•	Un usuario puede iniciar sesión usando su correo y contraseña. 

 <img width="496" alt="Captura de Pantalla 2021-05-18 a la(s) 00 33 43" src="https://user-images.githubusercontent.com/62858551/118599611-6d6f4f00-b775-11eb-80e2-23d9c36fbb4b.png">



Metodo CRUD de TELEFONOS
CREATE:
 package ec.edu.ups.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.DAOFactory;
import ec.edu.ups.dao.TelefonoDAO;
import ec.edu.ups.dao.UsuarioDAO;
import ec.edu.ups.modelo.Telefono;
import ec.edu.ups.modelo.Usuario;

/**
 * Servlet implementation class CrearTelefonoController
 */
@WebServlet("/CrearTelefonoController")
public class CrearTelefonoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TelefonoDAO telefonoDAO;
	private Telefono telefono;
	private UsuarioDAO usuarioDAO;
	private Usuario usuario;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CrearTelefonoController() {
		super();
		// TODO Auto-generated constructor stub
		telefonoDAO = DAOFactory.getFactory().getTelefono();
		telefono = new Telefono();
		usuarioDAO = DAOFactory.getFactory().getUsuario();
		usuario = new Usuario();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = null;
		try {
			System.out.println("Guardando...");
			String ced = request.getParameter("usuario");
			System.out.println("Cedula: "+ced);
			usuario = usuarioDAO.read(ced);
			System.out.println("Usuario: "+usuario.toString());
			if (usuario!=null) {
				String numero = request.getParameter("numero");
				String tipo = request.getParameter("tipo");
				String operadora = request.getParameter("operadora");
				telefono.setCodigo(0);
				telefono.setNumero(numero);
				telefono.setTipo(tipo);
				telefono.setOperadora(operadora);
				telefono.setUsuario(usuario);
				telefonoDAO.create(telefono);
				PrintWriter out = response.getWriter();
				out.println("<p>Telefono agregado correctamente</p>");
				out.println("<a href='/AgendaTelefonicaJEE/JSPs/crearTelefono.jsp'>Volver</a>");
				out.println("</body></html>");
				
			}else {
				System.out.println("Usuario no encontrado.");
				url = "/JSPs/error.jsp";
			}
		} catch (Exception e) {
			System.out.println("Error crear telefono=> "+e.getMessage());
			url = "/JSPs/error.jsp";
		}
		getServletContext().getRequestDispatcher(url);
	}

}

UPDATE:
 
package ec.edu.ups.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.DAOFactory;
import ec.edu.ups.dao.TelefonoDAO;
import ec.edu.ups.modelo.Telefono;

/**
 * Servlet implementation class BuscarTelefonoController
 */
@WebServlet("/BuscarTelefonoController")
public class BuscarTelefonoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TelefonoDAO telefonoDAO;
	private Telefono telefono;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuscarTelefonoController() {
		super();
		// TODO Auto-generated constructor stub
		telefonoDAO = DAOFactory.getFactory().getTelefono();
		telefono = new Telefono();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Busqueda telefono");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String url = null;
		System.out.println("Codigo: " + codigo);
		try {
			telefono = telefonoDAO.read(codigo);
			System.out.println("Telefono " + telefono.toString());
			request.setAttribute("telefono", telefono);
			url = "/JSPs/editarTelefono.jsp";
		} catch (Exception e) {
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String url = null;
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		String numero = String.valueOf(request.getParameter("numero"));
		String tipo = String.valueOf(request.getParameter("tipo"));
		String operadora = String.valueOf(request.getParameter("operadora"));
		String cedula = String.valueOf(request.getParameter("cedula"));
		try {
			telefono = new Telefono(codigo, numero, tipo, operadora, null);
			System.out.println("Nuevo telefono " + telefono.toString());
			telefonoDAO.update(telefono);
			String sms = "<html><head><title>Actualizado</title></head><body>";
			PrintWriter out = response.getWriter();
			out.println(sms);
			out.println("<a href='/AgendaTelefonicaJEE/JSPs/inicio_usuario.jsp'>Volver</a> <br>");
			out.println("<p>Los datos ha sido actualizados</p>");
		} catch (Exception e) {
			System.out.println("Error al actualizar en controller. " + e.getMessage());
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}

DELETE:
 package ec.edu.ups.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.TelefonoDAO;
import ec.edu.ups.modelo.Telefono;
import mysql.jdbc.JDBCTelefonoDAO;

/**
 * Servlet implementation class EliminarTelefonoController
 */
@WebServlet("/EliminarTelefonoController")
public class EliminarTelefonoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private Telefono telefono;
       private TelefonoDAO telefonoDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarTelefonoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String url = "";
	        
	        telefono = new Telefono();
	        telefonoDAO = new JDBCTelefonoDAO();
	        try {
	            telefono.setCodigo(Integer.valueOf(request.getParameter("codigo")));
	            telefonoDAO.delete(telefono);
	            url = "/LoginUsuarioController";
	        } catch (Exception e) {
	            url = "/error.jsp";
	        }
	       getServletContext().getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
METODO LISTAR
 <img width="653" alt="Captura de Pantalla 2021-05-18 a la(s) 00 43 16" src="https://user-images.githubusercontent.com/62858551/118599851-c6d77e00-b775-11eb-88b6-437f95170de2.png">

Podrá llamar o enviar un correo electrónico desde el sistema usando aplicaciones externas. 
Finalmente, el sistema de agenda telefónica debe aplicar los patrones de diseño de software MVC y DAO, en donde, el modelo será clases POJOs de Java, la vista será JSP + JSTL y los controladores serán a través de DAOs y Servlets. 
PAQUETES DEL PROYECTOS
 <img width="323" alt="Captura de Pantalla 2021-05-18 a la(s) 00 47 42" src="https://user-images.githubusercontent.com/62858551/118599875-cfc84f80-b775-11eb-863f-fd7a38dc2a1b.png">


la vista será JSP + JSTL
<img width="230" alt="Captura de Pantalla 2021-05-18 a la(s) 00 50 17" src="https://user-images.githubusercontent.com/62858551/118599886-d3f46d00-b775-11eb-91cd-97f08dd18d80.png"> 

RESULTADO(S) OBTENIDO(S): 
•	Maneja diferentes formatos para el intercambio de datos entre aplicaciones. 
•	Crear una aplicación con una interfaz de usuario adecuada, 
•	Fácil de comprencion para los usuarios.
•	

 
CONCLUSIONES:  
•	Se logro implementar sistemas JEE basado en Servlets, JSP y JDBC. 
•	Implementar patrones de diseño de software MVC y DAO.
•	Los controladores que se implementaron son a través de DAOs y Servlets.


 
RECOMENDACIONES:  
•	Aplicar conceptos de interacción humano máquina para el desarrollo de la GUI. 
•	las clases estan bien programadas y con las relaciones correctas también.


 
 
Estudiantes:  Angel Jadan, Telmo Rocano
Firma:   
![image](https://user-images.githubusercontent.com/62858551/118599360-018ce680-b775-11eb-9c83-0fa2ac06ab6f.png)
