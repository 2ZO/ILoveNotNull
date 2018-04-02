package org.kosta.controller.second;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.controller.Controller;
import org.kosta.model.DAO.ProgramDAO;

public class Create_TeacherController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String programName = request.getParameter("programName");
		String programDetail =request.getParameter("programDetail");
		ProgramDAO.getInstance().addProgram(programName, programDetail);
		return null;
	}

}
