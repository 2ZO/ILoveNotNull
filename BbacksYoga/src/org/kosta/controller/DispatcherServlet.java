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
	 * client?�� command�? 반환받는?��
	 * HandlerMapping?�� ?��?��?�� 컨트롤러 구현체�?? 반환받는?�� 
	 * 컨트롤러 구현체의 ?���??��?�� 메서?���? ?��?��?�� ?�� 
	 * 반환?��?�� url ?��보�?? 받는?��. 
	 * 컨트롤러 구현체�? 명시?�� ?��?��방식�? url ?�� ?��거해 
	 * View�? ?��?��?��?�� ( redirect or forward ) 
	 * 컨트롤러 구현체�? ?��?��?��?�� ?��중에 발생?��?�� 모든 Exception?��
	 * ???�� error.jsp�? redirect ?��?���? 처리?��?��. 
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
