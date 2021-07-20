package ecommerce.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;


import org.hibernate.Session;

import ecommerce.Entity.User;
import ecommerce.factoryProvider.FactoryProvider;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		// doGet(request, response);
		
		try {
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			
			if(userName.isEmpty()) {
				System.out.println("Name can't be blank");
			}
			// Creating user object to store data
			
			User user=new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress,"admin");
			
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx=hibernateSession.beginTransaction();
			hibernateSession.save(user);
			
			
			tx.commit();
			hibernateSession.close();
			
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Registration Successful");
			response.sendRedirect("register.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
