package org.kosta.model.VO;

public class ProgramVO {
	private String classNo;
	private String teacherId;
	private String subjectNo;
	private String classTime;
	private String classDay;
	private String capacity;

	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}

	public String getClassDay() {
		return classDay;
	}

	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public ProgramVO(String classNo, String teacherId, String subjectNo, String classTime, String classDay,
			String capacity) {
		super();
		this.classNo = classNo;
		this.teacherId = teacherId;
		this.subjectNo = subjectNo;
		this.classTime = classTime;
		this.classDay = classDay;
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "ClassVO [classNo=" + classNo + ", teacherId=" + teacherId + ", subjectNo=" + subjectNo + ", classTime="
				+ classTime + ", classDay=" + classDay + ", capacity=" + capacity + "]";
	}

	public ProgramVO() {
		super();
	}
}
