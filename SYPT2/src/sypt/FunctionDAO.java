package sypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FunctionDAO {
	
	// 함수 찾기
	public ArrayList<Function> searchFunction(String name_func) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from function where name_func like ?";
		ArrayList<Function> funs = new ArrayList<Function>();
		
		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name_func+"%");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Function func = new Function();
				func.setName_func(rs.getString("name_func"));
				func.setKeyword(rs.getString("keyword"));
				func.setPath(rs.getString("path"));
				funs.add(func);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return funs;
	}
	
}
