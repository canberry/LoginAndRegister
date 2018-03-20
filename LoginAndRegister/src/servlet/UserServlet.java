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
		//��¼
		if (m.equals("login")) {
			String role = request.getParameter("role");
			role = new String(role.getBytes("iso-8859-1"), "gbk");
			user.setRole(role);		    
			
			if (udi.login(user)) { //��Ϣ��ȷ
				request.setAttribute("username", username);
				
				if (user.getRole().equals("����Ա")) { //��¼����Ա����
					request.getRequestDispatcher("adminok.jsp").forward(request, response);
				}
				else if (user.getRole().equals("��ͨ�û�")) { //��¼��ͨ�û�����
					request.getRequestDispatcher("ok.jsp").forward(request, response);
				}
			}
			else { //��Ϣ����ȷ
				//request.setAttribute("errMsg", "1");
				 out.print("��¼��Ϣ����");
				response.sendRedirect("index.jsp?errMsg=1");	
				//request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		//ע��
		else if (m.equals("register")) {
			String role = request.getParameter("role");
			role = new String(role.getBytes("iso-8859-1"), "gbk");
			user.setRole(role);
			
			String repeatpassword = request.getParameter("repeatpassword");
			repeatpassword = new String(repeatpassword.getBytes("iso-8859-1"), "gbk");
			
			if (repeatpassword.equals(password)) { //jsp�������ж�  �ظ�����������ȷ
				if (udi.register(user)) { //�ɹ�ע��
					response.sendRedirect("index.jsp");					
				}
			}
			else { //�ظ��������벻��ȷ
				response.sendRedirect("register.jsp");
			}
		}
		//�һ�����
		else if (m.equals("findPassword")) {
			String repeatpassword = request.getParameter("repeatpassword");
			repeatpassword = new String(repeatpassword.getBytes("iso-8859-1"), "gbk");
			
			if (repeatpassword.equals(password)) { //jsp�������ж�  �ظ�����������ȷ
				if (udi.modifyInfo(user)) { //�ɹ��޸�
					response.sendRedirect("index.jsp");
				}
			}
			else { //�ظ��������벻��ȷ
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
