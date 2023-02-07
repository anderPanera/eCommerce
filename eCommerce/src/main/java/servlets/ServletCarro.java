package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Carro;
import beans.LineaPedido;
import beans.Pedido;
import beans.Usuario;
import dao.LineaPedidoDao;
import dao.PedidoDao;

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
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		if (request.getParameter("modo").equals("vaciar")) {
			carro.borrar();
		}
		
		if (request.getParameter("modo").equals("comprar")) {
			int id = PedidoDao.dameUltimoId()+1;
		
			System.out.println(id);
			
			carro.cambiarIdsPedido(id);
		
			Pedido pedido = new Pedido(id, usuario, carro.totalPrecio(), new Date());
			
			PedidoDao.insertarPedido(pedido);
			
			HashMap<Integer, LineaPedido> carromap = carro.getCarro();
			for (int key : carromap.keySet() ) {
				LineaPedidoDao.insertarLineaPedido(carromap.get(key));
			}
			
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
			response.sendRedirect("pages/carro.jsp");
			return;
		}
		
		if (request.getParameter("modo").equals("eliminarnav")) {
			carro.borrarLinea(Integer.parseInt(request.getParameter("id")));
		}
		
		if (request.getParameter("modo").equals("sumar")) {
			carro.unoMas(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("pages/carro.jsp");
			return;
		}
		
		if (request.getParameter("modo").equals("restar")) {
			carro.unoMenos(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("pages/carro.jsp");
			return;
		}
		
		
		response.sendRedirect(".");
		return;
	}
	
	

}
