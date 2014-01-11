package com.emrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emrs.service.PatientService;

/**
 * SignUpServlet
 * Used to sign up account for patient and doctor
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		
		String type = req.getParameter("type");
		
		if(type.equals("patient")) {
			PatientService ps = new PatientService();
			ps.addPatientFromReq(req);
			resp.sendRedirect("a_manegePa.jsp");
		} else if(type.equals("doctor")) {
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
