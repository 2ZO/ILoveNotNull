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
	 * client? commandλ₯? λ°νλ°λ?€
	 * HandlerMapping? ?΄?©?΄ μ»¨νΈλ‘€λ¬ κ΅¬νμ²΄λ?? λ°νλ°λ?€ 
	 * μ»¨νΈλ‘€λ¬ κ΅¬νμ²΄μ ?μ€??? λ©μ?λ₯? ?€?? ? 
	 * λ°ν?? url ? λ³΄λ?? λ°λ?€. 
	 * μ»¨νΈλ‘€λ¬ κ΅¬νμ²΄κ? λͺμ? ?΄?λ°©μκ³? url ? ?κ±°ν΄ 
	 * Viewλ‘? ?΄???€ ( redirect or forward ) 
	 * μ»¨νΈλ‘€λ¬ κ΅¬νμ²΄κ? ?€??? ?μ€μ λ°μ?? λͺ¨λ  Exception?
	 * ???΄ error.jspλ‘? redirect ??λ‘? μ²λ¦¬??€. 
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
