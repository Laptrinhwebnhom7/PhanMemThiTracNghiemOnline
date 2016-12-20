package sinhvien_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

/**
 * Servlet implementation class MoBaiThi
 */
@WebServlet("/MoBaiThi")
public class MoBaiThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoBaiThi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String TenPhong = request.getParameter("txtPhongThi");
		String MaTK = request.getParameter("txtMaTKKT");
		String MaDe = request.getParameter("txtMaDeVaoThi");
		Database db = new Database();

		ResultSet rs = null;
		try {
			rs = db.getData("select * from ThongTinPhongThi_view where MaTK='"+MaTK+"' and TenPhong='"+TenPhong+"' and MaDe='"+MaDe+"' "
					+ "and curdate()=NgayThi and current_time() between GioBatDau and GioKetThuc;");
			while(rs.next()){
				HttpSession sess = request.getSession();
				sess.setAttribute("madeKT",  rs.getString("MaDe"));
				sess.setAttribute("MaTK", rs.getString("MaTK"));
				sess.setAttribute("TenPhong", rs.getString("TenPhong"));
				sess.setAttribute("GioBatDau", rs.getString("GioBatDau"));
				sess.setAttribute("GioKetThuc", rs.getString("GioKetThuc"));
				sess.setAttribute("TenMon", rs.getString("TenMon"));
				sess.setAttribute("NgayThi", rs.getString("NgayThi"));
				sess.setAttribute("TenNguoiDung", rs.getString("TenNguoiDung"));
				sess.setAttribute("MaHocPhan", rs.getString("MaHocPhan"));
				
				/*request.setAttribute("madeKT", rs.getString("MaDe"))*/;
			}
			response.sendRedirect("lambaithi.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
