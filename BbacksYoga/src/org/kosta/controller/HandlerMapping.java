package org.kosta.controller;

import org.kosta.controller.first.Create_PostController;
import org.kosta.controller.first.Create_PostControllerView;
import org.kosta.controller.first.Create_RegisterController;
import org.kosta.controller.first.Read_BoardController;
import org.kosta.controller.first.Read_LoginController;
import org.kosta.controller.first.Read_MemberByEmailController;
import org.kosta.controller.first.Read_MemberByIdController;
import org.kosta.controller.first.Read_ModifyPostView;
import org.kosta.controller.first.Read_PostDetailController;
import org.kosta.controller.first.Update_PostController;
import org.kosta.controller.second.Create_ClassController;
import org.kosta.controller.second.Create_ProgramController;
import org.kosta.controller.second.Create_ProgramImgController;
import org.kosta.controller.second.Create_TeacherController;
import org.kosta.controller.second.Read_AddClassViewController;
import org.kosta.controller.second.Read_MyInfoCheckController;
import org.kosta.controller.second.Read_ProgramDetailController;
import org.kosta.controller.second.Read_ProgramListController;
import org.kosta.controller.second.Read_TeacherDetailController;
import org.kosta.controller.second.Read_TeacherListController;
import org.kosta.controller.second.Update_MyInfoController;
import org.kosta.controller.second.Update_MyInfoPreviewController;
import org.kosta.controller.third.Create_NewRegisterClassController;
import org.kosta.controller.third.Create_RegisterClassController;
import org.kosta.controller.third.Create_TimeTableController;
import org.kosta.controller.third.Delete_RegisterClassController;
import org.kosta.controller.third.Delete_TimeTableController;
import org.kosta.controller.third.Read_AdminTimeTableController;
import org.kosta.controller.third.Read_CheckOverlapClassController;
import org.kosta.controller.third.Read_RegisterController;
import org.kosta.controller.third.Read_TimeTableController;
import org.kosta.controller.third.Update_TimeTableController;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {
		Controller c = null;
					//1조~
		if (command.equals("LogIn")) {
			c = new Read_LoginController();
		}else if (command.equals("register")) {	
			c = new Create_RegisterController();
		}else if (command.equals("getMemberById")) {	
			c = new Read_MemberByIdController();
		}else if (command.equals("getMemberByEmail")) {	
			c = new Read_MemberByEmailController();
		}  else if (command.equals("postWrite")) {
			c = new Create_PostController();
		} else if(command.equals("writePostView")) { //임시 글쓰기 확인하려고
			c = new Create_PostControllerView();
		} else if(command.equals("modifyPostView")) { // 게시글 수정시 기존 데이터 불러오기
			c = new Read_ModifyPostView();
		}else if (command.equals("postModify")) {
			c = new Update_PostController();
		} else if (command.equals("getDetailPost")) {
			c = new Read_PostDetailController();
		} else if (command.equals("postList")) {
			c = new Read_BoardController();
		}else if(command.equals("deletePost")) { // 글쓰기 삭제
			c = new Delete_BoardController();
					//2조~
		} else if (command.equals("teacherList")) {
			c = new Read_TeacherListController();
		} else if (command.equals("teacherDetail")) {
			c = new Read_TeacherDetailController();
		} else if (command.equals("programList")) {
			c = new Read_ProgramListController();
		} else if (command.equals("programDetail")) {
			c = new Read_ProgramDetailController();
		} else if (command.equals("passwordCheck")) {
			c = new Read_MyInfoCheckController();
		} else if (command.equals("updateMyInfo")) {
			c = new Update_MyInfoController();
		} else if (command.equals("updateMyInfoPreview")) {
			c = new Update_MyInfoPreviewController();
		} else if (command.equals("addTeacher")) { //강사등록
			c = new Create_TeacherController();
		} else if (command.equals("addProgram")) {
			c = new Create_ProgramController();
		} else if (command.equals("addProgramImg")) { // 프로그램 이미지 등록
			c = new Create_ProgramImgController();
		} else if (command.equals("addclass")) {
			c = new Create_ClassController();
		}else if(command.equals("addClassView")) { //강좌등록시 강사, 프로그램 데이터를 불러옴
			c = new Read_AddClassViewController();
		}
		//3조
		else if (command.equals("Create_RegisterClass")) {
			c = new Create_RegisterClassController();
		} else if (command.equals("Read_Timetable")) {
			c = new Read_TimeTableController();
		} else if (command.equals("Read_Register")) {
			c = new Read_RegisterController();
		} else if (command.equals("Delete_Register")) {
			c = new Delete_RegisterClassController();
		} else if (command.equals("시간표 등록")) {
			c = new Create_TimeTableController();
		} else if (command.equals("관리자 시간표 리스트 받기")) {
			c = new Read_AdminTimeTableController();
		} else if (command.equals("시간표 수정")) {
			c = new Update_TimeTableController();
		} else if (command.equals("시간표 삭제")) {
			c = new Delete_TimeTableController();
		} else if (command.equals("addTeacher")) { 
			c = new Create_TeacherController();
		}  else if(command.equals("checkOverlapClass")) {
			c= new Read_CheckOverlapClassController();
		} else if (command.equals("Create_NewRegisterClass")) {
			c = new Create_NewRegisterClassController();
		}
		//Paging Controller
		else if(command.equals("page")) {
			c= new PageController();
		}else {
			System.out.println("매핑오타났다 반성하고 고쳐라~~");
		}
		return c;
	}
}
