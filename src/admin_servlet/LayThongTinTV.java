package admin_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import database.Database;

/**
 * Servlet implementation class LayThongTinTV
 */
@WebServlet("/LayThongTinTV")
public class LayThongTinTV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayThongTinTV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String MaTK = request.getParameter("MaTK");
		/*HttpSession session1 = request.getSession();
		session1.setAttribute("MaTaiKhoan",MaTK) ;*/
		Database db = new Database();
		ResultSet rs = null;
		Map<String, String> map = new LinkedHashMap<String, String>();
		try {
		
			rs=db.getData(" select * from nguoidung where MaTK ='"+MaTK+"' ");
			while(rs.next()){
				
				map.put("TenNguoiDung", rs.getString("TenNguoiDung"));
				map.put("NgaySinh", rs.getString("NgaySinh"));
				map.put("GioiTinh", rs.getString("GioiTinh"));
				map.put("DanToc", rs.getString("DanToc"));
				map.put("SoCMND", rs.getString("SoCMND"));
				map.put("DiaChi", rs.getString("DiaChi"));
				map.put("MaLop", rs.getString("MaLop"));
				map.put("MaChucVu", rs.getString("MaChucVu"));
				map.put("MaQuyen", rs.getString("MaQuyen"));
				map.put("MatKhau", rs.getString("MatKhau"));
				map.put("Email", rs.getString("Email"));
				map.put("SDT", rs.getString("SDT"));
				map.put("MaTinhTrangCV", rs.getString("MaTinhTrangCV"));
				map.put("MaTinhTrangHV", rs.getString("MaTinhTrangHV"));
				map.put("MaLoaiCV", rs.getString("MaLoaiCV"));
				map.put("MaKhoa", rs.getString("MaKhoa"));
				map.put("MaTP", rs.getString("MaTP"));
				map.put("MaQG", rs.getString("MaQG"));
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(new Gson().toJson(map));
			}
		
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
