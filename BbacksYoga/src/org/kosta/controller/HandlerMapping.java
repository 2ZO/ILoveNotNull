package org.kosta.controller;

import org.kosta.controller.first.Create_PostController;
import org.kosta.controller.first.Create_RegisterController;
import org.kosta.controller.first.Read_BoardController;
import org.kosta.controller.first.Read_LoginController;
import org.kosta.controller.first.Read_PostDetailController;
import org.kosta.controller.first.Update_PostController;
import org.kosta.controller.second.Create_ClassController;
import org.kosta.controller.second.Create_ProgramController;
import org.kosta.controller.second.Create_TeacherController;
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
		// 1��~
		/*if (command.equals("�α���")) {
			c = new Read_LoginController();
		} else if (command.equals("ȸ�����")) {
			c = new Create_RegisterController();
		} else if (command.equals("�Խñ۾���")) {
			c = new Create_PostController();
		} else if (command.equals("�Խñۼ���")) {
			c = new Update_PostController();
		} else if (command.equals("�Խñ� �󼼺���")) {
			c = new Read_PostDetailController();
		} else if (command.equals("�Խ��� ����Ʈ")) {
			c = new Read_BoardController();
			// 2��~
		} else if (command.equals("������ ����Ʈ")) {
			c = new Read_TeacherListController();
		} else if (command.equals("������ ��")) {
			c = new Read_TeacherDetailController();
		} else if (command.equals("���α׷� ����Ʈ")) {
			c = new Read_ProgramListController();
		} else if (command.equals("���α׷� ��")) {
			c = new Read_ProgramDetailController();
		} else if (command.equals("������ �н����� üũ")) {
			c = new Read_MyInfoCheckController();
		} else if (command.equals("������ ����")) {
			c = new Update_MyInfoController();
		} else if (command.equals("������ ���")) {
			c = new Create_TeacherController();
		} else if (command.equals("���α׷� ���")) {
			c = new Create_ProgramController();
		} else if (command.equals("���� ����")) {
			c = new Create_ClassController();
		} // 3��!
		else if (command.equals("���� ��û")) {
			c = new Create_RegisterClassController();
		} else if (command.equals("��ü �ð�ǥ ����Ʈ �ޱ�")) {
			c = new Read_TimeTableController();
		} else if (command.equals("���� ��Ȳ")) {
			c = new Read_RegisterController();
		} else if (command.equals("���� ���")) {
			c = new Delete_RegisterClassController();
		} else if (command.equals("�ð�ǥ ���")) {
			c = new Create_TimeTableController();
		} else if (command.equals("������ �ð�ǥ ����Ʈ �ޱ�")) {
			c = new Read_AdminTimeTableController();
		} else if (command.equals("�ð�ǥ ����")) {
			c = new Update_TimeTableController();
		} else if (command.equals("�ð�ǥ ����")) {
			c = new Delete_TimeTableController();
		} else*/ if (command.equals("addTeacher")) {
			c = new Create_TeacherController();
		} else {
			System.out.println("없는 컨트롤러여유");
		}
		return c;
	}
}
