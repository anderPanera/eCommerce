package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
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
		HttpSession session = request.getSession();
		try {
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			//Usuario usuario = UsuarioDao.validarUsuario(usuario,password);
			/*if(usuario !=null){
				session.setAttribute("usuario", usuario);
				response.sendRedirect(".");
				return;
			}
			*/
			session.setAttribute("error_login","Usuario o contraseña incorrecto.");
		} catch (Exception e) {
			session.setAttribute("error_login","ha ocurrido un error inesperado.");
		}
		response.sendRedirect(request.getContextPath()+"login.jsp");
	}

}
