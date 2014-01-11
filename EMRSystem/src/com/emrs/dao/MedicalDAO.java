package com.emrs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Medical;
import com.emrs.po.Record;

/**
 * MedicalDAO
 * @author maybe
 *
 */
public class MedicalDAO {
	private static MedicalDAO INSTANCE = new MedicalDAO();
	
	private MedicalDAO() {		
	}
	
	public static MedicalDAO getMedicalDAO() {
		return INSTANCE;
	}
	
	public void insert(Medical medical) {
		JPAOperator.insert(medical);
	}
	
	public Medical find(int mid) {
		return JPAOperator.find(mid, Medical.class);
	}
	
	public void update(Medical medical) {
		JPAOperator.update(medical);
	}
	
	public void delete(Medical medical) {
		JPAOperator.delete(medical);
	}
	
	public List<Medical> getMedicalByRecord(int rid) {
		String sql = "select m from Medical m where m.record.rid = :rid";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		return JPAOperator.query(sql, map, Medical.class, 1, Integer.MAX_VALUE / 2);
	}
}
