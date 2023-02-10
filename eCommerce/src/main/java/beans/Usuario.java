package beans;

public class Usuario {
	
	private String usuario;
	private String rol;
	private String nombre;
	private String apellidos;
	private String password;
	private String domicilio;
	private String codigopostal;
	private String telefono;
	private String email;
	
	public Usuario(String usuario, String rol, String nombre, String apellidos, String password, String domicilio,
			String codigopostal, String telefono, String email) {
		super();
		this.usuario = usuario;
		this.rol = rol;
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

	public String getRol() {
		return rol;
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

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public void setCodigopostal(String codigopostal) {
		this.codigopostal = codigopostal;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
	
	
	
	
}
