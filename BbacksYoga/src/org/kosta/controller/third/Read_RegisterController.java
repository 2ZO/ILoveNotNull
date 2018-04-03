package org.kosta.controller.third;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.RSDAO;
import org.kosta.model.VO.MemberVO;
import org.kosta.model.VO.RSVO;

public class Read_RegisterController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		MemberVO vo=(MemberVO) session.getAttribute("memberVO");//session값 받기
		if(session==null||vo==null) {
			return "/DispatcherServlet?command=page&url=/Member/Login.jsp";
		}
		ArrayList<RSVO> list=RSDAO.getInstance().Read_RegisteRStatus(vo.getId());
		request.setAttribute("registerStatus_list", list);
		request.setAttribute("url", "/TimeTable/RegisterStatus.jsp");
		return "/Template/layout.jsp";
	}
}
