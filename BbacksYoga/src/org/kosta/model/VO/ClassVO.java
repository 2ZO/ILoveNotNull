package org.kosta.model.VO;

public class ClassVO {
//����+���α׷�
	private TeacherVO teacher;
	private ProgramVO program;
	public TeacherVO getTeacher() {
		return teacher;
	}
	public void setTeacher(TeacherVO teacher) {
		this.teacher = teacher;
	}
	public ProgramVO getProgram() {
		return program;
	}
	public void setProgram(ProgramVO program) {
		this.program = program;
	}
	@Override
	public String toString() {
		return "ClassVO [teacher=" + teacher + ", program=" + program + "]";
	}
	public ClassVO(TeacherVO teacher, ProgramVO program) {
		super();
		this.teacher = teacher;
		this.program = program;
	}
	public ClassVO() {
		super();
	}
		
}
