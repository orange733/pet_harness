package util; 
import java.sql.Connection; 
import java.sql.DriverManager;

public class DatabaseUtil { 
	public static Connection getConnection() {
		//�����ͺ��̽��� ������� ���� 
		try { 
			String dbURL = "jdbc:mysql://localhost:3306/chatdb"; 
			String dbID = "root"; 
			String dbPassword = "root"; 
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			return DriverManager.getConnection(dbURL, dbID, dbPassword); } 
		catch (Exception e) { e.printStackTrace(); } 
		return null; 
		} 
	}

