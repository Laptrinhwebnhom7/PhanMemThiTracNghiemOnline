package sinhvien_servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

/**
 * Servlet implementation class LayHinhAnh
 */
@WebServlet("/LoadHinhAnh")
public class LoadHinhAnh extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadHinhAnh() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ResultSet rs = null;
		// gets session User
		String MaTK = request.getParameter("id");
		Database db = new Database();
		java.sql.Blob HinhAnh = null;
		ServletOutputStream out = response.getOutputStream();
		
		try {
			rs= db.getData("select HinhAnh from nguoidung where MaTK ='"+MaTK+"' ");
			if (rs.next()) {
				HinhAnh = rs.getBlob(1);
			} else {
				response.setContentType("text/html");
				out.println("<html><head><title>Person Photo</title></head>");
				out.println("<body><h1>No photo found for this user </h1></body></html>");
				return;
			}

			response.setContentType("image/jpg/png");
			InputStream in = HinhAnh.getBinaryStream();
			int length = (int) HinhAnh.length();

			int bufferSize = 1024;
			byte[] buffer = new byte[bufferSize];

			while ((length = in.read(buffer)) != -1) {
				/*System.out.println("writing " + length + " bytes");*/
				out.write(buffer, 0, length);
			}

			in.close();
			out.flush();
		} catch (SQLException e) {
			response.setContentType("text/html");
			out.println("<html><head><title>Error: Person Photo</title></head>");
			out.println("<body><h1>Error=" + e.getMessage() + "</h1></body></html>");
			return;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
