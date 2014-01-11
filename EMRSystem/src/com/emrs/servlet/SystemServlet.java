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

import com.emrs.service.DepartmentService;
import com.emrs.service.PositionService;
import com.emrs.util.JSONUtils;

/**
 * SystemServlet
 * Used to handle some system configuration request
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/system")
public class SystemServlet extends HttpServlet {
	DepartmentService dps = new DepartmentService();
	PositionService pos = new PositionService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json;UTF-8");

		JSONObject object = new JSONObject();

		String action = req.getParameter("action");
		if ("department".equals(action)) {
			try {
				object.put("data",
						JSONUtils.toJSONArray(dps.getAllDepartments(true, 1)));
				// object.put("data",JSONUtils.toJSONArray(dps.searchDepartmentByName(false,
				// 1, null)));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("position".equals(action)) {
			try {
				object.put("data",
						JSONUtils.toJSONArray(pos.getAllPositions(true, 1)));
				// object.put("data",JSONUtils.toJSONArray(dps.searchDepartmentByName(false,
				// 1, null)));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("deleteDepartment".equals(action)) {
			dps.deleteDepartment(Integer.valueOf(req.getParameter("id")));
		} else if ("addDepartment".equals(action)) {
			dps.addDepartment(req.getParameter("name"));
			resp.sendRedirect("a_manegeDe.jsp");
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
