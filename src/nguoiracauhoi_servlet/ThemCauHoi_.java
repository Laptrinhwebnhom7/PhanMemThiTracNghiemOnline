package nguoiracauhoi_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class ThemCauHoi_
 */
@WebServlet("/ThemCauHoi_")
public class ThemCauHoi_ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemCauHoi_() {
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
		String NoiDung = request.getParameter("Name_NoiDungCauHoi");
		String CauA = request.getParameter("Name_NhapCauA");
		String CauB = request.getParameter("Name_NhapCauB");
		String CauC = request.getParameter("Name_NhapCauC");
		String CauD = request.getParameter("Name_NhapCauD");
		String DapAn = request.getParameter("DapAn");
		String MaMucDo = request.getParameter("MucDo");
		int MaChuDe = Integer.parseInt(request.getParameter("ChuDe")) ;
		Database db = new 	Database();
		try {
			int i = db.updateData("insert into CauHoi(NoiDung,CauA,CauB,CauC,CauD,DapAn,NgayRa,MaMucDo,MaChuDe) "
					+ "values ('"+NoiDung+"','"+CauA+"','"+CauB+"','"+CauC+"','"+CauD+"','"+DapAn+"',CURDATE(),'"+MaMucDo+"','"+MaChuDe+"')");
			if(i>0){
				//request.setAttribute("themtungcau", i);
				response.sendRedirect("quantringanhangcauhoi.jsp");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
	}

}
