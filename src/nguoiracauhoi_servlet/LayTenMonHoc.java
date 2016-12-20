package nguoiracauhoi_servlet;

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
 * Servlet implementation class LayTenMonHoc
 */
@WebServlet("/LayTenMonHoc")
public class LayTenMonHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayTenMonHoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = null;
		request.setCharacterEncoding("UTF-8");
		String chuoi = request.getParameter("chuoi");
		Map<String, String> map = new LinkedHashMap<String,String>(); 
		try {
			Database db = new Database();
			ResultSet rs = db.getData("select TenMon,MaMon from monhoc  where TenMon like concat('"+chuoi+"','%')");
			while(rs.next()){
				map.put(rs.getString("MaMon"),rs.getString("TenMon"));
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(map));

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			error = e.getMessage();
		}
	}

}
