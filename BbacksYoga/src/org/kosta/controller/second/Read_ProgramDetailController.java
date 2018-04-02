package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.VO.ProgramVO;

public class Read_ProgramDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int programNo = Integer.parseInt(request.getParameter("programNo"));
		ProgramVO vo = ProgramDAO.getInstance().getProgramListByNo(programNo);
		request.setAttribute("vo", vo);
		request.setAttribute("url", "/Class/ProgramDetail.jsp");
		return  "Template/layout.jsp";
	}

}
