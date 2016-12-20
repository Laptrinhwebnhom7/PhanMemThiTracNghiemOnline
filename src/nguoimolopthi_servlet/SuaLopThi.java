package nguoimolopthi_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class SuaLopThi
 */
@WebServlet("/SuaLopThi")
public class SuaLopThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaLopThi() {
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
		int id = Integer.parseInt(request.getParameter("idLopThi"));
		String MaDe = request.getParameter("MaDeThiChinhSua");
		String TenPhong = request.getParameter("Name_NhapTenPhongThiChinhSua");
		String NgayThi = request.getParameter("NhapNgayThiChinhSua");
		String GioThi = request.getParameter("NhapGioBatDauThiChinhSua");
		String GioKetThuc = request.getParameter("NhapGioKetThucThiChinhSua");
		Database db = new Database();
		
		try {
			db.updateData("update Thi set TenPhong='"+TenPhong+"', MaDe='"+MaDe+"', NgayThi='"+NgayThi+"',"
					+ " GioBatDau='"+GioThi+"', GioKetThuc='"+GioKetThuc+"' where id = "+id+" ");
			response.sendRedirect("quantrikythi.jsp");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
