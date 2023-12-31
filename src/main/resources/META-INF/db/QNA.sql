DROP TABLE QNA;
DROP SEQUENCE QNA_SQ;
CREATE SEQUENCE QNA_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
 
 
CREATE TABLE QNA ( -- 11/17 MODIFY
    QNO NUMBER(6) PRIMARY KEY,
    ID VARCHAR2(50) REFERENCES MEMBER(ID),
    AID VARCHAR2(50) REFERENCES ADMIN(AID),
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    QTYPE VARCHAR2(50),
    QTITLE VARCHAR2(200) NOT NULL,
    QTEXT CLOB NOT NULL,
    QRDATE DATE DEFAULT SYSDATE NOT NULL,
    QYN VARCHAR2(5) NOT NULL,
    QSTATUS NUMBER(2) DEFAULT 1 NOT NULL,
    QGROUP NUMBER(6) NOT NULL,
    QSTEP NUMBER(6) NOT NULL,
    QINDENT NUMBER(6) NOT NULL,
    QIP VARCHAR2(20) NOT NULL
);

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
SELECT * FROM QNA;
-- qna.xml에 들어갈 query
-- qna.xml id = getQnaTotCnt 글 갯수
SELECT COUNT(*) CNT FROM QNA;

-- qna.xml id = qnaList
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QSTEP=0 ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;


    
-- option이 all일 때 검색 (제목, 공원명, 본문)        
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QTITLE LIKE '%'||'제'||'%' OR QTEXT LIKE '%'||'1'||'%' OR PARKNAME LIKE '%'||'지'||'%' ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;
 
 
-- option이 qtitle일 때
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QTITLE LIKE '%'||'제'||'%' ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;
 
 
-- option이 qTEXT일 때
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE QTEXT LIKE '%'||'본'||'%' ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;
 
-- option이 parkname 
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE PARKNAME LIKE '%'||'s'||'%' ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;

    
-- 글 갯수 qna.xml id = getQnaTotCnt 
SELECT COUNT(*) FROM QNA;

-- option이 all일 때
SELECT COUNT(*) FROM QNA WHERE QTITLE LIKE '%'||'제'||'%' OR QTEXT LIKE '%'||'s'||'%';
-- option이 btitle일 때
SELECT COUNT(*) FROM QNA WHERE QTITLE LIKE '%'||'제'||'%';
-- option이 bwriter일 때
SELECT COUNT(*) FROM QNA WHERE QTEXT LIKE '%'||'본'||'%';
-- option이 parkname일 때
SELECT COUNT(*) FROM QNA WHERE PARKNAME LIKE '%'||'지'||'%';


-- 글 작성 qna.xml id = qnaInsert 
INSERT INTO QNA (QNO, ID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'aaa', '설악산', '유형','제목', '본문', SYSDATE, 'y',  1, QNA_SQ.CURRVAL, 0, 0, '192.30.1.103');


INSERT INTO QNA (QNO, ID, AID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'bbb', 'admin', '지리산', '유형','비제목', '비본문', SYSDATE, 'y',  1, QNA_SQ.CURRVAL, 0, 0, '192.30.');
INSERT INTO QNA (QNO, ID, AID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT,  QIP)
    VALUES(QNA_SQ.NEXTVAL, 'ccc', 'admin', '내장산', '유형','시제목2', '시본문', SYSDATE, 'n',  1, QNA_SQ.CURRVAL, 0, 0, '192.30.1.100');
INSERT INTO QNA (QNO, ID, AID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'ddd', 'admin', '북한산', '유형','디제목', '디본문', SYSDATE, 'n',  1, QNA_SQ.CURRVAL, 0, 0, '192.30.1.109');
INSERT INTO QNA (QNO, ID, AID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'eee', 'admin', '태백산', '유형','이제목', '이본문', SYSDATE, 'n',  1, QNA_SQ.CURRVAL, 0, 0, '192.30.2');

    

-- DTO가져오기 qna.xml id = getQnaDto 
SELECT * FROM QNA WHERE QNO=5;


-- 글 수정 qna.xml id = qnaMODIFY 
UPDATE QNA 
    SET PARKNAME = '구름산',
        QTYPE = '탐방',
        QTITLE = '타이틀',
        QTEXT = 'TEXT',
        QRDATE = SYSDATE,
        QYN = 'N',
        QIP = '192.0.0.1'
    WHERE QNO = 5;

-- qna.xml id = qnaDelete
COMMIT;
DELETE FROM QNA WHERE QNO=5;
ROLLBACK;

--  답변글 저장 전단계  id=qnaReplyStep
SELECT * FROM QNA WHERE QNO=5;
UPDATE QNA SET QSTEP = QSTEP +1 WHERE QGROUP=2 AND QSTEP > 1;

UPDATE QNA SET QSTATUS = 2 WHERE QNO = 2;

-- 9. 답변글 저장  id=qnaPreReplyInsert
INSERT INTO QNA (QNO, AID, PARKNAME, QTITLE, QTEXT, QRDATE, QYN, QSTATUS, QGROUP, QSTEP, QINDENT, QIP)
  VALUES (QNA_SQ.NEXTVAL, 'admin', '한라산', '답변 ', '해결', SYSDATE, 'y', 1, 1, 1, 1,'192.168.0.200');
COMMIT;
SELECT * FROM QNA ORDER BY QNO DESC; -- 확인

SELECT * FROM QNA WHERE QSTATUS = 1 AND QGROUP = 4;
SELECT COUNT(*) FROM QNA WHERE QSTEP=0;
select * from qna;











 