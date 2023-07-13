package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int custno = Integer.parseInt(request.getParameter("custno"));
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO vo = dao.detail(custno);
		
		request.setAttribute("detail", vo);
		
		RequestDispatcher rd = request.getRequestDispatcher("updateMember.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberVO vo = new MemberVO();
		vo.setCustno(custno);
		vo.setCustname(custname);
		vo.setPhone(phone);
		vo.setAddress(address);
		vo.setJoindate(joindate);
		vo.setGrade(grade);
		vo.setCity(city);
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.update(vo);
		response.sendRedirect("list.do");	}

}
