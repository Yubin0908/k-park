DROP TABLE QNA;
DROP SEQUENCE QNA_SQ;
CREATE SEQUENCE QNA_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
 CREATE TABLE QNA (
      QNO NUMBER(6) PRIMARY KEY,
      ID VARCHAR2(50) REFERENCES MEMBER(ID),
      AID VARCHAR2(50) REFERENCES ADMIN(AID),
      PARKNAME VARCHAR2(50) NOT NULL,
      QTYPE VARCHAR2(50),
      QTITLE VARCHAR2(200) NOT NULL,
      QTEXT CLOB NOT NULL,
      QRDATE DATE DEFAULT SYSDATE NOT NULL,
      QSTATUS NUMBER(2) DEFAULT 1 NOT NULL,
      QGROUP NUMBER(6) NOT NULL,
      QIP VARCHAR2(20) NOT NULL
      );



-- qna.xml에 들어갈 query


-- qna.xml id = qnaList
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM QNA ORDER BY QTITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    
-- qna.xml id = getQnaTotCnt 글 갯수
SELECT COUNT(*) CNT FROM QNA;

-- qna.xml id = qnaWrite (원글쓰기)
INSERT INTO QNA (QNO, ID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'aaa', '지리산공원', '유형','제목', '본문', '2023-11-16', 0, 0, '192.30.1.103');

-- qna.xml id = mainList 글목록
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QNO DESC) A)
    WHERE RN BETWEEN 1 AND 4;

-- option이 all일 때 검색 (제목, 공원명, 본문)
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM QNA 
		        WHERE UPPER(QTITLE) LIKE '%'||UPPER('제')||'%' OR UPPER(QTEXT) LIKE '%'||UPPER('본')||'%' OR PARKNAME LIKE '%'||'지'||'%' ORDER BY QTITLE) A)
		  	WHERE RN BETWEEN 1 AND 2;
-- option이 qtitle일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM QNA 
		        WHERE UPPER(QTITLE) LIKE '%'||UPPER('s')||'%' ORDER BY QTITLE) A)
		  	WHERE RN BETWEEN 4 AND 6;
-- option이 qTEXT일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM QNA 
		        WHERE UPPER(QTEXT) LIKE '%'||UPPER('본')||'%' ORDER BY QTITLE) A)
		  	WHERE RN BETWEEN 2 AND 6;
-- option이 parkname 
 SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM QNA 
		        WHERE PARKNAME LIKE '%'||UPPER('지')||'%' ORDER BY QTITLE) A)
		  	WHERE RN BETWEEN 2 AND 6;

    
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


-- 글 작성 qna.xml id = qnaWriter 
INSERT INTO QNA (QNO, ID, AID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'aaa', 'admin', '지리산공원', '유형','제목', '본문', '2023-11-16', 0, 0, '192.30.1.103');

SELECT * FROM QNA;
INSERT INTO QNA (QNO, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, '관악산', '유형','제목1', '본문', '2023-11-15', 0, 0, '192.30.1.2');


-- DTO가져오기 qna.xml id = getQnaDto 
SELECT * FROM QNA WHERE QNO=5;

-- qna.xml ID = 

-- 글 수정 qna.xml id = qnaMODIFY 
UPDATE QNA 
    SET PARKNAME = '구름산',
        QTYPE = '탐방',
        QTITLE = '타이틀',
        QTEXT = 'TEXT',
        QRDATE = SYSDATE,
        QIP = '192.0.0.1'
    WHERE QNO = 6;

-- qna.xml id = qnaDelete
COMMIT; 
DELETE FROM QNA WHERE QNO=6;
ROLLBACK;