package beans;

import java.util.Date;
import java.util.HashMap;

public class Pedido {
	
	private int id;
	private Usuario usuario;
	private double total;
	private Date fecha;
	
	private HashMap<Integer, LineaPedido> carro;
	
	public Pedido(int id, Usuario usuario, double total, Date fecha) {
		super();
		carro = new HashMap<Integer, LineaPedido>();
		this.id = id;
		this.usuario = usuario;
		this.total = total;
		this.fecha = fecha;
	}

	public int getId() {
		return id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public double getTotal() {
		return total;
	}

	public Date getFecha() {
		return fecha;
	}
	
	public HashMap<Integer, LineaPedido> getCarro() {
		return carro;
	}
	
	public boolean anadirCarro(LineaPedido lp) {
		carro.put(lp.getProducto().getId(), lp);
		return true;
	}
	
	public boolean removeCarro(LineaPedido lp) {
		carro.remove(lp.getProducto().getId());
		return true;
	}
	
	public boolean clearCarro() {
		carro.clear();
		return true;
	}
	
	
}
