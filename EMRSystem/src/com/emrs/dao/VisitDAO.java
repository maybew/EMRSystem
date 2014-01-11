package com.emrs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Medical;
import com.emrs.po.Visit;

/**
 * VisitDAO
 * @author maybe
 *
 */
public class VisitDAO {
private static VisitDAO INSTANCE = new VisitDAO();
	
	private VisitDAO() {		
	}
	
	public static VisitDAO getVisitDAO() {
		return INSTANCE;
	}
	
	public void insert(Visit visit) {
		JPAOperator.insert(visit);
	}
	
	public Visit find(int vid) {
		return JPAOperator.find(vid, Visit.class);
	}
	
	public void update(Visit visit) {
		JPAOperator.update(visit);
	}
	
	public void delete(Visit visit) {
		JPAOperator.delete(visit);
	}
	
	public List<Visit> getVisitByRecord(int rid) {
		String sql = "select v from Visit v where v.record.rid = :rid";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		return JPAOperator.query(sql, map, Visit.class, 1, Integer.MAX_VALUE / 2);
	}
}
