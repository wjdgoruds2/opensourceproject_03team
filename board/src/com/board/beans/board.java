package com.board.beans;

public class board {
	//번호
	private int num;
	
	//제목
	private String subject;
	
	//내용
	private String content;
	
	//아이디
	private String id;
	
	//이메일
	private String email;
	
	//작성일자
	private String boarddate;
	
	//조회수
	private String score;
	
	//검색옵션
	public String opt;
	
	//img경로
	private String imgpath;
	
	//검색내용
	public String condition;
	private String area;
	private String performtime;
	private String performdate;
	private String performlocation;
	private String type;
	
	
	public String getimgpath() {
		return imgpath;
	}
	public void setimgpath(String imgpath) {
		this.imgpath = imgpath;
	}
		
	public String getOpt() {
		return opt;
	}
	public void setOpt(String opt) {
		this.opt = opt;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(String boarddate) {
		this.boarddate = boarddate;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPerformtime() {
		return performtime;
	}
	public void setPerformtime(String performtime) {
		this.performtime = performtime;
	}
	public String getPerformdate() {
		return performdate;
	}
	public void setPerformdate(String performdate) {
		this.performdate = performdate;
	}
	public String getPerformlocation() {
		return performlocation;
	}
	public void setPerformlocation(String performlocation) {
		this.performlocation = performlocation;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

	
}
