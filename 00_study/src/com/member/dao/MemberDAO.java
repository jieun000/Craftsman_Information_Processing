package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.member.vo.MemberVO;

import unit.DBManager;

public class MemberDAO {

	private MemberDAO() {	
	}
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 목록 메서드
	public List<MemberVO> listAll() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member";
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
