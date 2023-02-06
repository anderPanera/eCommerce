package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Carro;
import beans.LineaPedido;
import beans.Producto;
import dao.ProductoDao;

/**
 * Servlet implementation class Productos
 */
@WebServlet("/Productos")
public class ServletProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		Carro carro;
		
		if (session.getAttribute("carro") == null) {
			carro = new Carro();
		} else {
			carro = (Carro) session.getAttribute("carro");
		}
		
		if (request.getParameter("id") != null) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			if (request.getParameter("info") != null) {
				session.setAttribute("producto", ProductoDao.getProducto(id));
				response.sendRedirect("pages/producto.jsp");
				return;
			}
			if (request.getParameter("comprar") != null) {
				if (session.getAttribute("usuario") == null) {
					response.sendRedirect("/eCommerce/login.jsp");
					return;
				}
				Producto producto = ProductoDao.getProducto(id);
				LineaPedido lp = new LineaPedido(carro.length()+1, 1, 0, producto);
				carro.anadirLinea(lp);
			}
		} else {
			ArrayList<Producto> lista = ProductoDao.getProductos();
			session.setAttribute("productos", lista);
		}
		
		session.setAttribute("carro", carro);
		
		response.sendRedirect(".");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
