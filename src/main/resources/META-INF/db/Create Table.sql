-- DROP TABLE
DROP TABLE COMMENT;
DROP TABLE REVIEW;
DROP TABLE SUGGEST;
DROP TABLE NOTICE;
DROP TABLE QNA;
DROP TABLE FAQ;
DROP TABLE INFOMATION;
DROP TABLE PARK;  -- 11/17 ADD
DROP TABLE ADMIN;
DROP TABLE MEMBER;
 
-- DROP SEQUENCE
DROP SEQUENCE FAQ_SQ;
DROP SEQUENCE INFOMATION_SQ;
DROP SEQUENCE SUGGEST_SQ;
DROP SEQUENCE NOTICE_SQ;
DROP SEQUENCE QNA_SQ;
DROP SEQUENCE REVIEW_SQ;
DROP SEQUENCE COMMENT_SQ;

-- CREATE SEQUENCE
CREATE SEQUENCE FAQ_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE INFOMATION_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE SUGGEST_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE NOTICE_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE QNA_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE REVIEW_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE COMMENT_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

-- CREATE TABLE
CREATE TABLE MEMBER (
    ID VARCHAR2(50) PRIMARY KEY,
    PW VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(200) NOT NULL,
    PHONE VARCHAR2(50) NOT NULL,
    EMAIL VARCHAR2(200) NOT NULL,
    GENDER VARCHAR2(5) NOT NULL,
    BIRTH DATE NOT NULL,
    MRDATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE ADMIN (
    AID VARCHAR2(50) PRIMARY KEY,
    APW VARCHAR2(50) NOT NULL,
    ANAME VARCHAR2(50) NOT NULL,
    AGROUP VARCHAR2(200) NOT NULL,
    ARDATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE PARK ( -- 11/17 ADD
    PARKNAME VARCHAR2(50) PRIMARY KEY,
    PARKLOC VARCHAR2(200) NOT NULL,
    PARKTEL VARCHAR2(50) NOT NULL
);

CREATE TABLE NOTICE ( -- 11/17 MODIFY
    NNO NUMBER(6) PRIMARY KEY,
    AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    NTITLE VARCHAR2(200) NOT NULL,
    NTEXT CLOB NOT NULL,
    NDATE DATE DEFAULT SYSDATE NOT NULL,
    NHIT NUMBER(5) DEFAULT 0 NOT NULL,
    NFILE VARCHAR2(200),
    NIP VARCHAR2(20) NOT NULL
);

CREATE TABLE REVIEW (
    RNO NUMBER(6) PRIMARY KEY,
    ID VARCHAR2(50) REFERENCES MEMBER(ID) NOT NULL,
    RTITLE VARCHAR2(200) NOT NULL,
    RTEXT CLOB NOT NULL,
    RRDATE DATE DEFAULT SYSDATE NOT NULL,
    RHIT NUMBER(5) DEFAULT 0 NOT NULL,
    RIP VARCHAR2(20) NOT NULL
);

CREATE TABLE REVIEW_CMT (
    CNO NUMBER(6) PRIMARY KEY,
    RNO NUMBER(6) REFERENCES REVIEW(RNO) NOT NULL,
    CNAME VARCHAR2(50) NOT NULL,
    CMEMO VARCHAR2(4000) NOT NULL,
    CGROUP NUMBER(6) NOT NULL,
    CSTEP NUMBER(6) NOT NULL,
    CINDENT NUMBER(6) NOT NULL,
    CIP VARCHAR2(20) NOT NULL,
    CRDATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE QNA ( -- 11/17 MODIFY
    QNO NUMBER(6) PRIMARY KEY,
    ID VARCHAR2(50) REFERENCES MEMBER(ID),
    AID VARCHAR2(50) REFERENCES ADMIN(AID),
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    QTYPE VARCHAR2(50),
    QTITLE VARCHAR2(200) NOT NULL,
    QTEXT CLOB NOT NULL,
    QRDATE DATE DEFAULT SYSDATE NOT NULL,
    QSTATUS NUMBER(2) DEFAULT 1 NOT NULL,
    QGROUP NUMBER(6) NOT NULL,
    QIP VARCHAR2(20) NOT NULL
);

CREATE TABLE SUGGEST (
    SNO NUMBER(6) PRIMARY KEY,
    SWRITER VARCHAR2(50) NOT NULL,
    STITLE VARCHAR2(200) NOT NULL,
    STEXT CLOB NOT NULL,
    SRDATE DATE DEFAULT SYSDATE NOT NULL,
    SHIT NUMBER(5) NOT NULL,
    SGROUP NUMBER(5) NOT NULL,
    SSTEP NUMBER(5) NOT NULL,
    SINDENT NUMBER(5) NOT NULL,
    SIP VARCHAR2(20) NOT NULL
);

CREATE TABLE FAQ ( -- 11/17 MODIFY
    FNO NUMBER(6) PRIMARY KEY,
    AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    FTITLE VARCHAR2(200) NOT NULL,
    FTEXT CLOB NOT NULL,
    FRDATE DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE INFOMATION ( -- 11/17 MODIFY
    INO NUMBER(6) PRIMARY KEY,
    AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
    IPARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    ITYPE VARCHAR2(50),
    ITITLE VARCHAR2(200) NOT NULL,
    ITEXT CLOB NOT NULL,
    IRDATE DATE DEFAULT SYSDATE NOT NULL
);
 
COMMIT;
 
 
 