package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.LineaPedido;
import beans.Pedido;
import beans.Usuario;
import dao.LineaPedidoDao;
import dao.PedidoDao;

/**
 * Servlet implementation class ServletPedidos
 */
@WebServlet("/ServletPedidos")
public class ServletPedidos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPedidos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		HashMap<Pedido, ArrayList<LineaPedido>> listaPedidosLineaPedidos = new HashMap<Pedido, ArrayList<LineaPedido>>();
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		
		ArrayList<Pedido> listaPedidos = PedidoDao.damePedidosUsuario(usuario);
		
		for (Pedido pedido : listaPedidos) {
			ArrayList<LineaPedido> listaLineaPedidos = LineaPedidoDao.dameLineaPedidosPedido(pedido.getId());
			listaPedidosLineaPedidos.put(pedido, listaLineaPedidos);
		}
		
		session.setAttribute("pedidoslineas", listaPedidosLineaPedidos);
		response.sendRedirect("/eCommerce/pages/perfil.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
