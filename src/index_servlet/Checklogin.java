package index_servlet;

import java.io.IOException;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

/**
 * Servlet implementation class Checklogin
 */
@WebServlet("/Checklogin")
public class Checklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checklogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("UTF-8");
			Database db = new Database();
			String user = request.getParameter("Name_User");
			String password = request.getParameter("Name_Pass");
			String quyen = request.getParameter("optradio");
			int tam=-1;
			if(quyen.equals("0")){
				tam=0;
			}
			else if(quyen.equals("1")){
				tam=1;
			}
				else if(quyen.equals("2")){
					tam=2;
				}
					else if(quyen.equals("3")){
						tam=3;
					}
						else if(quyen.equals("4")){
							tam=4;
						}
			ResultSet rs = null;
			rs = db.getData("select * from NguoiDung where MaTK ='"+user+"' and MatKhau ='"+password+"' and MaQuyen = '"+tam+"'");
			
			
			
			if(rs.next()){	
			//	response.setContentType("text/html;charset=UTF-8"); 
			//	request.setCharacterEncoding("UTF-8");
				HttpSession session = request.getSession();
				session.setAttribute("taikhoan",user);
				
				if(tam==0){
					response.sendRedirect("sinhvien.jsp");
				}
				else if(tam==1){
					response.sendRedirect("quantridethi.jsp");
					}else if(tam ==2){
						response.sendRedirect("quantrikythi.jsp");
						}else if(tam==3){
							response.sendRedirect("quantringanhangcauhoi.jsp");
							}else if(tam==4){
								response.sendRedirect("admin.jsp");
								}
				
				
			}
			else //response.sendRedirect("loginfail.jsp");
			{
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
				
				request.setAttribute("thongbao", "Tài khoản hoặc mật khẩu không chính xác!!");
				dis.forward(request, response);
			}
			
				
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
		
		
		
	}

}
