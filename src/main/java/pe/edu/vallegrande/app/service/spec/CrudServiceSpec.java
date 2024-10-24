package pe.edu.vallegrande.app.service.spec;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface CrudServiceSpec<T> {
	
	List<T> getActive();
	
	List<T> getInactive();
	
	T getForId(String id);
	
	List<T> get(String search);
	
	void insert(T bean);
	
	void update(T bean);
	
	void removed(String id);
	
	void restore(String id);
	
	void delete(String id);
	
	T mapRow(ResultSet rs) throws SQLException;

}
