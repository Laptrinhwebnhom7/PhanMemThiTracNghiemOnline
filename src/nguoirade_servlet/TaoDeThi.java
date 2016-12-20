package nguoirade_servlet;

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
 * Servlet implementation class TaoDeThi
 */
@WebServlet("/TaoDeThi")
public class TaoDeThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaoDeThi() {
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
		String MaDe = request.getParameter("Name_TenDeChinh");
		int TongSoCau = Integer.parseInt(request.getParameter("selTongSoCauHoi"));
		int ThoiGian = Integer.parseInt(request.getParameter("selThoiGian"));
		int SoLuongPS = Integer.parseInt(request.getParameter("Name_SoLuongMaDeThi"));
		String MaMon = request.getParameter("selChonMon");
		
		int ChonCD1 = Integer.parseInt(request.getParameter("ChonCD1")) ;
		int ChonCD2 = Integer.parseInt(request.getParameter("ChonCD2")) ;
		int ChonCD3 = Integer.parseInt(request.getParameter("ChonCD3")) ;

		
		String ChonMD1 = request.getParameter("ChonMD1");
		String ChonMD2 = request.getParameter("ChonMD2");
		String ChonMD3 = request.getParameter("ChonMD3");

		
		int ChonSC1 = Integer.parseInt( request.getParameter("choSC1"));
		int ChonSC2 = Integer.parseInt( request.getParameter("choSC2"));
		int ChonSC3 = Integer.parseInt( request.getParameter("choSC3"));

		int MaCau;
		Database db = new Database();
		ResultSet rs=null;
		String []ds =  request.getParameterValues("selDanhSachLop");
		String MaHocPhan =null;
		try {
			db.updateData("insert into dethi values('" + MaDe + "'," + TongSoCau + "," + ThoiGian + "," + SoLuongPS
					+ ",current_timestamp(),'" + MaMon + "') ");
		
			rs = db.getData("(select MaCauHoi from cauhoi where machude = "+ChonCD1+" and mamucdo= '"+ChonMD1+"' order by rand() limit "+ChonSC1+")  union all "
					+ "(select MaCauHoi from cauhoi where machude = "+ChonCD2+" and mamucdo='"+ChonMD2+"' order by rand() limit "+ChonSC2+") union all "
					+ "(select MaCauHoi from cauhoi where machude = "+ChonCD3+" and mamucdo= '"+ChonMD3+"'  order by rand() limit "+ChonSC3+")");
			
			while (rs.next()) {
				MaCau = rs.getInt("MaCauHoi");
				db.updateData(" insert into chitietdethi(MaCauHoi,MaDe) values (" + MaCau + ",'" + MaDe + "')");
			}
			
			if (ds != null) {
				for (int i = 0; i < ds.length; i++) {
					MaHocPhan = ds[i];
					db.updateData("insert into chitietlophoc_dethi(MaDe,MaHocPhan) values ('" + MaDe + "','"
							+ MaHocPhan + "')");
				}
			}
			
			response.sendRedirect("quantridethi.jsp");

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
