package org.kosta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispatcherServlet
 */
@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispatcherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		requestProcess(request, response);
	}
	/**
	 * client?˜ commandë¥? ë°˜í™˜ë°›ëŠ”?‹¤
	 * HandlerMapping?„ ?´?š©?•´ ì»¨íŠ¸ë¡¤ëŸ¬ êµ¬í˜„ì²´ë?? ë°˜í™˜ë°›ëŠ”?‹¤ 
	 * ì»¨íŠ¸ë¡¤ëŸ¬ êµ¬í˜„ì²´ì˜ ?‘œì¤??™”?œ ë©”ì„œ?“œë¥? ?‹¤?–‰?•œ ?›„ 
	 * ë°˜í™˜?˜?Š” url ? •ë³´ë?? ë°›ëŠ”?‹¤. 
	 * ì»¨íŠ¸ë¡¤ëŸ¬ êµ¬í˜„ì²´ê? ëª…ì‹œ?•œ ?´?™ë°©ì‹ê³? url ?— ?˜ê±°í•´ 
	 * Viewë¡? ?´?™?•œ?‹¤ ( redirect or forward ) 
	 * ì»¨íŠ¸ë¡¤ëŸ¬ êµ¬í˜„ì²´ê? ?‹¤?–‰?˜?Š” ?„ì¤‘ì— ë°œìƒ?˜?Š” ëª¨ë“  Exception?—
	 * ???•´ error.jspë¡? redirect ?•˜?„ë¡? ì²˜ë¦¬?•œ?‹¤. 
	 */  
	public void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String command=request.getParameter("command");
			Controller c=HandlerMapping.getInstance().create(command);
			String url=c.execute(request, response);			
			if(url.startsWith("redirect:"))
				response.sendRedirect(url.substring(9));
			else
				request.getRequestDispatcher(url).forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}			
	}
}
