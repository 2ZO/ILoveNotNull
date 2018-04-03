package org.kosta.controller.second;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ClassDAO;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.DAO.TeacherDAO;
import org.kosta.model.VO.ClassVO;
import org.kosta.model.VO.ProgramVO;
import org.kosta.model.VO.TeacherVO;

public class Read_AddClassViewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ProgramVO> plist=ProgramDAO.getInstance().getProgramList();
		//강사 리스트를 arraylist형태로 불러옴 (선생님id, 이름, 닉네임까지만 불러옴)
		request.setAttribute("programList", plist);
		ArrayList<TeacherVO> tlist=TeacherDAO.getInstance().getTeacherList();
		//프로그램 리스트가 완료되면 classVO에 담아서 보내면 됨
		ArrayList<ClassVO> classList = ClassDAO.getInstance().getClassList();
		request.setAttribute("teacherList", tlist);
		request.setAttribute("classList", classList);
		request.setAttribute("url", "/admin_ver2/Create_AddClass.jsp");
		return "index.jsp";
	}

}
