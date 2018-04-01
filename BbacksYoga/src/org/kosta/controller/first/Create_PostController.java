package org.kosta.controller.first;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.PostDAO;
import org.kosta.model.VO.MemberVO;

public class Create_PostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		MemberVO mvo=(MemberVO)session.getAttribute("memberVO");
		String id=mvo.getId();
		if(mvo.getId()==null)
			id="visitor";
		return "redirect:index.jsp";
	}

}
