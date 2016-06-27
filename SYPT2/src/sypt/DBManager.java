package sypt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class DBManager {

	private static Connection conn = null;
	private DBManager(){}
	
	public static Connection getRemoteConnection() {
	    if (System.getProperty("RDS_HOSTNAME") != null) {
	      try {
	      Class.forName("com.mysql.jdbc.Driver");
	      String dbName = System.getProperty("RDS_DB_NAME");
	      String userName = System.getProperty("RDS_USERNAME");
	      String password = System.getProperty("RDS_PASSWORD");
	      String hostname = System.getProperty("RDS_HOSTNAME");
	      String port = System.getProperty("RDS_PORT");
	      String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName;
	      //+ "?user=" + userName + "&password=" + password;
	      //logger.trace("Getting remote connection with connection string from environment variables.");
	      //conn = DriverManager.getConnection(jdbcUrl);
	      conn = DriverManager.getConnection(jdbcUrl, userName, password);
	      System.out.println("Remote Connection successful.");
	      
	      return conn;
	    }
	    catch (ClassNotFoundException e) { e.printStackTrace();}
	    catch (SQLException e) { e.printStackTrace();}
	    }
	    return null;
	  }
	
	//select 수행 후 리소스 해제
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs){
		try{
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//Override - DML(데이터 조작) 수행 후 리소스 해제
    public static void close(Connection conn, PreparedStatement pstmt){
        try{
            pstmt.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }


	
}
