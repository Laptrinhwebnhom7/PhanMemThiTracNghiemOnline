package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Database {
	private Connection conn =null;
	private final String driver ="com.mysql.jdbc.Driver" ;
	private final String url = "jdbc:mysql://localhost:3306/qlthionline?useUnicode=true&characterEncoding=UTF-8";
	private final String user = "root";
	private final String password = "trungdung29";
	
	
	
	public int updateData(String sql) throws ClassNotFoundException, SQLException{
		int result =0;
		openConnect();
		Statement sta = conn.createStatement();
		result = sta.executeUpdate(sql);
		closeConnect();
		return result;
	}
	
	public ResultSet getData(String sql) throws SQLException, ClassNotFoundException{
		ResultSet rs = null;
		openConnect();
		Statement sta = conn.createStatement();
		rs = sta.executeQuery(sql);
		return rs;
	}
	
	public void openConnect() throws ClassNotFoundException, SQLException{
		
		try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void closeConnect() throws SQLException{
		if(conn != null && !conn.isClosed()){
			conn.close();
		}
	}
	/*public static void main(String[] args) {
		Database db = new Database();
		ResultSet rs = null;
		try {
			rs= db.getData("select * from nguoidung where MaTK ='14110029' ");
			while(rs.next())
			{
				System.out.println("ok");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
}
