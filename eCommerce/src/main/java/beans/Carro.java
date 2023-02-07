package beans;

import java.util.HashMap;

public class Carro {
	
	private HashMap<Integer, LineaPedido> carro;
	
	public Carro() {
		carro = new HashMap<Integer, LineaPedido>();
	}
	
	public void anadirLinea(LineaPedido lp) {
		Integer id = lp.getProducto().getId();
		
		if (carro.containsKey(id)) {
			carro.put(id, carro.get(id).unoMas());
		} else {
			carro.put(id, lp);
		}
	}
	
	public void borrarLinea(int id) {
		carro.remove(id);
	}
	
	public void cambiarCantidadLinea(int id, int cant) {
		if (cant > 0) {
			carro.put(id, carro.get(id).cambiarCantidad(cant));
		} else {
			borrarLinea(id);
		}
	}
	
	public int totalPrecio() {
		int total = 0;
		
		for (int key : carro.keySet()) {
			total += carro.get(key).totalLinea(); 
		}
		
		return total;
	}
	
	public void borrar() {
		carro.clear();
	}
	
	public int length() {
		return carro.size();
	}
	
	public HashMap<Integer, LineaPedido> getCarro() {
		return carro;
	}
	
}
