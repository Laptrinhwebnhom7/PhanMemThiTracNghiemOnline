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
@WebServlet("/SuaTaiKhoan")
@MultipartConfig(maxFileSize = 16177215)
public class SuaTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection conn = null;
	private final String driver = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/qlthionline";
	private final String user = "root";
	private final String password = "trungdung29";

	public SuaTaiKhoan() {
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
		Part fileHinhAnh = request.getPart("fileHinhAnhSua");
		InputStream inputHinhAnh = null;
		String Quyen = request.getParameter("selQuyenSinhVienCS");
		String MaTK = request.getParameter("txtMaTVSua");
		String TenTK = request.getParameter("txtTenTVSua");
		String NgaySinh = request.getParameter("txtNgaySinhSua");
		String tempGioiTinh = request.getParameter("txtGioiTinhSua");
		boolean GioiTinh;
		if (tempGioiTinh.equals("1")) {
			GioiTinh = true;
		} else {
			GioiTinh = false;
		}
		String DanToc = request.getParameter("txtDanTocSua");
		String CMND = request.getParameter("txtCMNDSua");
		String Email = request.getParameter("txtEmailSua");
		String SDT = request.getParameter("txtSDTSua");
		String DiaChi = request.getParameter("txtDiaChiSua");
		int MaTP = Integer.parseInt(request.getParameter("txtThanhPhoSua"));
		int MaQG = Integer.parseInt(request.getParameter("txtQuocGiaSua"));
		String MaKhoa = request.getParameter("txtMaKhoaSua");
		String MaChucVu = request.getParameter("txtMaChucVuSua");
		String MaLop = request.getParameter("txtMaLopHocSua");
		if (MaLop.trim().equals("")) {
			MaLop = "-1";
		}
		int TTHocVan = Integer.parseInt(request.getParameter("txtTinhTrangHVSua"));
		int LoaiCongViec = Integer.parseInt(request.getParameter("txtLoaiCongViecSua"));
		int TTCongViec = Integer.parseInt(request.getParameter("txtTinhTrangCVSua"));
		String MatKhau = request.getParameter("txtMatKhauSua");
		
	/*	System.out.println(Quyen);
		//System.out.println(MaTK);
		System.out.println(TenTK);
		System.out.println(NgaySinh);
		System.out.println(GioiTinh);
		System.out.println(DanToc);
		System.out.println(CMND);
		System.out.println(Email);
		System.out.println(SDT);
		System.out.println(DiaChi);
		System.out.println(MaTP);
		System.out.println(MaQG);
		System.out.println(MaKhoa);
		System.out.println(MaChucVu);
		System.out.println(MaLop);
		System.out.println(TTHocVan);
		System.out.println(LoaiCongViec );
		System.out.println(TTCongViec);
		System.out.println(MatKhau);*/
		
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
			String sql=null;
			if(fileHinhAnh !=null){
				sql = "update nguoidung set TenNguoiDung = ?,NgaySinh = ?, GioiTinh = ?,"
						+ " DanToc = ?, SoCMND = ?, DiaChi = ?, HinhAnh= ?,MaLop ='"+MaLop+"',MaChucVu='"+MaChucVu+"',"
						+ "MaQuyen='"+Quyen+"',MatKhau='"+MatKhau+"',Email ='"+Email+"',SDT='"+SDT+"',MaTinhTrangCV='"+TTCongViec+"',"
						+ "MaTinhTrangHV='"+TTHocVan+"',MaLoaiCV ='"+LoaiCongViec+"',MaKhoa ='"+MaKhoa+"',MaTP = '"+MaTP+"',MaQG='"+MaQG+"' "
								+ " where MaTK ='"+MaTK+"' ";
				PreparedStatement sta = (PreparedStatement) conn.prepareStatement(sql);
				sta.setString(1, TenTK);
				sta.setString(2, NgaySinh);
				sta.setBoolean (3, GioiTinh);
				sta.setString(4, DanToc);
				sta.setString(5, CMND);
				sta.setString(6, DiaChi);
				sta.setBlob(7, inputHinhAnh);
				sta.executeUpdate();
			}
			else{
				sql = "update nguoidung set TenNguoiDung = ?,NgaySinh = ?, GioiTinh = ?,"
						+ " DanToc = ?, SoCMND = ?, DiaChi = ?,MaLop ='"+MaLop+"',MaChucVu='"+MaChucVu+"',"
						+ "MaQuyen='"+Quyen+"',MatKhau='"+MatKhau+"',Email ='"+Email+"',SDT='"+SDT+"',MaTinhTrangCV='"+TTCongViec+"',"
						+ "MaTinhTrangHV='"+TTHocVan+"',MaLoaiCV ='"+LoaiCongViec+"',MaKhoa ='"+MaKhoa+"',MaTP = '"+MaTP+"',MaQG='"+MaQG+"' "
								+ " where MaTK ='"+MaTK+"' ";
				PreparedStatement sta = (PreparedStatement) conn.prepareStatement(sql);
				sta.setString(1, TenTK);
				sta.setString(2, NgaySinh);
				sta.setBoolean (3, GioiTinh);
				sta.setString(4, DanToc);
				sta.setString(5, CMND);
				sta.setString(6, DiaChi);
				sta.executeUpdate();
			}
			//String sql = "INSERT INTO HinhAnh (fileHinh) values (?)";
			
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
