package nguoiracauhoi_servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class ThemCauHoiBangFile
 */
@WebServlet("/ThemCauHoiBangFile")
@MultipartConfig(maxFileSize = 16177215)
public class ThemCauHoiBangFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemCauHoiBangFile() {
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
		String filePart = request.getParameter ("fileCauHoi");
		 try {
	/*		 String date;
		     String heure;
		     String parametre;
		     String valeur;
		     java.sql.PreparedStatement ps = null;
		     java.sql.Connection con = null;
		     ResultSet rs = null;*/

			 	BufferedReader br = new BufferedReader(new FileReader("D:/inputCauHoi.txt.txt"));
		 		
		String line = null;
		while((line=br.readLine()) != null){
		String tmp[]=line.split(",");
		
		String NoiDung =tmp[0];
		String CauA = tmp[1];
		String CauB = tmp[2];
		String CauC =tmp[3];
	
		String CauD = tmp[4];
		String DapAn = tmp[5];
		String MaMucDo = tmp[6];
		String MaChuDe = tmp[7];
		
/*		System.out.println(NoiDung);
		System.out.println(CauA);
		System.out.println(CauB);
		System.out.println(CauC);
		System.out.println(CauD);
		System.out.println(DapAn);
		System.out.println(MaMucDo);
		System.out.println(MaChuDe);
*/

		  //  System.out.println(date + "\t" + heure + "\t" +parametre+ "\t" +valeur);
		   String sql = "insert into CauHoi(NoiDung,CauA,CauB,CauC,CauD,DapAn,NgayRa,MaMucDo,MaChuDe) "
					+ "values ('"+NoiDung+"','"+CauA+"','"+CauB+"','"+CauC+"','"+CauD+"','"+DapAn+"',CURDATE(),'"+MaMucDo+"','"+MaChuDe+"')";

		   Database db = new Database();
		   db.updateData(sql);
		   response.sendRedirect("quantringanhangcauhoi.jsp");
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
