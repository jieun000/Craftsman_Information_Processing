package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TableADAO;
import com.vo.TableAVO;

@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		TableADAO dao = TableADAO.getInstance();
		TableAVO vo = dao.detail(no);
		
		request.setAttribute("detail", vo);

		request.getRequestDispatcher("update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		TableAVO vo = new TableAVO();
		vo.setNo(no);
		vo.setName(name);
		vo.setAge(age);
		
		TableADAO dao = TableADAO.getInstance();
		dao.update(vo);
		
		response.sendRedirect("list.do");
	}
}
