package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			 String dbURL = "jdbc:mysql://localhost:3306/ongviking?characterEncoding=UTF-8&serverTimezone=UTC";
			 String dbID = "ongviking";
			 String dbPassword = "borabora00@";
			 Class.forName("com.mysql.cj.jdbc.Driver"); 
			 conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstm = conn.prepareStatement(SQL);
			pstm.setString(1, userID);
			rs = pstm.executeQuery(); 
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				} else {
					return 0; 
				}
			}
			return -1; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
			pstm = conn.prepareStatement(SQL);
			pstm.setString(1, user.getUserID());
			pstm.setString(2, user.getUserPassword());
			pstm.setString(3, user.getUserName());
			pstm.setString(4, user.getUserGender());
			pstm.setString(5, user.getUserEmail());
			return pstm.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}

}
