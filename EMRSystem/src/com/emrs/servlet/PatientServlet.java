package com.emrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emrs.service.PatientService;

/**
 * PatientServlet
 * Used to handle the request of Patient.
 * Including query, add and delete
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/patient")
public class PatientServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PatientService ps = new PatientService();
		
		ps.deletePatientByPid(req.getParameter("pid"));
		resp.sendRedirect("a_manegePa.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
