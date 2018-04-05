package org.kosta.model.VO;

public class ProgramVO {
	private String programNo;
	private String programName;
	private String programDetail;
	public ProgramVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProgramVO(String programNo, String programName) {
		super();
		this.programNo = programNo;
		this.programName = programName;
	}
	public ProgramVO(String programNo, String programName, String programDetail) {
		super();
		this.programNo = programNo;
		this.programName = programName;
		this.programDetail = programDetail;
	}
	public String getProgramNo() {
		return programNo;
	}
	public void setProgramNo(String programNo) {
		this.programNo = programNo;
	}
	public String getProgramName() {
		return programName;
	}
	public void setProgramName(String programName) {
		this.programName = programName;
	}
	public String getProgramDetail() {
		return programDetail;
	}
	public void setProgramDetail(String programDetail) {
		this.programDetail = programDetail;
	}
	@Override
	public String toString() {
		return "ProgramVO [programNo=" + programNo + ", programName=" + programName + ", programDetail=" + programDetail
				+ "]";
	}
}
