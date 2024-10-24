package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.service.CustomerService;

public class EliminadoFisico {

	public static void main(String[] args) {
		
		try {
			CustomerService service = new CustomerService();
			service.delete("17");
			System.out.println("Usuario eliminado.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
