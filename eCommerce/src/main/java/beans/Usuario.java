package beans;

public class Usuario {
	
	private String usuario;
	private String nombre;
	private String apellidos;
	private String password;
	private String domicilio;
	private String codigopostal;
	private String telefono;
	private String email;
	
	public Usuario(String usuario, String nombre, String apellidos, String password, String domicilio,
			String codigopostal, String telefono, String email) {
		super();
		this.usuario = usuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.password = password;
		this.domicilio = domicilio;
		this.codigopostal = codigopostal;
		this.telefono = telefono;
		this.email = email;
	}

	public String getUsuario() {
		return usuario;
	}

	public String getNombre() {
		return nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public String getPassword() {
		return password;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public String getCodigopostal() {
		return codigopostal;
	}

	public String getTelefono() {
		return telefono;
	}

	public String getEmail() {
		return email;
	}
	
	
	
	
	
	
	
	
}
