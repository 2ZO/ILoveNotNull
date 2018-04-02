package org.kosta.controller.first;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.PostDAO;
import org.kosta.model.VO.PostVO;
import org.kosta.model.etc.PagingBean;

public class Read_BoardController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int total=PostDAO.getInstance().getTotalPostCount();
		int nowpage=Integer.parseInt(request.getParameter("nowPage"));
		PagingBean pb=new PagingBean(nowpage,total);
		ArrayList<PostVO> list=PostDAO.getInstance().getPostingList();
		request.setAttribute("url", "/Post/QNA.jsp");
		
		request.setAttribute("list", list);
		
		
		return "Template/layout.jsp";
	}
}
