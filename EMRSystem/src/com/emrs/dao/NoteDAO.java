package com.emrs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.emrs.jpa.JPAOperator;
import com.emrs.po.Note;

/**
 * NoteDAO
 * @author maybe
 *
 */
public class NoteDAO {
private static NoteDAO INSTANCE = new NoteDAO();
	
	private NoteDAO() {		
	}
	
	public static NoteDAO getNoteDAO() {
		return INSTANCE;
	}
	
	public void insert(Note note) {
		JPAOperator.insert(note);
	}
	
	public Note find(int nid) {
		return JPAOperator.find(nid, Note.class);
	}
	
	public void update(Note note) {
		JPAOperator.update(note);
	}
	
	public void delete(Note note) {
		JPAOperator.delete(note);
	}
	
	public List<Note> getNoteByRecord(int rid) {
		String sql = "select n from Note n where n.record.rid = :rid";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		return JPAOperator.query(sql, map, Note.class, 1, Integer.MAX_VALUE / 2);
	}
}
