package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.MemberDAO;
import org.kosta.model.VO.MemberVO;

public class Read_MyInfoCheckController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		System.out.println((session==null));
		if(session==null) {
			return "Member/noSession.jsp";
		}else{
			MemberVO mvo=(MemberVO)session.getAttribute("memberVO");
			String id=mvo.getId();
			String password=request.getParameter("memberPassword");
			mvo=MemberDAO.getInstance().checkMyinfoById(id, password);
			if(mvo==null)
				return "Member/password_fail.jsp";
			else {
				request.setAttribute("MemberVO", mvo);
				request.setAttribute("url","/Member/MyInfoModify.jsp");
				return "Template/layout.jsp";
			}
		}
	}

}
