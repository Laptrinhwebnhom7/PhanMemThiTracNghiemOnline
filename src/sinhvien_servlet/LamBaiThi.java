package sinhvien_servlet;

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
 * Servlet implementation class LamBaiThi
 */
@WebServlet("/LamBaiThi")
public class LamBaiThi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LamBaiThi() {
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
		String CauChon =request.getParameter("CauChon");
		int MaCauHoi =Integer.parseInt(request.getParameter("MaCauHoi"));
		String MaDe = request.getParameter("MaDe");
		String MaTK = request.getParameter("MaTK");
		ResultSet rs = null;
		Database db  = new Database();
		int id=0;
		try {
			rs = db.getData("select * from ChiTietLamBaiThi where MaTK ='"+MaTK+"' and MaCauHoi="+MaCauHoi+" and CauChon='"+CauChon+"' "
					+ "and MaDe='"+MaDe+"' ");
			if(rs.next()){
				id = Integer.parseInt(rs.getString("id"));
				db.updateData("delete from ChiTietLamBaiThi where id ="+id+" ");
			}
			else{
				rs = db.getData("select * from ChiTietLamBaiThi where MaTK ='"+MaTK+"' and MaCauHoi="+MaCauHoi+" and MaDe='"+MaDe+"' ");
				if(rs.next()){
					id = Integer.parseInt(rs.getString("id"));
					db.updateData("update ChiTietLamBaiThi set CauChon ='"+CauChon+"' where id ="+id+" ");
				}
				else{
					db.updateData("insert into ChiTietLamBaiThi(MaCauHoi,CauChon,MaDe,MaTK) values ("+MaCauHoi+",'"+CauChon+"','"+MaDe+"','"+MaTK+"')");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
