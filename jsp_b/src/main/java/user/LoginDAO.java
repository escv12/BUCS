package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import util.DatabaseUtil;

public class LoginDAO {
	private ResultSet rs;
	Connection conn = DatabaseUtil.getConnection();
	public int login(String userID, String userPWD ) {
		String SQL = "SELECT userPWD from user where userID =? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPWD)) {
					return 1; //로그인 성공
				}else
					return 0;
				}
			return -1;			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return -2;
	}		
}

/* <% UserDAO userDAO = new UserDAO(); 로그인 페이지에서 넘겨준 userid와 userpwd를 받아서 로그인 판별
int result = userDAO.login(user.getUserID(), user.getUserPassword());
if (result == 1){ // 로그인 정보가 맞으면 자바스크립트를 실행하여 페이지를 이동시킴
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'main.jsp'"); // main 페이지로 사용자를 보냄 
	script.println("</script>"); */