package org.kosta.controller;

import org.kosta.controller.first.Create_PostController;
import org.kosta.controller.first.Create_PostControllerView;
import org.kosta.controller.first.Create_RegisterController;
import org.kosta.controller.first.Read_BoardController;
import org.kosta.controller.first.Read_LoginController;
import org.kosta.controller.first.Read_PostDetailController;
import org.kosta.controller.first.Update_PostController;
import org.kosta.controller.first.ViewController_Register;
import org.kosta.controller.second.Create_ClassController;
import org.kosta.controller.second.Create_ProgramController;
import org.kosta.controller.second.Create_TeacherController;
import org.kosta.controller.second.Read_AddClassViewController;
import org.kosta.controller.second.Read_MyInfoCheckController;
import org.kosta.controller.second.Read_ProgramDetailController;
import org.kosta.controller.second.Read_ProgramListController;
import org.kosta.controller.second.Read_TeacherDetailController;
import org.kosta.controller.second.Read_TeacherListController;
import org.kosta.controller.second.Update_MyInfoController;
import org.kosta.controller.third.Create_RegisterClassController;
import org.kosta.controller.third.Create_TimeTableController;
import org.kosta.controller.third.Delete_RegisterClassController;
import org.kosta.controller.third.Delete_TimeTableController;
import org.kosta.controller.third.Read_AdminTimeTableController;
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
		} else if (command.equals("RegisterView")) {
			c = new ViewController_Register();
		}else if (command.equals("회원등록")) {	
			c = new Create_RegisterController();
		} else if (command.equals("postWrite")) {
			c = new Create_PostController();
		} else if(command.equals("writePostView")) { //임시 글쓰기 확인하려고
			c = new Create_PostControllerView();
		}		
		else if (command.equals("게시글수정")) {
			c = new Update_PostController();
		} else if (command.equals("게시글 상세보기")) {
			c = new Read_PostDetailController();
		} else if (command.equals("게시판 리스트")) {
			c = new Read_BoardController();
					//2조~
		} else if (command.equals("teacherList")) {
			c = new Read_TeacherListController();
		} else if (command.equals("teacherDetail")) {
			c = new Read_TeacherDetailController();
		} else if (command.equals("프로그램 리스트")) {
			c = new Read_ProgramListController();
		} else if (command.equals("프로그램 상세")) {
			c = new Read_ProgramDetailController();
		} else if (command.equals("내정보 패스워드 체크")) {
			c = new Read_MyInfoCheckController();
		} else if (command.equals("내정보 수정")) {
			c = new Update_MyInfoController();
		} else if (command.equals("addTeacher")) { //강사등록
			c = new Create_TeacherController();
		} else if (command.equals("createProgram")) {
			c = new Create_ProgramController();
		} else if (command.equals("강좌등록")) {
			c = new Create_ClassController();
		}else if(command.equals("addClassView")) { //강좌등록시 강사, 프로그램 데이터를 불러옴
			c = new Read_AddClassViewController();
		}
		//3조
		else if (command.equals("강좌신청")) {
			c = new Create_RegisterClassController();
		} else if (command.equals("전체 시간표 리스트 받기")) {
			c = new Read_TimeTableController();
		} else if (command.equals("수강현황")) {
			c = new Read_RegisterController();
		} else if (command.equals("수강취소")) {
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
		}else {
			System.out.println("매핑오타났다 반성하고 고쳐라~~");
		}
		return c;
	}
}
