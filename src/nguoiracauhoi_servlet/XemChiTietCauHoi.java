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
 * Servlet implementation class XemChiTietCauHoi
 */
@WebServlet("/XemChiTietCauHoi")
public class XemChiTietCauHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XemChiTietCauHoi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int MaCau = Integer.parseInt(request.getParameter("id")) ;
		String error = null;
		Map<String, String> map = new LinkedHashMap<String,String>();
		try {
			Database db = new Database();
			ResultSet rs = db.getData(" select * from ChiTietCauHoiChinhSua_Vieww where MaCauHoi = '"+MaCau+"' ");
			while(rs.next()){
				map.put("MaCauHoi", rs.getString("MaCauHoi"));
				map.put("NoiDung", rs.getString("NoiDung"));
				map.put("CauA", rs.getString("CauA"));
				map.put("CauB", rs.getString("CauB"));
				map.put("CauC", rs.getString("CauC"));
				map.put("CauD", rs.getString("CauD"));
				map.put("DapAn", rs.getString("DapAn"));
				map.put("TenMon", rs.getString("TenMon"));
				map.put("MaMucDo", rs.getString("MaMucDo"));
				map.put("TenChuDe", rs.getString("TenChuDe"));
				map.put("MaChuDe", rs.getString("MaChuDe"));
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			error = e.getMessage();
		}
	}

}
