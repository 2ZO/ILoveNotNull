package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.TeacherDAO;

public class Create_TeacherController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String name=request.getParameter("teacherName");
		String nick=request.getParameter("teacherNick");
		String profile=request.getParameter("teacherProfile");
		String imgURL=request.getParameter("teacherImgURL");
		TeacherDAO.getInstance().AddTeacher(name,nick,profile,imgURL);
		
		return "redirect:admin_ver2/admin.jsp";
	}

}
