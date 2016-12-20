package sinhvien_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class DiemDanhDaThi
 */
@WebServlet("/DiemDanhDaThi_LuuDiemSo")
public class DiemDanhDaThi_LuuDiemSo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiemDanhDaThi_LuuDiemSo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String MaDe = request.getParameter("txtMaDeDiemDanh");
		String MaTK = request.getParameter("txtMaTKDiemDanh");
		String TenPhong =request.getParameter("txtTenPhongDiemDanh");
		String MaHocPhan = request.getParameter("txtMaHPKetQua");
		
		float KQThi = Float.parseFloat(request.getParameter("txtDiemSo"));
		Database db = new Database();
		
		try {
			db.updateData("insert into SinhVienDaThi (MaTK,MaDe,NgayThi,PhongThi) values "
					+ "('"+MaTK+"','"+MaDe+"',curdate(),'"+TenPhong+"') ");
			
			db.updateData("insert into ketquathi (KetQua,MaHocPhan,MaTK,NgayTao,MaDe) values "
					+ "("+KQThi+",'"+MaHocPhan+"','"+MaTK+"',current_timestamp() ,'"+MaDe+"' )");
			response.sendRedirect("sinhvien.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
