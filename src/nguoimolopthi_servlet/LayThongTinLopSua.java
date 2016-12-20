package nguoimolopthi_servlet;

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
 * Servlet implementation class LayThongTinLopSua
 */
@WebServlet("/LayThongTinLopSua")
public class LayThongTinLopSua extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayThongTinLopSua() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id")) ;
		Database db = new Database();
		Map<String, String> map = new LinkedHashMap<String, String>();
		ResultSet rs = null;
		try {
			rs = db.getData("select * from Thi where id = '" + id + "' ");
			while (rs.next()) {
				map.put("TenPhong", rs.getString("TenPhong"));
				map.put("MaDe", rs.getString("MaDe"));
				map.put("NgayThi", rs.getString("NgayThi"));
				map.put("GioBatDau", rs.getString("GioBatDau"));
				map.put("GioKetThuc", rs.getString("GioKetThuc"));
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
