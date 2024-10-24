package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.service.CustomerService;

public class EliminadoLogico {

	public static void main(String[] args) {
		
		try {
			CustomerService service = new CustomerService();
			service.removed("18");
			System.out.println("Usuario inactivo.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
