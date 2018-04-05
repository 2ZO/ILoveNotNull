package org.kosta.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CreatePostImageController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ServletContext ctx=request.getServletContext();
		String savePath=ctx.getRealPath("Image/postImg");	//저장 폴더명
		int maxPostSize=10*1024*1024;	//10MB
		String format="UTF-8";	
		String workspacePath="C:\\Users\\User\\git\\ILoveNotNull\\BbacksYoga\\WebContent\\Image\\postImg";
		MultipartRequest req=new MultipartRequest(request,savePath,maxPostSize,format,new DefaultFileRenamePolicy());
		System.out.println(savePath);	
		
		//파일명
		String oriFileName=req.getOriginalFileName("postImg");
		System.out.println(oriFileName);
		JSONObject json = null;
		if(oriFileName == null) {
			json= new JSONObject().put("flag", "false"); //클래스가 없으면 false반환
		}else{
			json= new JSONObject().put("fileName", oriFileName);						
		}
		request.setAttribute("responseBody", json);
		return "AjaxView";
	}

}
