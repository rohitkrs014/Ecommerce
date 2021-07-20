package ecommerce.servlets;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ecommerce.Entity.User;
import ecommerce.dao.UserDao;
import ecommerce.factoryProvider.FactoryProvider;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao userDao=new UserDao(FactoryProvider.getFactory());
		User user=userDao.getUserByEmailAndPassword(email, password);
		//System.out.println(user);
		
		HttpSession httpSession=request.getSession();
		
	
		
		if(user==null) {
			httpSession.setAttribute("message", "Invalid Details");
			response.sendRedirect("login.jsp");
			return;
		}else {
			httpSession.setAttribute("current-user", user);
			
			if(user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equals("normal")) {
				response.sendRedirect("normal.jsp");
			}else {
				out.println("Unknown user");
			}
		}
	}

}
