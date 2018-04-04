package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.kosta.controller.Controller;
import org.kosta.model.DAO.ProgramDAO;
import org.kosta.model.VO.ProgramVO;

public class Read_ProgramDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int programNo = Integer.parseInt(request.getParameter("programNo"));
		ProgramVO vo = ProgramDAO.getInstance().getProgramListByNo(programNo);
		
		//ajax 이전 컨트롤러
		/*request.setAttribute("vo", vo);
		request.setAttribute("url", "/Class/ProgramDetail.jsp");
		return  "Template/layout.jsp";*/
		
		JSONObject json=null;	// return 값을 넣을 jsonObject 선언
		// 각각의 값을 jsonObject에 넣음
		json=new JSONObject().put("programList", vo);
		json.put("programName", vo.getProgramName());
		json.put("programDetail", vo.getProgramDetail());
		//ajaxview에 값을 넣은 josn을 반환
		request.setAttribute("responseBody", json);
		return "AjaxView";
	}
}
