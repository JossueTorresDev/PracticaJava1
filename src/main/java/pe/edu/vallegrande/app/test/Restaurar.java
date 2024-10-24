package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.service.CustomerService;

public class Restaurar {

	public static void main(String[] args) {
		
		try {
			CustomerService service = new CustomerService();
			service.restore("18");
			System.out.println("Usuario activo.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
