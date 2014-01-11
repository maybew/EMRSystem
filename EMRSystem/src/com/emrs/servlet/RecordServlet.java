package com.emrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emrs.service.RecordService;

/**
 * RecordServlet
 * Used to get all record in some condition
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/record")
public class RecordServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		String action = req.getParameter("action");
		RecordService rs = new RecordService();
		
		if(action != null) {
			if(action.equals("addRecord")) {
				rs.addRecordFromReq(req);
				resp.sendRedirect("d_patient.jsp");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
}
