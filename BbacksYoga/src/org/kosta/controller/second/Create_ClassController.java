package org.kosta.controller.second;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.DAO.TeacherDAO;
import org.kosta.model.VO.ProgramVO;
import org.kosta.model.VO.TeacherVO;

public class Create_ClassController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//ArrayList<ProgramVO> plist=ClassDAO.getInstance().getProgramList();
				//강사 리스트를 arraylist형태로 불러옴 (선생님id, 이름, 닉네임까지만 불러옴)
				ArrayList<TeacherVO> tlist=TeacherDAO.getInstance().getTeacherList();
				System.out.println(tlist.get(0));
				
				//프로그램 리스트를 arrylist형태로 불러옴
				//ArrayList<ProgramVO> plist=ProgramDAO.getInstance().;
				
				//프로그램 리스트가 완료되면 classVO에 담아서 보내면 됨
				//request.setAttribute("programList", plist);
				request.setAttribute("teacherList", tlist);
				return "admin_ver2/Create_AddClass.jsp";
	}

}
