package org.kosta.controller.second;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ClassDAO;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.DAO.TeacherDAO;
import org.kosta.model.VO.ProgramVO;
import org.kosta.model.VO.TeacherVO;

public class Create_ClassController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				String teacherId=request.getParameter("teacherId");
				String programId=request.getParameter("programId");
				String day=request.getParameter("day");
				String time=request.getParameter("time");
				String capacity=request.getParameter("capacity");
				ClassDAO.getInstance().createClass(teacherId,programId,day,time,capacity);
				return "redirect:admin_ver2/admin.jsp";
	}

}
