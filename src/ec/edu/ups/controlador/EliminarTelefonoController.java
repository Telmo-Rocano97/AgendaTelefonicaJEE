package ec.edu.ups.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.DAOFactory;
import ec.edu.ups.dao.TelefonoDAO;
import ec.edu.ups.modelo.Telefono;

/**
 * Servlet implementation class EliminarTelefonoController
 */
@WebServlet("/EliminarTelefonoController")
public class EliminarTelefonoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TelefonoDAO telefonoDAO;
	private Telefono telefono;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminarTelefonoController() {
        super();
        // TODO Auto-generated constructor stub
        telefonoDAO = DAOFactory.getFactory().getTelefono();
		telefono = new Telefono();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String url = null;
		try {
			telefono.setCodigo(Integer.valueOf(request.getParameter("codigo")));
			telefonoDAO.delete(telefono);
			url = "/index.html";
		} catch (Exception e) {
			url = "/JSPs/error.jsp";
		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
	
	}

}
