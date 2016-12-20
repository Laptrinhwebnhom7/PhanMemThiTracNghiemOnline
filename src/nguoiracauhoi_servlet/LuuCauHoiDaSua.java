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
 * Servlet implementation class LuuCauHoiDaSua
 */
@WebServlet("/LuuCauHoiDaSua")
public class LuuCauHoiDaSua extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuuCauHoiDaSua() {
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
		int i =0;
		int MaCauHoi = Integer.parseInt(request.getParameter("MaCauChinhSua")); 
		int MaChuDe = Integer.parseInt(request.getParameter("ChuDeSua"));
		String MaMucDo = request.getParameter("MucDoChinhSua");
		String NoiDung = request.getParameter("Name_NoiDungCauHoiChinhSua");
		String CauA = request.getParameter("Name_NhapCauAChinhSua");
		String CauB = request.getParameter("Name_NhapCauBChinhSua");
		String CauC = request.getParameter("Name_NhapCauCChinhSua");
		String CauD = request.getParameter("Name_NhapCauDChinhSua");
		String DapAn = request.getParameter("selectDapAnChinhSua");
		Database db  = new Database();
		try {
			i = db.updateData("UPDATE cauhoi SET NoiDung = '"+NoiDung+"', "
					+ "CauA = '"+CauA+"', CauB = '"+CauB+"', CauC = '"+CauC+"', CauD = '"+CauD+"',DapAn = '"+DapAn+"',"
					+ "MaMucDo = '"+MaMucDo+"',MaChuDe = '"+MaChuDe+"' WHERE MaCauHoi = '"+MaCauHoi+"' ");
			if(i>0){
				request.setAttribute("Suacauhoi", i);
				response.sendRedirect("quantringanhangcauhoi.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
