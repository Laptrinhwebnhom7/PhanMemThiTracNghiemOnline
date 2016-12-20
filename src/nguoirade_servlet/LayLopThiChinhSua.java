package nguoirade_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.Database;

/**
 * Servlet implementation class LayLopThiChinhSua
 */
@WebServlet("/LayLopThiChinhSua")
public class LayLopThiChinhSua extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayLopThiChinhSua() {
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
		String MaDe = request.getParameter("MaDe");
		  Map<String, String> map = new LinkedHashMap<String,String>();
		  Database db = new Database();
		  String json = null;
		  ResultSet rs = null;
		  try {
			rs = db.getData("select MaHocPhan from chitietlophoc_dethi where MaDe='"+MaDe+"' ");
			if(MaDe.equals("-1")){
				map.put("-1", "Chọn");
			}else{
				while(rs.next())
				{
					map.put(rs.getString("MaHocPhan"), rs.getString("MaHocPhan"));
				}
			}
	        json = new Gson().toJson(map);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
