package nguoimolopthi_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class ThemThongBao
 */
@WebServlet("/ThemThongBao")
public class ThemThongBao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemThongBao() {
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
		String TieuDe = request.getParameter("txttieude");
		String MaNguoiGui = request.getParameter("txtMaNguoiGui");
		String NoiDungTB = request.getParameter("txtnoidung");
		String MaHocPhan = request.getParameter("txtLopTB");
	/*	System.out.println(TieuDe);
		System.out.println(MaNguoiGui);
		System.out.println(NoiDungTB);
		System.out.println(MaHocPhan);*/
		Database db = new Database();
		ResultSet rs  = null;
		int MaTB;
		try {
			db.updateData("insert into ThongBao(TieuDe,MaNguoiGui,ThoiGian,NoiDungTB) values ('"+TieuDe+"','"+MaNguoiGui+"',current_timestamp(),'"+NoiDungTB+"'); ");
			
			rs = db.getData("select MaTB from ThongBao order by ThoiGian desc limit 1");
			while(rs.next()){
				 MaTB = rs.getInt("MaTB");
				 db.updateData("insert into chitietthongbao(MaTB,MaHocPhan) values ("+MaTB+",'"+MaHocPhan+"');");
			}
			response.sendRedirect("quantrikythi.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
