package pe.edu.vallegrande.app.test;

import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.CustomerService;

public class ConsultaPorID {

	public static void main(String[] args) {
		
		try {
			CustomerService service = new CustomerService();
			Customers bean = service.getForId("10");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
