package com.emrs.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.emrs.config.Configure;
import com.emrs.dao.PatientDAO;
import com.emrs.dao.PatientlistDAO;
import com.emrs.po.Patient;
import com.emrs.po.Patientlist;
import com.emrs.util.Encipher;
import com.emrs.util.TimeFormatter;

/**
 * PatientService
 * Used to deal with the business logic of Patient
 * @author maybe
 *
 */
public class PatientService {
	PatientDAO dao = PatientDAO.getPatientDAO();
	PatientlistDAO pldao = PatientlistDAO.getPatientlistDAO();
	
	public Patient getPatientById(String id) {
		if(id.equals("") || id == null) return null;
		return dao.find(id);
	}
	
	public List<Patient> searchPatientByName(String keyword, int pageNum) {
		if(keyword.equals("") || keyword == null) return dao.getAllPatient(pageNum, Configure.PAGESIZE);
		return dao.searchPatientByName(keyword, pageNum, Configure.PAGESIZE);
	}
	
	public List<Patient> getAllPatient(int pageNum) {
		return dao.getAllPatient(pageNum, Configure.PAGESIZE);
	}
	
	public void addPatientFromReq(HttpServletRequest req) {
		Patient patient = new Patient();
		
		patient.setPid(req.getParameter("pid"));
		patient.setSsn(req.getParameter("ssn"));
		patient.setPassword(Encipher.getMD5Str(req.getParameter("password")));
		patient.setFname(req.getParameter("fname"));
		patient.setLname(req.getParameter("lname"));
		patient.setBirthdate(TimeFormatter.getDate(req.getParameter("birthdate")));
		patient.setGender(Integer.valueOf(req.getParameter("gender")));
		patient.setAddress(req.getParameter("address"));
		patient.setEaddress(req.getParameter("eaddress"));
		patient.setEemail(req.getParameter("eemail"));
		patient.setEmail(req.getParameter("email"));
		patient.setEname(req.getParameter("ename"));
		patient.setEphone(req.getParameter("ephone"));
		patient.setState(0);
		patient.setIcaddress(req.getParameter("icaddress"));
		patient.setIcemail(req.getParameter("icemail"));
		patient.setIcexpiredate(req.getParameter("icexpiredate"));
		patient.setIcname(req.getParameter("icname"));
		patient.setIcphone(req.getParameter("icphone"));
		patient.setIcpolicynum(req.getParameter("icpolicynum"));
		patient.setIcpolicytype(req.getParameter("icpolicytype"));
		patient.setIctax(req.getParameter("ictax"));
		patient.setPhone(req.getParameter("phone"));
		
		dao.insert(patient);
	}
	
	public boolean changePassword(String username, String oldPwd, String newPwd) {
		Patient patient = dao.find(username);
		if(patient == null || !oldPwd.equals(patient.getPassword()))
			return false;
		patient.setPassword(newPwd);
		dao.update(patient);
		return true;
	}
	
	public List<Patient> getPatientByDoctor(String did, int pageNum) {
		Iterator<Patientlist> i = pldao.getPatientlistByDoctor(did, pageNum, Configure.PAGESIZE).iterator();
		List<Patient> lp = new ArrayList<Patient>();
		while(i.hasNext())
			lp.add(i.next().getPatient());
		return lp;
	}
	
	public void deletePatientByPid(String pid) {
		Patient patient = dao.find(pid);
		if(patient == null)
			return;
		patient.setState(1);
		dao.update(patient);
	}
	
	public boolean verifyPatientId(String pid) {
		System.out.println(pid);
		
		Patient p = dao.find(pid);
		System.out.println(p);
		return dao.find(pid) == null;
	}
	
	public boolean verifyPatientSsn(String ssn) {
		return dao.findPatientBySsn(ssn) == null;
	}

}
