create table board(
  num int(20) AUTO_INCREMENT primary key,-- ��ȣ
  id varchar(20),-- ���̵� 
  subject varchar(200), -- ����
  content varchar(200), -- ����
  email varchar(200), -- �����ּ�
  boarddate date, -- �ۼ�����
  score int(20) -- ��ȸ ��
  );