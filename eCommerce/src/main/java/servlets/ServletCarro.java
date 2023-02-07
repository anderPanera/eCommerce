package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Carro;

/**
 * Servlet implementation class ServletCarro
 */
@WebServlet("/ServletCarro")
public class ServletCarro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCarro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		Carro carro = (Carro) session.getAttribute("carro");
		
		if (request.getParameter("modo").equals("vaciar")) {
			carro.borrar();
		}
		
		response.sendRedirect(".");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		Carro carro = (Carro) session.getAttribute("carro");
		
		if (request.getParameter("modo").equals("actualizar")) {
			carro.cambiarCantidadLinea(Integer.parseInt(request.getParameter("id")), Integer.parseInt(request.getParameter("cant")));
		}
		
		if (request.getParameter("modo").equals("eliminar")) {
			carro.borrarLinea(Integer.parseInt(request.getParameter("id")));
		}
		
		
		
		response.sendRedirect(".");
		return;
	}
	
	

}
