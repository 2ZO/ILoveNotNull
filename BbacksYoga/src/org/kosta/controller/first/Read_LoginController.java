package org.kosta.controller.first;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.MemberDAO;
import org.kosta.model.VO.MemberVO;

public class Read_LoginController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("userId");
		String password = request.getParameter("userPassword");
		MemberVO vo = MemberDAO.getInstance().LogIn(id, password);
		HttpSession session = request.getSession();
		if (vo == null) {
			return "redirect:Member/Login_fail.jsp";
		} else {
			session.setAttribute("memberVO", vo);
			session.setAttribute("url", "/Template/center.jsp");
			return "redirect:index.jsp";
		}
	}

}
