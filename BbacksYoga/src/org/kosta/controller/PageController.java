package org.kosta.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=request.getParameter("url");
		System.out.println(url);
		request.setAttribute("url", url);
		return "Template/layout.jsp";
	}

}
