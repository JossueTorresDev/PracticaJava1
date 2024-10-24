package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.CustomerService;

@WebServlet({ "/CustomerActivos", "/CustomerInactivos", "/CustomerProcesar", "/CustomerBuscar" })
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CustomerService customerService = new CustomerService();

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/CustomerActivos":
			activos(request, response);
			break;
		case "/CustomerInactivos":
			inactivos(request, response);
			break;
		case "/CustomerProcesar":
			procesar(request, response);
			break;
		case "/CustomerBuscar":
			buscar(request, response);
			break;
		}
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buscar = request.getParameter("buscador");
		List<Customers>lista=customerService.get(buscar);
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		UtilController.responseJson(response, data);
	}

	private void procesar(HttpServletRequest request, HttpServletResponse response) {
		String accion = request.getParameter("accion");
		Customers bean = new Customers();
		bean.setId(Integer.parseInt(request.getParameter("id")));
		bean.setNames(request.getParameter("nom"));
		bean.setLastName(request.getParameter("ape"));
		bean.setDocType(request.getParameter("tipDoc"));
		bean.setDocNum(request.getParameter("numDoc"));
		bean.setEmail(request.getParameter("ema"));
		bean.setCell(request.getParameter("cell"));
		try {
			switch (accion) {
			case UtilController.CRUD_NUEVO:
				customerService.insert(bean);
				break;
			case UtilController.CRUD_EDITAR:
				customerService.update(bean);
				break;
			case UtilController.CRUD_ELIMINADO:
				customerService.removed(bean.getId().toString());
				break;
			case UtilController.CRUD_RESTAURAR:
				customerService.restore(bean.getId().toString());
				break;
			case UtilController.CRUD_ELIMINAR:
				customerService.delete(bean.getId().toString());
				break;
			default:
				throw new IllegalArgumentException("Accion: "+accion);
			}
			UtilController.responseJson(response, "Proceso ok.");
		} catch (Exception e) {
			UtilController.responseJson(response, e.getMessage());
		}
	}

	private void inactivos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customers>lista=customerService.getInactive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		UtilController.responseJson(response, data);
	}

	private void activos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customers>lista=customerService.getActive();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		UtilController.responseJson(response, data);
	}

}
