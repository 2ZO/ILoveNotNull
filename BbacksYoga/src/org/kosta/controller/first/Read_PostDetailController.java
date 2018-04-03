package org.kosta.controller.first;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.PostDAO;
import org.kosta.model.VO.PostVO;

public class Read_PostDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String postNo= request.getParameter("postNo");
		HttpSession session = request.getSession();
		//로그인 안한사람 out
		if(session==null || session.getAttribute("memberVO")==null) {
			return "redirect:index.jsp";
		}else {
			PostVO post = PostDAO.getInstance().getPostDetailByPostNo(postNo);
			request.setAttribute("postVO", post);
			request.setAttribute("url", "/Post/PostDetail.jsp");
		}
		return "index.jsp";
	}

}
