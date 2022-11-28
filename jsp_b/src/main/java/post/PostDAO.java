package post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.util.ArrayList;

import util.DatabaseUtil;

public class PostDAO {
	private ResultSet rs;
	Connection conn = DatabaseUtil.getConnection();
	
	public String getDate(String writeday) { //현재 시간 가져오는 함수
		String SQL = "SELECT NOW(?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
		
	}
	public int getNext() {
		String SQL = "SELECT ADMINID FROM POST ORDER BY ADMINID DESC"; //수정해야함
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int Write (String POSTTITLE, String POSTcontent) { // 게시판함수
		String SQL = "INSERT INTO POST VALUES(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1, getNext());
			pstmt.setString(2, POSTTITLE);
			pstmt.setString(3, POSTcontent);
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return -1;
	}

}
