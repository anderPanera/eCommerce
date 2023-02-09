package beans;

public class LineaPedido {
	
	private int id;
	private int cantidad;
	private int idpedido;
	private Producto producto;
	
	public LineaPedido(int id, int cantidad, int idpedido, Producto producto) {
		super();
		this.id = id;
		this.cantidad = cantidad;
		this.idpedido = idpedido;
		this.producto = producto;
	}

	public int getId() {
		return id;
	}

	public int getCantidad() {
		return cantidad;
	}

	public int getIdpedido() {
		return idpedido;
	}

	public Producto getProducto() {
		return producto;
	}
	
	public int getPrecioLineaTotal() {
		return cantidad * producto.getPrecio();
	}
	
	public void setIdpedido(int id) {
		this.idpedido = id;
	}
	
	public LineaPedido unoMas() {
		LineaPedido lp2 = new LineaPedido(this.getId(), this.getCantidad()+1, this.getIdpedido(), this.getProducto());
		return lp2;
	}
	
	public LineaPedido unoMenos() {
		LineaPedido lp2 = new LineaPedido(this.getId(), this.getCantidad()-1, this.getIdpedido(), this.getProducto());
		return lp2;
	}
	
	public LineaPedido cambiarCantidad(int cant) {
		LineaPedido lp2 = new LineaPedido(this.getId(), cant, this.getIdpedido(), this.getProducto());
		return lp2;
	}
	
	public int totalLinea() {
		return this.getCantidad() * this.getProducto().getPrecio();
	}
}
