package admin_servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class ThemTKBangFile
 */
@WebServlet("/ThemTKBangFile")
@MultipartConfig(maxFileSize = 16177215)
public class ThemTKBangFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemTKBangFile() {
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
		String filePart = request.getParameter ("fileThemTV");
		
		 try {
	/*		 String date;
		     String heure;
		     String parametre;
		     String valeur;
		     java.sql.PreparedStatement ps = null;
		     java.sql.Connection con = null;
		     ResultSet rs = null;*/

			 	BufferedReader br = new BufferedReader(new FileReader("D:/input.txt.txt"));
		 		
		String line = null;
		while((line=br.readLine()) != null){
		String tmp[]=line.split(",");
		
		String MaTK =tmp[0];
		String TenTK = tmp[1];
		String NgaySinh = tmp[2];
		String tempGioiTinh =tmp[3];
		boolean GioiTinh;
		if (tempGioiTinh.equals("Nam")) {
			GioiTinh = true;
		} else {
			GioiTinh = false;
		}
		String DanToc = tmp[4];
		String CMND = tmp[5];
		String DiaChi = tmp[6];
		String MaLop = tmp[7];
		if (MaLop.trim().equals("")) {
			MaLop = "-1";
		}
		String MaChucVu = tmp[8];
		String Quyen = tmp[9];
		String MatKhau = tmp[10];
		String Email = tmp[11];
		String SDT = tmp[12];
		int TTCongViec = Integer.parseInt(tmp[13]) ;
		int TTHocVan = Integer.parseInt(tmp[14]) ;
		int LoaiCongViec = Integer.parseInt(tmp[15]) ;
		String MaKhoa = tmp[16];
		int MaTP = Integer.parseInt(tmp[17]) ;
		int MaQG = Integer.parseInt(tmp[18]) ;
		
		/*System.out.println(Quyen);
		System.out.println(MaTK);
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
		

		
		

		  //  System.out.println(date + "\t" + heure + "\t" +parametre+ "\t" +valeur);
		   String sql = "insert into nguoidung(MaTK,TenNguoiDung,NgaySinh,GioiTinh,DanToc,SoCMND,DiaChi,MaLop,MaChucVu,MaQuyen, "
		   		+ "MatKhau,email,SDT,MaTinhTrangCV,MaTinhTrangHV,MaLoaiCV,MaKhoa,NgayBatDau,MaTP,MaQG) values ('"+MaTK+"','"+TenTK+"','"+NgaySinh+"',"+GioiTinh+","
					+ " '"+DanToc+"','"+CMND+"','"+DiaChi+"','"+MaLop+"','"+MaChucVu+"','"+Quyen+"','"+MatKhau+"',"
					+ " '"+Email+"','"+SDT+"','"+TTCongViec+"','"+TTHocVan+"','"+LoaiCongViec+"','"+MaKhoa+"',current_timestamp(),'"+MaTP+"','"+MaQG+"');";

		   Database db = new Database();
		   db.updateData(sql);
		   response.sendRedirect("admin.jsp");
		}
		 br.close();
		 }   catch(IOException e){
		     e.printStackTrace();
		 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExceptionInInitializerError e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
}
