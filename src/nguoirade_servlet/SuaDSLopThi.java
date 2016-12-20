package nguoirade_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class SuaDSLopThi
 */
@WebServlet("/SuaDSLopThi")
public class SuaDSLopThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaDSLopThi() {
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
		int ThoiGian = Integer.parseInt(request.getParameter("selThoiGianSua")) ;
		String[] ds = null;
		String MaDe = request.getParameter("txtMaDeSua");
		ds = request.getParameterValues("selDanhSachLopSua");
		String MaHocPhan =null;
		Database db = new Database();
		if(ds!=null){
			try {
				db.updateData("update dethi  set ThoiGian = '"+ThoiGian+"' where MaDe = '"+MaDe+"' ");
				db.updateData("delete from chitietlophoc_dethi where MaDe ='"+MaDe+"' ");
				for (int i = 0; i < ds.length; i++) {
					MaHocPhan = ds[i];
					db.updateData("insert into chitietlophoc_dethi(MaDe,MaHocPhan) values('" + MaDe + "','" + MaHocPhan
							+ "')");
				}
				response.sendRedirect("quantridethi.jsp");
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
