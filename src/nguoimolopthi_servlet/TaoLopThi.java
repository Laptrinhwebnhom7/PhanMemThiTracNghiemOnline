package nguoimolopthi_servlet;

import java.io.IOException;
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
 * Servlet implementation class TaoLopThi
 */
@WebServlet("/TaoLopThi")
public class TaoLopThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaoLopThi() {
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
		String PhongThi = request.getParameter("Name_NhapTenPhongThi");
		String MaDe = request.getParameter("txtMaDeTao");
		String NgayThi = request.getParameter("NhapNgayThi");
		String GioThi = request.getParameter("NhapGioThi");
		String GioKetThuc = request.getParameter("NhapGioKetThuc");
		Database db = new Database();
		try {
			db.updateData("insert into Thi(TenPhong,MaDe,NgayThi, GioBatDau,GioKetThuc) "
					+ "values ('"+PhongThi+"','"+MaDe+"','"+NgayThi+"','"+GioThi+"','"+GioKetThuc+"'); ");
			
				response.sendRedirect("quantrikythi.jsp");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
