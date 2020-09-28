package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDao {
	
	private Connection conn;
	private ResultSet rs;
	
	public BbsDao() {
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
	
	public String getDate() {
		String Session = "SET @@session.time_zone = '-4:00'";
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement stmSession = conn.prepareStatement(Session); 
			stmSession.executeQuery();   			
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			rs = pstm.executeQuery();   
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; 
	}
	
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS order by bbsID DESC";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			rs = pstm.executeQuery();   
			if(rs.next()) {
				return rs.getInt(1)+1; 
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}

	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			pstm.setInt(1,  getNext());
			pstm.setString(2,  bbsTitle);			
			pstm.setString(3,  userID);			
			pstm.setString(4,  getDate());
			pstm.setString(5,  bbsContent);			
			pstm.setInt(6,  1);		
			return pstm.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	
	}
	
	public ArrayList<Bbs> getList(int pageNumber){
		String SQL = "SELECT * from BBS where bbsID < ? AND bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			pstm.setInt(1,  getNext() - (pageNumber -1 )*10);
			rs = pstm.executeQuery();   
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public boolean nextPage(int pageNumber) { 
		String SQL = "SELECT * from BBS where bbsID < ? AND bbsAvailable = 1 order by bbsID limit 10";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1,  getNext() - (pageNumber -1 )*10);
			rs = pstm.executeQuery();   
			while(rs.next()) {
				return true;
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;			
	}
	
	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * from BBS where bbsID = ?";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			pstm.setInt(1,  bbsID);
			rs = pstm.executeQuery();   
			if(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;					
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			pstm.setString(1,  bbsTitle);
			pstm.setString(2,  bbsContent);			
			pstm.setInt(3,  bbsID);			
			return pstm.executeUpdate(); 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 		
	}
	
	public int delete(int bbsID) {
		String SQL = "UPDATE BBS SET bbsAvailable = 0  WHERE bbsID = ?";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL); 
			pstm.setInt(1,  bbsID);
			return pstm.executeUpdate(); 

		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	
	}



}