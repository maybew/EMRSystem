package com.emrs.service;

import java.util.ArrayList;
import java.util.List;

import com.emrs.config.Configure;
import com.emrs.dao.DoctorDAO;
import com.emrs.dao.PatientDAO;
import com.emrs.dao.PatientlistDAO;
import com.emrs.dao.RecordDAO;
import com.emrs.po.Doctor;
import com.emrs.po.Patient;
import com.emrs.po.Patientlist;

/**
 * RelationshipService
 * Used to deal with the relationship between patinet and doctor
 * @author maybe
 *
 */
public class RelationshipService {
	PatientDAO pdao = PatientDAO.getPatientDAO();
	DoctorDAO ddao = DoctorDAO.getDoctorDAO();
	PatientlistDAO pldao = PatientlistDAO.getPatientlistDAO();
	RecordDAO rdao = RecordDAO.getRecordDAO();
	
	public List<Patient> getPatientListByDoctor(String did, int pageNum) {
		List<Patientlist> patientList = pldao.getPatientlistByDoctor(did, pageNum, Configure.PAGESIZE);
		List<Patient> patients = new ArrayList<Patient>();
		for(Patientlist item : patientList) {
			patients.add(item.getPatient());
		}
		return patients;
	}
	
	public List<Patient> searchPatientlistByName(String did, String keyword, int pageNum) {
		if("".equals(keyword))
			return this.getPatientListByDoctor(did, pageNum);
		List<Patientlist> patientList = pldao.searchPatientlistByName(did, keyword, pageNum, Configure.PAGESIZE);
		List<Patient> patients = new ArrayList<Patient>();
		for(Patientlist item : patientList) {
			patients.add(item.getPatient());
		}
		return patients;
	}
	
	public Patient findPatientlistByPid(String did, String pid) {
		Patientlist pl = pldao.findPatient(did, pid);
		if(pl != null)
			return pl.getPatient();
		return null;
	}
	
	public void addPatientToList(String pid, String did) {
		Patient patient = pdao.find(pid);
		Doctor doctor = ddao.find(did);
		Patientlist patientlist = new Patientlist();
		patientlist.setDoctor(doctor);
		patientlist.setPatient(patient);
		pldao.insert(patientlist);
	}
}
