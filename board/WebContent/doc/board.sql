create table board(
  num int(45) AUTO_INCREMENT primary key,
  id varchar(200),-- ���̵�
  subject varchar(200),
  content varchar(200),
  area varchar(200),  -- �̸���
  performtime varchar(200),
  performdate varchar(200),
  performlocation varchar(200),
  type varchar(200),
  email varchar(200),
  imgpath varchar(200),
  boarddate date, -- ��������
  score int(20)
  )