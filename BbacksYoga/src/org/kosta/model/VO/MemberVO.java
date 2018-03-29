package org.kosta.model.VO;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String phone_number;
	private String address;
	private String email;
	private String password_question;
	private String password_answer;
	private String regDate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword_question() {
		return password_question;
	}

	public void setPassword_question(String password_question) {
		this.password_question = password_question;
	}

	public String getPassword_answer() {
		return password_answer;
	}

	public void setPassword_answer(String password_answer) {
		this.password_answer = password_answer;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone_number=" + phone_number
				+ ", address=" + address + ", email=" + email + ", password_question=" + password_question
				+ ", password_answer=" + password_answer + ", regDate=" + regDate + "]";
	}

	public MemberVO(String id, String password, String name, String phone_number, String address, String email,
			String password_question, String password_answer, String regDate) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.address = address;
		this.email = email;
		this.password_question = password_question;
		this.password_answer = password_answer;
		this.regDate = regDate;
	}

	public MemberVO() {
		super();
	}

}
