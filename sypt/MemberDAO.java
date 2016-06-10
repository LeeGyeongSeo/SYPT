import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	public void getMember() // 회원 정보 가져옴.
	{
		try{
			
			/*String jdbc_url = "jdbc:mysql://localhost/mysql";
			Class.forName("com.mysql.jdbc.Driver");
			
			PreparedStatement pstmt = null;
			Connection conn = null;
			ResultSet rs = null;
		
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			
			String sql1 = "select * from membership where name_mem=?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, name_mem);
	
			rs = pstmt.executeQuery();
			if(rs.next())
			{
		
			}
			
			rs.close();
			pstmt.close();
			conn.close();*/
			
			
		}
		catch(Exception e)
		{
			System.err.println(e);
		}
	}
	
	public void postMember() // 회원 정보 등록.
	{
		
	}
	
	public void delMember() // 회원 정보 삭제.
	{
		
	}
}
