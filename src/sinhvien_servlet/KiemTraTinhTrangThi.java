package sinhvien_servlet;

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
 * Servlet implementation class KiemTraTinhTrangThi
 */
@WebServlet("/KiemTraTinhTrangThi")
public class KiemTraTinhTrangThi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KiemTraTinhTrangThi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String TenPhong = request.getParameter("PhongThi");
		String MaTK = request.getParameter("MaTK");
		Map<String, String> map = new LinkedHashMap<String, String>();
		ResultSet rs = null;
		Database db = new Database();
		String MaDe = null;
		try {
			rs = db.getData("select * from TinhTrangThi_view where MaTK='" + MaTK + "'and TenPhong='" + TenPhong + "' "
					+ "and curdate()=NgayThi and curtime() between GioBatDau and GioKetThuc limit 1;");
			if (rs.next()) {
				MaDe = rs.getString("MaDe");
				rs = db.getData(" select * from sinhviendathi where MaDe='"+MaDe+"' and MaTK ='"+MaTK+"' and NgayThi = curdate() and PhongThi='"+TenPhong+"' limit 1 ");
				if(rs.next()){
					map.put("kq", "1");
				}
				else{
					map.put("kq", MaTK);
					map.put("MaDe", MaDe);
				}
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
