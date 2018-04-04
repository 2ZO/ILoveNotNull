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
//관리자용 뷰 컨트롤러
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String option=request.getParameter("option");
		ArrayList<TeacherVO> tlist=null;
		ArrayList<ClassVO> classList =null;
		ArrayList<ProgramVO> plist= null;
		//옵션을 파라미터로 받아서
		//클래스/티쳐/프로그램 리스트를 여기서 골라서 뽑아간다
		if(option.equals("class")) {
			classList= ClassDAO.getInstance().getClassList();
			request.setAttribute("classList", classList);
			request.setAttribute("url", "/admin_ver2/Create_AddClass.jsp");
		}else if(option.equals("teacher")) {
			tlist=TeacherDAO.getInstance().getTeacherList();
			request.setAttribute("teacherList", tlist);
			request.setAttribute("url", "/admin_ver2/Create_AddTeacher.jsp");
		}else if(option.equals("program")){
			plist=ProgramDAO.getInstance().getProgramList();
			System.out.println(plist.get(0).getProgramDetail());
			request.setAttribute("programList", plist);
			request.setAttribute("url", "/admin_ver2/Create_AddProgram.jsp");
		}else {
			System.out.println("스펠링체크");
		}
		return "index.jsp";
	}

}
