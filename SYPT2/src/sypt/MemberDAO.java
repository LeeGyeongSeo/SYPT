package sypt;

import java.sql.*;

public class MemberDAO {

	// 회원가입
	public boolean insertMemInfo(Member member) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into member(id_mem, password, name_mem, gender, birthday, register_date, uuid) values(?,?,?,?,?,?,?)";
		try {
			conn = DBManager.getRemoteConnection();
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
			DBManager.close(conn, pstmt);
		}
		return true;
	}

	// 이메일 중복 확인
	public boolean IDcheck(String id_mem) throws SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id_mem, auth_state from member where id_mem=?";
		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (id_mem.equals(rs.getString("id_mem")) && rs.getInt("auth_state") == 1) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return false;
	}

	// 이메일 전송할 때 해당 이메일(id_mem)에 해당하는 uuid 불러와서 링크 보낼거임.
	public String findUuid(String id_mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select uuid from member where id_mem=?";
		String resUuid = "";
		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id_mem);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resUuid = rs.getString("uuid");
				System.out.println("uuid=" + resUuid);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return resUuid;
	}

	// 이메일 인증 완료 - joinComplete.jsp
	public boolean checkAuthentication(Member member) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "update member set auth_state=1 where uuid=?";
		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUuid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBManager.close(conn, pstmt);
		}
		return true;
	}

	// 로그인할 때, auth_state=1인지 확인하고!!!!! id, pw 매치
	public int login(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		String userpw = "";
		String sql = "select password, auth_state from member where id_mem = ?";

		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt("auth_state") == 1 && rs.getString("password").equals(pw)) {
					x = 1;
					break;
				} else
					x = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return x;
	}

	// 아이디(이메일) 입력했을 때 사용자 정보 불러오기
	public Member loadMemInfo(String id_mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id_mem=?";
		Member mem = new Member();
		try {
			conn = DBManager.getRemoteConnection();
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
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mem;
	}
	
	
	//마이페이지-비밀번호 수정
	public int changeMemPassword(String newPassword, String id_mem, String oldPassword) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int x = -1;
		String sql = "update member set password=? where id_mem=? and password=?";
		try {
			conn = DBManager.getRemoteConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, id_mem);
			pstmt.setString(3, oldPassword);
			if(pstmt.executeUpdate() == 0){
				x = 0;
			} else{
				x = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return x;
	}
}
