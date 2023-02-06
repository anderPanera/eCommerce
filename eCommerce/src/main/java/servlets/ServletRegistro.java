package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Usuario;
import dao.UsuarioDao;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletRegistro")
public class ServletRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(".");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			String nombre = request.getParameter("nombre");
			String apellidos = request.getParameter("apellidos");
			String usuario = request.getParameter("usuario");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String domicilio = request.getParameter("domicilio");
			String cp = request.getParameter("cp");
			String telefono = request.getParameter("telefono");
			
			if (nombre == null || apellidos == null || usuario == null || email == null || password == null || domicilio == null || cp == null || telefono == null) {
				session.setAttribute("error_register","Algun campo vacio");
				response.sendRedirect("register.jsp");
			}
			
			Usuario usu = new Usuario(usuario, nombre, apellidos, password, domicilio, cp, telefono, email);
			
			if(UsuarioDao.insertarUsuario(usu)){
				response.sendRedirect(".");
				return;
			}
			
			session.setAttribute("error_register","Usuario ya existe o incorrecto");
		} catch (Exception e) {
			session.setAttribute("error_register","ha ocurrido un error inesperado.");
		}
		response.sendRedirect("register.jsp");
	}

}
