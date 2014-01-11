package com.emrs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import com.emrs.service.PatientService;

/**
 * VerifyServlet
 * Mainly used in form validation
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/verify")
public class VerifyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		JSONObject object = new JSONObject();
		
		PatientService ps = new PatientService();
		
		String value = req.getParameter("value");
		String type = req.getParameter("type");
		
		boolean success = false;
		
		if("pid".equals(type)) 
			success = ps.verifyPatientId(value);	
		else if ("ssn".equals(type))
			success = ps.verifyPatientSsn(value);
		
		System.out.println(success);
		PrintWriter pw = resp.getWriter();
		if(success)
			pw.print(1);
		else
			pw.print(0);
		
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}