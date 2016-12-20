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
 * Servlet implementation class XoaDeThi
 */
@WebServlet("/XoaDeThi")
public class XoaDeThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaDeThi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String MaDe = request.getParameter("id");
		Database  db = new Database();
		try {
			db.updateData("delete from Thi where MaDe ='"+MaDe+"' ");
			db.updateData("delete from chitietdethi where MaDe ='" + MaDe + "' ");
			db.updateData("delete from chitietlophoc_dethi where MaDe ='" + MaDe + "' ");
			db.updateData("delete from	dethi where MaDe ='"+MaDe+"' ");
			db.updateData("delete from ketquathi where MaDe ='"+MaDe+"' ");
			db.updateData("delete from chitietlambaithi where MaDe ='"+MaDe+"' ");
			db.updateData("delete from sinhviendathi where MaDe ='"+MaDe+"'");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("quantridethi.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
