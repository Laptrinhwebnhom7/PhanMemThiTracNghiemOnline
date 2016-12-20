package admin_servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class LuuHinhAnh
 */
@WebServlet("/ThemTaiKhoan")
@MultipartConfig(maxFileSize = 16177215)
public class ThemTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn = null;
	private final String driver = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/qlthionline";
	private final String user = "root";
	private final String password = "trungdung29";

	public ThemTaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Part fileHinhAnh = request.getPart("fileHinhAnh");
		InputStream inputHinhAnh = null;
		String Quyen = request.getParameter("txtQuyen");
		String MaTK = request.getParameter("txtMaTV");
		String TenTK = request.getParameter("txtTenTV");
		String NgaySinh = request.getParameter("txtNgaySinh");
		String tempGioiTinh = request.getParameter("txtGioiTinh");
		boolean GioiTinh;
		if (tempGioiTinh.equals("Nam")) {
			GioiTinh = true;
		} else {
			GioiTinh = false;
		}
		String DanToc = request.getParameter("txtDanToc");
		String CMND = request.getParameter("txtCMND");
		String Email = request.getParameter("txtEmail");
		String SDT = request.getParameter("txtSDT");
		String DiaChi = request.getParameter("txtDiaChi");
		int MaTP = Integer.parseInt(request.getParameter("txtThanhPho"));
		int MaQG = Integer.parseInt(request.getParameter("txtQuocGia"));
		String MaKhoa = request.getParameter("txtMaKhoa");
		String MaChucVu = request.getParameter("txtMaChucVu");
		String MaLop = request.getParameter("txtMaLopHoc");
		if (MaLop.trim().equals("")) {
			MaLop = "-1";
		}
		int TTHocVan = Integer.parseInt(request.getParameter("txtTinhTrangHV"));
		int LoaiCongViec = Integer.parseInt(request.getParameter("txtLoaiCongViec"));
		int TTCongViec = Integer.parseInt(request.getParameter("txtTinhTrangCV"));
		String MatKhau = request.getParameter("txtMatKhau");
		if (fileHinhAnh != null) {
			/*
			 * System.out.println(fileHinhAnh.getName());
			 * System.out.println(fileHinhAnh.getSize());
			 * System.out.println(fileHinhAnh.getContentType());
			 */
			inputHinhAnh = fileHinhAnh.getInputStream();
		}

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			String sql = "insert into nguoidung values (?,?,?,?,"
					+ " ?,?,?,?,'"+MaLop+"','"+MaChucVu+"','"+Quyen+"','"+MatKhau+"',"
					+ " '"+Email+"','"+SDT+"','"+TTCongViec+"','"+TTHocVan+"','"+LoaiCongViec+"','"+MaKhoa+"',current_timestamp(),'"+MaTP+"','"+MaQG+"');";
			/*String sql = "INSERT INTO HinhAnh (fileHinh) values (?)";*/
			PreparedStatement sta = (PreparedStatement) conn.prepareStatement(sql);
			sta.setString(1, MaTK);
			sta.setString(2, TenTK);
			sta.setString(3, NgaySinh);
			sta.setBoolean(4, GioiTinh);
			sta.setString(5, DanToc);
			sta.setString(6, CMND);
			sta.setString(7, DiaChi);
			sta.setBlob(8, inputHinhAnh);
			sta.executeUpdate();
			response.sendRedirect("admin.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Thất bại");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
