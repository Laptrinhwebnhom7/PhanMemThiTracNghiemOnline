package nguoiracauhoi_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

import database.Database;


/**
 * Servlet implementation class Json_ThemCauHoi
 */
@WebServlet("/Json_Khoa_BoMon")
public class Json_Khoa_BoMon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Json_Khoa_BoMon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  int MaKhoa = Integer.parseInt(request.getParameter("MaKhoa"));
		  Map<String, String> map = new LinkedHashMap<String,String>();
		  Database db = new Database();
		  ResultSet rs = null;
		  try {
			rs = db.getData("select MaBoMon,TenBoMon from BoMon where MaKhoa ='"+MaKhoa+"'");
			
			if(MaKhoa ==-1){
				map.put("-1", "Chọn");
			}
			else{
				while(rs.next())
				{
					map.put(rs.getString("MaBoMon"), rs.getString("TenBoMon"));
				}
			}
			
			String json = null;

	          json = new Gson().toJson(map);
	          response.setContentType("application/json");
	          response.setCharacterEncoding("UTF-8");
	          response.getWriter().write(json);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}
}
