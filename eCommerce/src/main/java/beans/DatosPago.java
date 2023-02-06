package beans;

public class DatosPago {
	
	private int id;
	private Usuario usuario;
	private String titular;
	private int numero;
	private String caducidad;
	private int codigo;
	private String domicilio;
	
	public DatosPago(int id, Usuario usuario, String titular, int numero, String caducidad, int codigo,
			String domicilio) {
		super();
		this.id = id;
		this.usuario = usuario;
		this.titular = titular;
		this.numero = numero;
		this.caducidad = caducidad;
		this.codigo = codigo;
		this.domicilio = domicilio;
	}

	public int getId() {
		return id;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public String getTitular() {
		return titular;
	}

	public int getNumero() {
		return numero;
	}

	public String getCaducidad() {
		return caducidad;
	}

	public int getCodigo() {
		return codigo;
	}

	public String getDomicilio() {
		return domicilio;
	}
	
	
	
	
	
}
