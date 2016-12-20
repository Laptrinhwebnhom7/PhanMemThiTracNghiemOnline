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
 * Servlet implementation class LoadChuDeTheoTenMon
 */
@WebServlet("/LoadChuDeTheoTenMon")
public class LoadChuDeTheoTenMon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadChuDeTheoTenMon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String TenMon = request.getParameter("TenMon").trim();
		Database db = new Database();
		ResultSet rs = null;
		Map<String, String> map = new LinkedHashMap<String,String>();
		try {
			rs = db.getData("select MaChuDe,TenChuDe from MonHoc inner join	ChuDe on MonHoc.MaMon = ChuDe.MaMon where TenMon like '"+TenMon+"' ");
			while(rs.next()){
				map.put(rs.getString("MaChuDe"), rs.getString("TenChuDe"));
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
