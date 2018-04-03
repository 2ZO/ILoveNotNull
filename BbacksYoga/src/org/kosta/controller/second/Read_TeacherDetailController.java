package org.kosta.controller.second;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ClassDAO;
import org.kosta.model.DAO.TeacherDAO;
import org.kosta.model.VO.TeacherVO;

public class Read_TeacherDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String teacherId=request.getParameter("teacherId");
		TeacherVO tvo=TeacherDAO.getInstance().getTeacherInfobyId(teacherId);
		ArrayList<String> classList=ClassDAO.getInstance().getClassListById(teacherId);
		request.setAttribute("classList", classList);
		request.setAttribute("teacherInfo", tvo);
		request.setAttribute("url", "/Class/TeacherDetail.jsp");
		return "Template/layout.jsp";
	}

}
