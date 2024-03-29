package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.JobOpeningDAO;
import com.model.JobOpening;

@WebServlet("/jobopeningregister")
public class JobOpeningRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JobOpeningRegister() {
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
		
		String name = request.getParameter("title");
		String overview = request.getParameter("overview");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String address = request.getParameter("location");
		String description = request.getParameter("jobDescription");
		
		JobOpening jobopening = new JobOpening(name,overview,country,city,address,description);
		JobOpeningDAO jobopeningdao = new JobOpeningDAO();
		
		jobopeningdao.createNewJobOpening(jobopening);
		response.sendRedirect("Portal/pages/JobOpeningPortalRecruiter.jsp");
	}

}
