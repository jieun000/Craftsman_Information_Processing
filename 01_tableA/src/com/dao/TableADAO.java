package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;
import com.vo.TableAVO;

import javafx.scene.control.TableView;
import unit.DBManager;

public class TableADAO {

	private TableADAO() {
		
	}
	private static TableADAO instance = new TableADAO();
	
	public static TableADAO getInstance() {
		return instance;
	}
	
	// 목록 메서드
	public List<TableAVO> listAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tableA";
		List<TableAVO> list = new ArrayList<TableAVO>();
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TableAVO vo = new TableAVO();
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	// DB 조회
	public TableAVO detail(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tableA where no=?";
		TableAVO vo = new TableAVO();
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAge(rs.getInt(3));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	// DB수정 메서드
	public void update(TableAVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update tableA set name=?, age=? where no=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			pstmt.setInt(3, vo.getNo());
			
			pstmt.executeUpdate();
		} catch(Exception e) { 
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	// DB삭제 메서드
	public void delete(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from tableA where no=?";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	// DB 추가 메서드
	public void add(TableAVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into tableA values(seq_no.nextval, ?, ?)";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getAge());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
}
