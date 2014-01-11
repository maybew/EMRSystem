package com.emrs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.emrs.po.Account;
import com.emrs.po.Patient;
import com.emrs.service.AdminService;
import com.emrs.service.DoctorService;
import com.emrs.service.PatientService;

/**
 * PasswordServlet
 * Used to handle the request about change password for patient, admin, and doctor
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/password")
public class PasswordServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json;UTF-8");
		
		PatientService ps = new PatientService();
		DoctorService ds = new DoctorService();
		AdminService as = new AdminService();
		
		Account account = (Account)req.getSession().getAttribute("account");
		String accountType = account.getType();
		
		JSONObject object = new JSONObject();
		
		if("patient".equals(accountType)) {
			if(ps.changePassword(((Patient)account).getPid(), req.getParameter("oldPwd"), req.getParameter("newPwd")))
				try {
					object.put("status", 1);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			else
				try {
					object.put("status", 0);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} else if("doctor".equals(accountType)) {
			if(ds.changePassword(((Patient)account).getPid(), req.getParameter("oldPwd"), req.getParameter("newPwd")))
				try {
					object.put("status", 1);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			else
				try {
					object.put("status", 0);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} else if("admin".equals(accountType)) {
			if(as.changePassword(((Patient)account).getPid(), req.getParameter("oldPwd"), req.getParameter("newPwd")))
				try {
					object.put("status", 1);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			else
				try {
					object.put("status", 0);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		PrintWriter pw = resp.getWriter();
		pw.print(object);
		pw.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
