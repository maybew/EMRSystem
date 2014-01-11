package com.emrs.service;

import java.util.List;

import com.emrs.config.Configure;
import com.emrs.dao.PositionDAO;
import com.emrs.po.Position;

/**
 * PositionService
 * Used to deal with the busniess logic of Position
 * @author maybe
 *
 */
public class PositionService {
	PositionDAO dao = PositionDAO.getPositionDAO();
	
	public List<Position> searchPositionByName(boolean asc, int pageNum, String keyword) {
		return dao.searchPositionByName(pageNum, Configure.PAGESIZE, asc, keyword);
	}
	
	public List<Position> getAllPositions(boolean asc, int pageNum) {
			return dao.searchPositionByName(pageNum, Configure.PAGESIZE, asc, null);
	}
	
	public void addPosition(String name) {
		Position dp = new Position();
		
		dp.setName(name);
		dao.insert(dp);
	}
	
	public void deletePosition(int psid) {
		dao.delete(dao.find(psid));
	}
}
