package com.emrs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.emrs.po.Doctor;
import com.emrs.po.Patient;
import com.emrs.po.Record;
import com.emrs.service.PatientService;
import com.emrs.service.RecordService;
import com.emrs.service.RelationshipService;
import com.emrs.util.JSONUtils;

/**
 * SearchServlet
 * Used to handle the requst about searching
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/search")
public class SearchServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json;UTF-8");
		JSONObject object = new JSONObject();

		RecordService rs = new RecordService();
		RelationshipService rss = new RelationshipService();
		PatientService ps = new PatientService();
		String action = req.getParameter("action");
System.out.println("enter");

		if (action.equals("allPatient")) {
			String condition = req.getParameter("condition");

			if (condition.equals("0")) {
				
				Patient patient = ps
						.getPatientById(req.getParameter("keyword"));
				List<Record> lr = rs.getRecordByPatient(patient.getPid());
				JSONArray jarray = new JSONArray();
				jarray.put(JSONUtils.toJSONArray(lr));
				List<Patient> array = new ArrayList<Patient>();
				if (patient != null) {
					array.add(patient);
					try {
						object.put("data", JSONUtils.toJSONArray(array));
						object.put("record", jarray);
						object.put("pageMax", 1);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}

			} else if (condition.equals("1")) {
				object = new JSONObject();
				List<Patient> lp = ps.searchPatientByName(
						req.getParameter("keyword"),
						Integer.valueOf(req.getParameter("page")));
				JSONArray array = new JSONArray();
				for( Patient patient : lp ) {
					array.put(JSONUtils.toJSONArray(rs.getRecordByPatient(patient.getPid())));
				}
				try {
					object.put(
							"data",
							JSONUtils.toJSONArray(lp));
					object.put("record", array);
					object.put("pageMax", 1);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				object = new JSONObject();
				try {
					object.put("data",
							JSONUtils.toJSONArray(ps.getAllPatient(1)));
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		} else if (action.equals("searchRecord")) {
			
			String searchType = req.getParameter("searchType");
			List<Record> lr = rs.searchRecord(1,
					Integer.valueOf(req.getParameter("orderType")),
					searchType == null ? 0 : Integer.valueOf(searchType),
					req.getParameter("keyword"), req.getParameter("beginDate"),
					req.getParameter("endDate"),
					req.getParameter("department"),
					Integer.valueOf(req.getParameter("gender")));

			try {
				object.put("data", JSONUtils.toJSONArray(lr));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (action.equals("searchPatientlist")) {
			String condition = req.getParameter("condition");
			Doctor doctor = (Doctor)req.getSession().getAttribute("account");

			if ("0".equals(condition)) {
				
				Patient patient = rss
						.findPatientlistByPid(doctor.getDid(), req.getParameter("keyword"));
				List<Record> lr = rs.getRecordByPatient(patient.getPid());
				JSONArray jarray = new JSONArray();
				jarray.put(JSONUtils.toJSONArray(lr));
				List<Patient> array = new ArrayList<Patient>();
				if (patient != null) {
					array.add(patient);
					try {
						object.put("data", JSONUtils.toJSONArray(array));
						object.put("pageMax", 1);
						object.put("record", jarray);
					} catch (JSONException e) {
						e.printStackTrace();
					}
				}
			} else if ("1".equals(condition)) {
				List<Patient> lp = rss.searchPatientlistByName(doctor.getDid(),req.getParameter("keyword"),
						Integer.valueOf(req.getParameter("page")));
				object = new JSONObject();
				JSONArray array = new JSONArray();
				for( Patient patient : lp ) {
					array.put(JSONUtils.toJSONArray(rs.getRecordByPatient(patient.getPid())));
				}
				try {
					object.put(
							"data", JSONUtils.toJSONArray(lp));
					object.put("record", array);
					object.put("pageMax", 1);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {

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
