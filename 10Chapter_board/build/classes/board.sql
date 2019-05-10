drop table board;

create table board(
   num INT(4)NOT NULL PRIMARY KEY,
   author VARCHAR2(20)NOT NULL,
   title  VARCHAR2(50)NOT NULL,
   content VARCHAR2(100)NOT NULL,
   writeday DATE  DEFAULT CURRENT_TIMESTAMP,
   readcnt INT(4) DEFAULT 0,
   repRoot  INT(4),
   repStep  INT(4),
   repIndent INT(4)
 );
 
drop sequence board_seq;
create sequence board_seq;

insert into board( num, author, title, content, repRoot, repStep, repIndent )
values ( board_seq.NEXTVAL , '1'', '해경' , 'ㅎㅇ' , board_seq.CURRVAL, 0 , 0 );
commit;