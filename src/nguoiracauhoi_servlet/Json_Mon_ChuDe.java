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
 * Servlet implementation class Json_Mon_ChuDe
 */
@WebServlet("/Json_Mon_ChuDe")
public class Json_Mon_ChuDe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Json_Mon_ChuDe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MaMon = request.getParameter("MaMon");
		  Map<String, String> map = new LinkedHashMap<String,String>();
		  Database db = new Database();
		  String json = null;
		  ResultSet rs = null;
		  try {
			rs = db.getData("select MaChuDe,TenChuDe from ChuDe where MaMon ='"+MaMon+"'");
			if(MaMon.equals("-1")){
				map.put("-1", "Chọn");
			}else{
				while(rs.next())
				{
					map.put(rs.getString("MaChuDe"), rs.getString("TenChuDe"));
				}
			}
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
