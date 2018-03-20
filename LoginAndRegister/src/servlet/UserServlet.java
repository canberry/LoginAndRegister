package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.User;

import dao.impl.UserDAOImpl;

public class UserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		username = new String(username.getBytes("iso-8859-1"), "gbk");
		String password = request.getParameter("password");
		password = new String(password.getBytes("iso-8859-1"), "gbk");
		
		UserDAOImpl udi = new UserDAOImpl();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		
		String m = request.getParameter("m");
		//登录
		if (m.equals("login")) {
			String role = request.getParameter("role");
			role = new String(role.getBytes("iso-8859-1"), "gbk");
			user.setRole(role);		    
			
			if (udi.login(user)) { //信息正确
				request.setAttribute("username", username);
				
				if (user.getRole().equals("管理员")) { //登录管理员界面
					request.getRequestDispatcher("adminok.jsp").forward(request, response);
				}
				else if (user.getRole().equals("普通用户")) { //登录普通用户界面
					request.getRequestDispatcher("ok.jsp").forward(request, response);
				}
			}
			else { //信息不正确
				//request.setAttribute("errMsg", "1");
				 out.print("登录信息错误");
				response.sendRedirect("index.jsp?errMsg=1");	
				//request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		//注册
		else if (m.equals("register")) {
			String role = request.getParameter("role");
			role = new String(role.getBytes("iso-8859-1"), "gbk");
			user.setRole(role);
			
			String repeatpassword = request.getParameter("repeatpassword");
			repeatpassword = new String(repeatpassword.getBytes("iso-8859-1"), "gbk");
			
			if (repeatpassword.equals(password)) { //jsp中已有判断  重复密码输入正确
				if (udi.register(user)) { //成功注册
					response.sendRedirect("index.jsp");					
				}
			}
			else { //重复密码输入不正确
				response.sendRedirect("register.jsp");
			}
		}
		//找回密码
		else if (m.equals("findPassword")) {
			String repeatpassword = request.getParameter("repeatpassword");
			repeatpassword = new String(repeatpassword.getBytes("iso-8859-1"), "gbk");
			
			if (repeatpassword.equals(password)) { //jsp中已有判断  重复密码输入正确
				if (udi.modifyInfo(user)) { //成功修改
					response.sendRedirect("index.jsp");
				}
			}
			else { //重复密码输入不正确
				response.sendRedirect("findPassword.jsp");
			}
		}
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
