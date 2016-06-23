package sypt;

import java.sql.*;
import java.util.ArrayList;
import java.util.UUID;

import javax.print.DocFlavor.READER;

public class MemberBean {

	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/sypt";
	ResultSet rs = null;

	public MemberBean() {
	}

	public void connect() throws SQLException {

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			System.out.println("연결 성공");
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 회원가입
	public boolean insertMemInfo(Member member) throws SQLException {
		// disconnect();
		connect();
		String sql = "insert into member(id_mem, password, name_mem, gender, birthday, register_date, uuid) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId_mem());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName_mem());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirthday());
			pstmt.setString(6, member.getRdate());
			pstmt.setString(7, member.getUuid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 이메일 중복 확인
	public boolean IDcheck(String id_mem) throws SQLException {
		try {
			connect();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select id_mem, auth_state from member where id_mem=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (id_mem.equals(rs.getString("id_mem")) && rs.getInt("auth_state") == 1) {
					disconnect();
					return true;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return false;
	}

	// 이메일 전송할 때 해당 이메일(id_mem)에 해당하는 uuid 불러와서 링크 보낼거임.
	public String findUuid(String id_mem) {
		try {
			connect();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select uuid from member where id_mem=?";
		String resUuid = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resUuid = rs.getString("uuid");
				System.out.println("uuid=" + resUuid);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return resUuid;
	}

	// 이메일 인증 완료 - joinComplete.jsp
	public boolean checkAuthentication(Member member) throws SQLException {
		connect();
		String sql = "update member set auth_state=1 where uuid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUuid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 로그인할 때, auth_state=1인지 확인하고!!!!! id, pw 매치
	public int login(String id, String pw) throws SQLException{
		connect();
		int x = -1;
		String userpw = "";
		String sql = "select password, auth_state from member where id_mem = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getInt("auth_state") == 1 && rs.getString("password").equals(pw)){
					x = 1;
					break;
				} else
					x = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return x;
	}

	//아이디(이메일) 입력했을 때 사용자 정보 불러오기. 마이페이지 등에서 사용
	public Member loadMemInfo(String id_mem) {
		try {
			connect();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		String sql = "select * from member where id_mem=?";
		Member mem = new Member();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mem.setName_mem(rs.getString("name_mem"));
				mem.setBirthday(rs.getString("birthday"));
				mem.setGender(rs.getString("gender"));
				mem.setRdate(rs.getString("register_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return mem;
	}
}