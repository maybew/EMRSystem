package com.emrs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Health;
import com.emrs.po.Medical;

/**
 * HealthDAO
 * @author maybe
 *
 */
public class HealthDAO {
	private static HealthDAO INSTANCE = new HealthDAO();
	
	private HealthDAO() {		
	}
	
	public static HealthDAO getHealthDAO() {
		return INSTANCE;
	}
	
	public void insert(Health health) {
		JPAOperator.insert(health);
	}
	
	public Health find(int hid) {
		return JPAOperator.find(hid, Health.class);
	}
	
	public void update(Health health) {
		JPAOperator.update(health);
	}
	
	public void delete(Health health) {
		JPAOperator.delete(health);
	}
	
	public List<Health> getHealthByRecord(int rid) {
		String sql = "select h from Health h where h.record.rid = :rid";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		return JPAOperator.query(sql, map, Health.class, 1, Integer.MAX_VALUE / 2);
	}
}
