package pe.edu.vallegrande.app.test;

import java.util.List;

import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.CustomerService;

public class ConsultaInactivos {

	
	public static void main(String[] args) {
		
		try {
			CustomerService service = new CustomerService();
			List<Customers>lista=service.getInactive();
			for(Customers customer:lista) {
				System.out.println(customer);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}
}
