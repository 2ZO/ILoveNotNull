package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.MemberDAO;
import org.kosta.model.VO.MemberVO;

public class Update_MyInfoController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null) {
			return "Member/noSession.jsp";
		} else{
			MemberVO mvo=(MemberVO)session.getAttribute("memberVO");
			if(mvo==null) {
				return "Member/MyInfoCheck_fail.jsp";
			} else {
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String password_question = request.getParameter("password_question");
				String password_answer = request.getParameter("password_answer");
				String name = request.getParameter("name");
				String address = request.getParameter("address");
				String email = request.getParameter("email");
				String phone_number = request.getParameter("phoneNumber");
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPassword(password);
				vo.setPassword_question(password_question);
				vo.setPassword_answer(password_answer);
				vo.setName(name);
				vo.setAddress(address);
				vo.setEmail(email);
				vo.setPhone_number(phone_number);
				MemberDAO.getInstance().updateMyInfo(vo);
				session.setAttribute("MemberVO", vo);
				request.setAttribute("url","/Member/MyInfoModify.jsp");
				return "Template/layout.jsp";
			}
		}
	}
}
