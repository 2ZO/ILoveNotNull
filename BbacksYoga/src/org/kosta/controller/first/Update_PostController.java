package org.kosta.controller.first;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.PostDAO;

public class Update_PostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String postNo=request.getParameter("postNo");
		String postTitle=request.getParameter("title");
		String postContent=request.getParameter("content");
		
		//내용 수정
		PostDAO.getInstance().UpdatePost(postNo,postTitle,postContent);
		
		//자신의 디테일 페이지로 다시가기
		String path="redirect:DispatcherServlet?command=getDetailPost&postNo="+postNo;
		
		return path;
	}

}
