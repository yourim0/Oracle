CREATE TABLE member (
	id	varchar2(10)		NOT NULL,
	pass	varchar2(10)		NOT NULL,
	name	varchar2(30)		NOT NULL,
	regidate	date	DEFAULT sysdate	NOT NULL
);

CREATE TABLE board (
	num	number		NOT NULL,
	title	varchar2(200)		NOT NULL,
	content	varchar2(2000)		NOT NULL,
	id	varchar2(10)		NOT NULL,
	postdate	date	DEFAULT sysdate	NOT NULL,
	visitcount	number(6)		NULL

);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	id
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	num
);

ALTER TABLE board ADD CONSTRAINT FK_member_TO_board_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

--������ ����

CREATE SEQUENCE seq_board_num
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    NOMAXVALUE 
    NOCYCLE
    NOCACHE;
    
--���� ������

INSERT INTO member(id, pass, name) values ('musthave', '1234', '�ӽ�Ʈ�غ�'); 

INSERT INTO board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����1�Դϴ�', '����1�Դϴ�', 'musthave', sysdate, 0);
    
    
DROP TABLE board;
DROP TABLE member;

SELECT * FROM member;
SELECT * FROM board;

commit;
