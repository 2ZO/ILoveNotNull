package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.TeacherDAO;

public class Create_TeacherController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//선생님 정보를 받은 값을 별도의 변수에 입력
		String name=request.getParameter("teacherName");
		String nick=request.getParameter("teacherNick");
		String profile=request.getParameter("teacherProfile");
		String imgURL=request.getParameter("teacherImgURL");
		
		//sql 통해서 table에 입력
		TeacherDAO.getInstance().AddTeacher(name,nick,profile,imgURL);
				
		//redirect로 
		return "redirect:admin_ver2/admin.jsp";
	}

}
