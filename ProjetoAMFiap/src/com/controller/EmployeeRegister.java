package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmployeeDAO;
import com.model.Employee;

import static java.lang.Integer.parseInt;

@WebServlet("/employeeregister")
public class EmployeeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EmployeeRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		
		ResultSet rs_adm;
		
		int employee_code = parseInt(request.getParameter("employee_code"));
		String name = request.getParameter("name");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password_confirm = request.getParameter("password_confirm");
		String password_adm = request.getParameter("password_adm");
		
		if(password.equals(password_confirm)) {
			
			Employee employee = new Employee(employee_code,name,lastname,email,password);
			EmployeeDAO employeedao = new EmployeeDAO();
			
			rs_adm = employeedao.adminAuthentication(password_adm);
			
			try {
				if(rs_adm.next()) {
					employeedao.employeeRegister(employee);
					response.sendRedirect("EmployeeLogin.jsp");
				} else {
					response.sendRedirect("EmployeeRegister.jsp");
					out.print("Failure on ADM authentication");
				}
			} catch (SQLException e) {
				System.out.println("Error during the retrievement of admin password in Oracle - Servlet Page Error\n"+e);
			}
		} else {
			response.sendRedirect("EmployeeRegister.jsp");
			out.print("Passwords don't match.");
		}
	}

}