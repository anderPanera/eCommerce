package beans;

public class Producto {
	
	private int id;
	private String nombre;
	private String descripcion;
	private String imagen;
	private double precio;
	
	public Producto(int id, String nombre, String descripcion, String imagen, double precio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.imagen = imagen;
		this.precio = precio;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public String getImagen() {
		return imagen;
	}

	public double getPrecio() {
		return precio;
	}
	
	
	
	
	
	
	
}
