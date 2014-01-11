package com.emrs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emrs.po.Admin;
import com.emrs.po.Doctor;
import com.emrs.po.Patient;
import com.emrs.service.AdminService;
import com.emrs.service.DoctorService;
import com.emrs.service.PatientService;
import com.emrs.util.Encipher;

/**
 * SignInServlet
 * Used to handle the request of login in
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/signin")
public class SignInServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		String account = req.getParameter("account");
		String password = Encipher.getMD5Str(req.getParameter("password"));

		if (account != null && !account.equals("")) {
			if (account.startsWith("doc")) {
				DoctorService ds = new DoctorService();
				Doctor doctor = ds.getDoctorById(account);
				if (doctor != null && doctor.getState() == 0 && doctor.getPassword().equals(password)) {
					session.setAttribute("account", doctor);
					session.setAttribute("accountType", "doctor");
					resp.sendRedirect("d_detail.jsp");
				} else {
					resp.sendRedirect("login.jsp");
				}

			} else if (account.startsWith("adm")) {
				AdminService as = new AdminService();
				Admin admin = as.getAdminById(account);
				if (admin != null && admin.getPassword().equals(password)) {
					session.setAttribute("account", admin);
					session.setAttribute("accountType", "admin");
					resp.sendRedirect("a_manegeDo.jsp");
				} else {
					resp.sendRedirect("login.jsp");
				}
			} else {
				PatientService ps = new PatientService();
				Patient patient = ps.getPatientById(account);
				if (patient != null && patient.getState() == 0 && patient.getPassword().equals(password)) {
					session.setAttribute("account", patient);
					session.setAttribute("accountType", "patient");
					resp.sendRedirect("p_detail.jsp");
				} else {
					resp.sendRedirect("login.jsp");
				}
			}
		} else {
			resp.sendRedirect("login.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
