package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.CustomerService;

public class Insertar {

	public static void main(String[] args) {
		try {
			Customers bean = new Customers("Nuevo","Cliente","DNI","42222140","cliente@example.com","955421546");
			CustomerService service = new CustomerService();
			service.insert(bean);
			System.out.println("Se insertó correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
