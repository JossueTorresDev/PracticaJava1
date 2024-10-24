package pe.edu.vallegrande.app.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoDB {
	
	private AccesoDB() {
	}
	
	public static Connection getConnection() throws SQLException {
		Connection cn = null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:14033;databaseName=dbBesahombre;encrypt=true;TrustServerCertificate=True;";
		String user = "sa";
		String pass = "MyPassword2024";
		try {
			Class.forName(driver).getDeclaredConstructor().newInstance();
			cn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			throw e;
		} catch (ClassNotFoundException e) {
			throw new SQLException("No se encontró el driver de la base de datos.");
		} catch (Exception e) {
			throw new SQLException("No se puede establecer la conexión con la BD.");
		}
		return cn;
	}
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Conexion ok.");
			cn.close();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}