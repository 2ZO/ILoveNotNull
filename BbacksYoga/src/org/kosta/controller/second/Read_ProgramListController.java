package org.kosta.controller.second;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.VO.ProgramVO;
import org.kosta.model.etc.PagingBean;

public class Read_ProgramListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ProgramVO> list = ProgramDAO.getInstance().getProgramList();
		int count = ProgramDAO.getInstance().getProgramListTotal();
		PagingBean pb = new PagingBean(count);
		request.setAttribute("pb", pb);
		request.setAttribute("list", list);
		request.setAttribute("url", "/Class/ProgramList.jsp");
		return  "Template/layout.jsp";
	}

}
