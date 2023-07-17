package com.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

@WebServlet("/list.do")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = MemberDAO.getInstance();
		List<MemberVO> list = new ArrayList<>();
		
		list = dao.listAll();
		request.setAttribute("lists", list);
		
		request.getRequestDispatcher("memberForm.jsp").forward(request, response);
	}

}