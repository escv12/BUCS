package ADMIN;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

import util.DatabaseUtil;

public class ADMINDAO {
	Connection conn = DatabaseUtil.getConnection();
	
	public int join(String ADMINID, String ADMINPWD) {
		String SQL = "INSERT INTO USER VALUE(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, ADMINID);
			pstmt.setString(2, ADMINPWD);
			
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
