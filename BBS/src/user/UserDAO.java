package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "inf1234";
			Class.forName("com.mysql.jdbc.Drivier");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // result set
			if (rs.next()) { // rs가 존재하다면
				if(rs.getString(1).equals(userPW)) {
					return 1; // 로그인 성공
				}
				else
					return 0; // 비밀 번호 불일치
			}
			return -1; // 아이디가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // database error
	}
}
