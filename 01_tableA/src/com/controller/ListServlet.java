package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TableADAO;
import com.vo.TableAVO;

@WebServlet("/list.do")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TableADAO dao = TableADAO.getInstance();
		List<TableAVO> list = new ArrayList<TableAVO>();
		
		list = dao.listAll();
		request.setAttribute("lists", list);
		
		request.getRequestDispatcher("list.jsp")
				.forward(request, response);
	}
}
