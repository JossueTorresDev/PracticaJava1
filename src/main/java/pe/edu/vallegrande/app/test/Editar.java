package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.CustomerService;

public class Editar {

	public static void main(String[] args) {
		try {
			Customers bean = new Customers(17,"Editado","Cliente","DNI","41111114","cliente@example.com","912345678");
			CustomerService service = new CustomerService();
			service.update(bean);
			System.out.println("Se edito correctamente.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
