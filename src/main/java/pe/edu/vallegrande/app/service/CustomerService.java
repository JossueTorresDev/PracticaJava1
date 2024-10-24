package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Customers;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;

public class CustomerService implements CrudServiceSpec<Customers> {

	@Override
	public List<Customers> getActive() {
		List<Customers>lista=new ArrayList<>();
		Connection cn;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM customers WHERE active='A'";
			pstm = cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Customers bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (Exception e) {
		}
		return lista;
	}

	@Override
	public List<Customers> getInactive() {
		List<Customers>lista=new ArrayList<>();
		Connection cn;
		PreparedStatement pstm;
		ResultSet rs;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM customers WHERE active='I'";
			pstm = cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Customers bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (Exception e) {
		}
		return lista;
	}

	@Override
	public Customers getForId(String id) {
		Connection cn;
		PreparedStatement pstm;
		ResultSet rs;
		Customers bean = null;
		String sql;
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM customers WHERE id=?";
			pstm = cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(id));
			rs=pstm.executeQuery();
			if(rs.next()) {
				bean = mapRow(rs);
			}
		} catch (Exception e) {
		}
		return bean;
	}

	@Override
	public List<Customers> get(String search) {
		List<Customers>lista=new ArrayList<>();
		Connection cn;
		PreparedStatement pstm;
		ResultSet rs;
		String sql, buscar;
		buscar = "%"+UtilService.setStringVacio(search)+"%";
		try {
			cn = AccesoDB.getConnection();
			sql = "SELECT * FROM customers WHERE active='A' AND (cellphone LIKE ? OR email LIKE ? OR document_number LIKE ? OR document_type LIKE ? OR last_name LIKE ? OR names LIKE ?)";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, buscar);
			pstm.setString(2, buscar);
			pstm.setString(3, buscar);
			pstm.setString(4, buscar);
			pstm.setString(5, buscar);
			pstm.setString(6, buscar);
			rs=pstm.executeQuery();
			while(rs.next()) {
				Customers bean = mapRow(rs);
				lista.add(bean);
			}
		} catch (Exception e) {
		}
		return lista;
	}

	@Override
	public void insert(Customers bean) {
		Connection cn;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql="INSERT INTO customers(names,last_name,document_type,document_number,email,cellphone) VALUES(?,?,?,?,?,?)";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getDocType());
			pstm.setString(4, bean.getDocNum());
			pstm.setString(5, bean.getEmail());
			pstm.setString(6, bean.getCell());
			filas=pstm.executeUpdate();
			if(filas!=1) {
				throw new SQLException("Error al insertar los datos del cliente.");
			}
			cn.commit();
		} catch (Exception e) {
		}
	}

	@Override
	public void update(Customers bean) {
		Connection cn;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql="UPDATE customers SET names=?,last_name=?,document_type=?,document_number=?,email=?,cellphone=? WHERE id=?";
			pstm=cn.prepareStatement(sql);
			pstm.setString(1, bean.getNames());
			pstm.setString(2, bean.getLastName());
			pstm.setString(3, bean.getDocType());
			pstm.setString(4, bean.getDocNum());
			pstm.setString(5, bean.getEmail());
			pstm.setString(6, bean.getCell());
			pstm.setInt(7, bean.getId());
			filas=pstm.executeUpdate();
			if(filas!=1) {
				throw new SQLException("Error al actualizar el cliente.");
			}
			cn.commit();
		} catch (Exception e) {
		}
	}

	@Override
	public void removed(String id) {
		Connection cn;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql="UPDATE customers SET active='I' WHERE id=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(id));
			filas=pstm.executeUpdate();
			if(filas!=1) {
				throw new SQLException("Error al actualizar el cliente.");
			}
			cn.commit();
		} catch (Exception e) {
		}
	}

	@Override
	public void restore(String id) {
		Connection cn;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql="UPDATE customers SET active='A' WHERE id=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(id));
			filas=pstm.executeUpdate();
			if(filas!=1) {
				throw new SQLException("Error al actualizar el cliente.");
			}
			cn.commit();
		} catch (Exception e) {
		}
	}

	@Override
	public void delete(String id) {
		Connection cn;
		PreparedStatement pstm;
		String sql;
		int filas;
		try {
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false);
			sql="DELETE FROM customers WHERE id=?";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, Integer.parseInt(id));
			filas=pstm.executeUpdate();
			if(filas!=1) {
				throw new SQLException("Error al actualizar el cliente.");
			}
			cn.commit();
		} catch (Exception e) {
		}
	}

	@Override
	public Customers mapRow(ResultSet rs) throws SQLException {
		Customers bean = new Customers();
		bean.setId(rs.getInt("id"));
		bean.setNames(rs.getString("names"));
		bean.setLastName(rs.getString("last_name"));
		bean.setDocType(rs.getString("document_type"));
		bean.setDocNum(rs.getString("document_number"));
		bean.setEmail(rs.getString("email"));
		bean.setCell(rs.getString("cellphone"));
		bean.setStatus(rs.getString("active"));
		return bean;
	}

}
