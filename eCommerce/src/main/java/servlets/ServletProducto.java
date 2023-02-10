package servlets;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Carro;
import beans.LineaPedido;
import beans.Producto;
import dao.CategoriaDao;
import dao.ProductoDao;

/**
 * Servlet implementation class Productos
 */
@WebServlet("/ServletProducto")
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
		
		if (request.getParameter("editar") != null) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			
			
			
		}
		
		if (request.getParameter("id") != null) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			if (request.getParameter("info") != null || request.getParameter("editar") != null) {
				session.setAttribute("producto", ProductoDao.getProducto(id));
				String accion = request.getParameter("info") != null ? "info" : "editar";
				session.setAttribute("accion", accion);
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
			ArrayList<Producto> lista = new ArrayList<Producto>();
			if (request.getParameter("cat") != null) {
				String cat = request.getParameter("cat");
				for (Integer id : CategoriaDao.getIdsCategoria(cat)) {
					lista.add(ProductoDao.getProducto(id));
				}
				session.setAttribute("productos", lista);
				response.sendRedirect("/eCommerce/?cat=" + cat);
				return;
			} else {
				lista = ProductoDao.getProductos();
				session.setAttribute("productos", lista);
			}
		}
		
		session.setAttribute("carro", carro);
		response.sendRedirect(".");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		
		
		
		if (request.getParameter("modo").equals("crear")) {
			String nombre = request.getParameter("nombre");
			String desc = request.getParameter("desc");
			int precio = Integer.parseInt(request.getParameter("precio"));
			String imagen = request.getParameter("imagen");
			
			Producto producto = new Producto(nombre, desc, imagen, precio);
			
			ProductoDao.insertarProducto(producto);
		}
		
		if(request.getParameter("modo").equals("cambiar")) {
			try {
				String titulo = request.getParameter("titulo");
				String descripcion = request.getParameter("descripcion");
				int precio = Integer.parseInt(request.getParameter("precio"));
				Producto p = (Producto) session.getAttribute("producto");
				p.setNombre(titulo);
				p.setDescripcion(descripcion);
				p.setPrecio(precio);
				ProductoDao.actualizarProducto(p);
			} catch (Exception e) {
			}
		}
		
		if(request.getParameter("modo").equals("eliminar")) {
			Producto p = (Producto) session.getAttribute("producto");
			ProductoDao.eliminarProducto(p);
			
		}
		
		session.removeAttribute("productos");
		response.sendRedirect(".");
	}

}
