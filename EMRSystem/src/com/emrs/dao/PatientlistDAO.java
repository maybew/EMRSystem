package com.emrs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Patientlist;

/**
 * PatientlistDAO
 * @author maybe
 *
 */
public class PatientlistDAO {
	private static PatientlistDAO INSTANCE = new PatientlistDAO();

	private PatientlistDAO() {
	}

	public static PatientlistDAO getPatientlistDAO() {
		return INSTANCE;
	}

	public void insert(Patientlist patientlist) {
		JPAOperator.insert(patientlist);
	}

	public Patientlist find(String plid) {
		return JPAOperator.find(plid, Patientlist.class);
	}

	public void update(Patientlist patientlist) {
		JPAOperator.update(patientlist);
	}

	public void delete(Patientlist patientlist) {
		JPAOperator.delete(patientlist);
	}

	public List<Patientlist> getPatientlistByDoctor(String did, int pageNum,
			int pageSize) {
		String sql = "select p from Patientlist p where p.doctor.did = :did";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("did", did);
		return JPAOperator
				.query(sql, map, Patientlist.class, pageNum, pageSize);
	}

	public List<Patientlist> searchPatientlistByName(String did,
			String keyword, int pageNum, int pageSize) {
		String sql = "select p from Patientlist p where p.doctor.did = :did AND (p.patient.fname + p.patient.lname) like :keyword";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("did", did);
		map.put("keyword", "%" + keyword + "%");
		return JPAOperator
				.query(sql, map, Patientlist.class, pageNum, pageSize);
	}

	public Patientlist findPatient(String did, String pid) {
		String sql = "select p from Patientlist p where p.doctor.did = :did AND p.patient.pid = :pid";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("did", did);
		map.put("pid", pid);
		List<Patientlist> pl = JPAOperator.query(sql, map, Patientlist.class, 1,
				Integer.MAX_VALUE / 2);
		if (pl.size() > 0)
			return pl.get(0);
		return null;
	}
}
