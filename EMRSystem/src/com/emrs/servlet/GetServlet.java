package com.emrs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.emrs.po.Record;
import com.emrs.service.RecordService;

/**
 * GetServlet
 * Used to handle the request about getting content of record
 * @author maybe
 *
 */
@SuppressWarnings("serial")
@WebServlet("/getcontent")
public class GetServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json;UTF-8");
		JSONObject object = null;
		
		RecordService rs = new RecordService();
		
		String action = req.getParameter("action");
		
		if(action != null) {
			if(action.equals("getRecordContent")) {
				object = rs.getRecordContent(Integer.valueOf(req.getParameter("rid")));
			} else if (action.equals("getRecordsOfPatient")) {
				object = new JSONObject();
				JSONArray array = new JSONArray();
				List<Record> records = rs.getRecordByPatient(req.getParameter("pid"));
				for(Record r : records) {
					array.put(rs.getRecordContent(r.getRid()));
				}
				try {
					object.put("data", array);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
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
