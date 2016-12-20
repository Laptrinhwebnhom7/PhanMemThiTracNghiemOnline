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
 * Servlet implementation class XoaCauHoi
 */
@WebServlet("/XoaCauHoi")
public class XoaCauHoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaCauHoi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int MaCauHoi = Integer.parseInt(request.getParameter("id"));
		Database db  = new Database();
		String error = null;
		try {
			db.updateData("delete from CauHoi where MaCauHoi = '"+MaCauHoi+"' ");
			response.sendRedirect("quantringanhangcauhoi.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			error = e.getMessage();
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	
	}

}
