package com.board.beans;

public class reply {
	//��ȣ
	private int count;
	
	//���� ����
	private String subject;
	//����
	private String title;
	//����
	private String content;
	
	
	//���̵�
	private String id;
	
	//�̸���
	private String email;
	
	//�ۼ�����
	private String boarddate;
	
	

	
	public int getcount() {
		return count;
	}
	public void setcount(int count) {
		this.count = count;
	}
	
	   
	   
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
		
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
}
