DROP TABLE REPLY;
DROP TABLE NOTICE;
DROP TABLE REVIEW;
DROP TABLE QNA;
DROP TABLE RESERVATION;
DROP TABLE GUESTROOM;
DROP TABLE NONMEMBER;
DROP TABLE MEMBER;

CREATE TABLE MEMBER 
(
    MNO NUMBER PRIMARY KEY,
    MID VARCHAR2(2000) NOT NULL UNIQUE,
    MPW VARCHAR2(2000) NOT NULL,
    MNAME VARCHAR2(2000) NOT NULL,
    MPHONE VARCHAR2(2000) NOT NULL,
    MEMAIL VARCHAR2(2000),
    MADDR1 VARCHAR2(2000), 
    MADDR2 VARCHAR2(2000), 
    MZipcode NUMBER, 
    MREGDATE DATE,
    MGRADE NUMBER, 
    MPOINT NUMBER, 
    MISWITHDRAWAL NUMBER, 
    MRIGHT NUMBER
);

CREATE TABLE NONMEMBER
(
	NMID VARCHAR2(2000) PRIMARY KEY,
	NMNAME VARCHAR2(2000) NOT NULL,
	NMPHONE VARCHAR2(2000) UNIQUE
);

CREATE TABLE GUESTROOM
(
    GNO NUMBER PRIMARY KEY,
    GNAME VARCHAR2(2000) NOT NULL UNIQUE,
    GPRICE NUMBER,
    GMINPEOPLE NUMBER,
    GMAXPEOPLE NUMBER,
    GROOMSIZE NUMBER,
    GEXPLAIN VARCHAR2(2000),
    GTHUMBNAIL VARCHAR2(2000),
    GIMGCOUNT NUMBER
);

CREATE TABLE RESERVATION
(
    RNO NUMBER PRIMARY KEY,
    GNO NUMBER REFERENCES GUESTROOM (GNO),
    MNO NUMBER REFERENCES MEMBER (MNO),
    NMID VARCHAR2(2000) REFERENCES NONMEMBER (NMID),
    RAPPROVAL NUMBER,   
    RPEOPLE NUMBER,   
    RPRICE NUMBER,   
    RCHECKIN DATE, 
    RCHECKOUT DATE
);

CREATE TABLE QNA
(
    QNO NUMBER PRIMARY KEY,
    MID VARCHAR2(2000) REFERENCES MEMBER (MID),
    NMNAME VARCHAR2(2000),
    QTITLE VARCHAR2(2000),
    QPW VARCHAR2(2000),
    QCONTENT VARCHAR2(2000),
    QISDELETE NUMBER, 
    QNOTICEDATE DATE
);


CREATE TABLE REVIEW
(
    RNO NUMBER PRIMARY KEY,
    RTITLE VARCHAR2(2000),
    RCONTENT VARCHAR2(2000),
    MID VARCHAR2(2000) REFERENCES MEMBER (MID),
    RFILENAME VARCHAR2(200),
    RREF NUMBER,
    RSTEP NUMBER,
    RDEPTH NUMBER,
    RISDELETE NUMBER,
    RRATING NUMBER,
    GNAME VARCHAR2(2000) REFERENCES GUESTROOM (GNAME),
    RREGDATE DATE
);


CREATE TABLE NOTICE
(
    NNO NUMBER PRIMARY KEY,
    MNO NUMBER REFERENCES MEMBER (MNO),
    NTITLE VARCHAR2(2000),
    NCONTENT VARCHAR2(2000),
    NFILENAME VARCHAR2(2000),
    NIMG VARCHAR2(2000),
    NHIT NUMBER,
    NISDELETE NUMBER,
    NNOTICEDATE DATE
);


CREATE TABLE REPLY
(
	RENO NUMBER PRIMARY KEY,
	MID VARCHAR2(2000) REFERENCES MEMBER (MID),
	RECONTENT VARCHAR2(2000) NOT NULL,
	QNO NUMBER REFERENCES QNA (QNO),
	RNO NUMBER REFERENCES REVIEW (RNO),
	RECATEGORY NUMBER NOT NULL,
	RENOTICEDATE DATE
);

DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE NONMEMBER_SEQ;
CREATE SEQUENCE NONMEMBER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

DROP SEQUENCE GUESTROOM_SEQ;
CREATE SEQUENCE GUESTROOM_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE REPLY_SEQ;
CREATE SEQUENCE REPLY_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE RESERVATION_SEQ;
CREATE SEQUENCE RESERVATION_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

DROP SEQUENCE REVIEWBOARD_SEQ;
CREATE SEQUENCE REVIEWBOARD_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

DROP SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999
NOCYCLE
NOCACHE;


INSERT INTO MEMBER (MNO, MID, MPW, MNAME, MPHONE, MEMAIL, MADDR1, MADDR2, MZipcode, MREGDATE, MGRADE, MPOINT, MISWITHDRAWAL, MRIGHT)
VALUES (MEMBER_SEQ.NEXTVAL, 'admin','1111','관리자','010-1111-1111','admin@com.com','서울 마포구 서강로 136','아이비타워 2,3층', 04100, SYSDATE,0,0,0,1);
INSERT INTO MEMBER (MNO, MID, MPW, MNAME, MPHONE, MEMAIL, MADDR1, MADDR2, MZipcode, MREGDATE, MGRADE, MPOINT, MISWITHDRAWAL, MRIGHT)
VALUES (MEMBER_SEQ.NEXTVAL, 'admin22','1111','관리자','010-1111-1111','admin@com.com','서울 마포구 서강로 136','아이비타워 2,3층', 04100, SYSDATE,0,0,0,1);

INSERT INTO GUESTROOM(GNO, GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE, GROOMSIZE, GEXPLAIN, GTHUMBNAIL, GIMGCOUNT)
VALUES (GUESTROOM_SEQ.NEXTVAL, 'A101', 200000, 4, 10, 35, '여유있는 공간, 더블베드와 싱글베드를 제공하여 3인 가족, 친구와 함께 이용하실 수 있습니다.', 'A101Shumbnail', 4);
INSERT INTO GUESTROOM(GNO, GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE, GROOMSIZE, GEXPLAIN, GTHUMBNAIL, GIMGCOUNT)
VALUES (GUESTROOM_SEQ.NEXTVAL, 'A102', 200000, 4, 10, 35, '여유있는 공간, 더블베드와 싱글베드를 제공하여 3인 가족, 친구와 함께 이용하실 수 있습니다.', 'A102Shumbnail', 4);
INSERT INTO GUESTROOM(GNO, GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE, GROOMSIZE, GEXPLAIN, GTHUMBNAIL, GIMGCOUNT)
VALUES (GUESTROOM_SEQ.NEXTVAL, 'B201', 120000, 2, 4, 18, '여행의 가치를 추구하는 연인, 친구, 가족 2인형 여행객들에게 적합한 더블타입 베드를 제공합니다.', 'B201Shumbnail', 4);
INSERT INTO GUESTROOM(GNO, GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE, GROOMSIZE, GEXPLAIN, GTHUMBNAIL, GIMGCOUNT)
VALUES (GUESTROOM_SEQ.NEXTVAL, 'B202', 150000, 2, 6, 25, '안정감있고 아늑한 인테리어가 특징이며, 싱글베드 2개가 준비되어 있습니다.', 'B202Shumbnail', 4);
INSERT INTO GUESTROOM(GNO, GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE, GROOMSIZE, GEXPLAIN, GTHUMBNAIL, GIMGCOUNT)
VALUES (GUESTROOM_SEQ.NEXTVAL, 'C301', 280000, 6, 12, 45, '더블베드2개를 제공하여 가족과 친구들이 함께 쾌적하게 이용하실 수 있는 타입입니다.', 'C301Shumbnail', 4);


COMMIT