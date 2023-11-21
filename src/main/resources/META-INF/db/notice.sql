DROP TABLE NOTICE;
DROP SEQUENCE NOTICE_SQ;
CREATE SEQUENCE NOTICE_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

CREATE TABLE NOTICE ( -- 11/18 MODIFY
    NNO NUMBER(6) PRIMARY KEY,
    AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    NTITLE VARCHAR2(200) NOT NULL,
    NTEXT CLOB NOT NULL,
    NDATE DATE DEFAULT SYSDATE NOT NULL,
    NHIT NUMBER(5) DEFAULT 0 NOT NULL,
    NTOP NUMBER(2) DEFAULT 0 NOT NULL,
    NIP VARCHAR2(20) NOT NULL
);

INSERT INTO NOTICE VALUES (NOTICE_SQ.NEXTVAL, 'admin', '설악산', 'TEST DUMMY'||NOTICE_SQ.CURRVAL, 'TETSTSATATDSATA', SYSDATE, 0, 1, '192.0.0.1');

-- 글목록 ID = noticeList
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE ORDER BY NTOP DESC, NNO DESC) A)
  WHERE RN BETWEEN 1 AND 30;
  
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE WHERE NTITLE LIKE '%'||'4'||'%' OR NTEXT LIKE '%'||'E'||'%' ORDER BY NTOP DESC, NNO DESC) A)
  WHERE RN BETWEEN 1 AND 10;
  
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE WHERE NTITLE LIKE '%'||'4'||'%' ORDER BY NTOP DESC, NNO DESC) A)
  WHERE RN BETWEEN 1 AND 10;

SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE WHERE NTEXT LIKE '%'||'E'||'%' ORDER BY NTOP DESC, NNO DESC) A)
  WHERE RN BETWEEN 1 AND 10;
  
-- 글 갯수 ID = getNoticeTotCnt
SELECT COUNT(*) FROM NOTICE;

SELECT COUNT(*) FROM NOTICE WHERE NTITLE LIKE '%'||'4'||'%' OR NTEXT LIKE '%'||'E'||'%';

SELECT COUNT(*) FROM NOTICE WHERE NTITLE LIKE '%'||'4'||'%';

SELECT COUNT(*) FROM NOTICE WHERE NTEXT LIKE '%'||'4'||'%';

-- DTO 가져오기 ID = getNotice
SELECT * FROM NOTICE WHERE NNO = 1;

-- 글 작성 ID = noticeInsert
INSERT INTO NOTICE VALUES (NOTICE_SQ.NEXTVAL, 'admin', '설악산', 'TEST DUMMY', 'TETSTSATATDSATA', SYSDATE, 0, 1, '192.0.0.1');

-- 글 수정 ID = noticeModify
UPDATE NOTICE SET
  PARKNAME = '태백산',
  NTITLE = '제목 수정',
  NTEXT = 'DSDSF',
  NDATE = SYSDATE,
  NTOP = 1,
  NIP = '192.0.0.2'
  WHERE NNO = 2;
  
-- 글 삭제 ID = noticeDelete
DELETE FROM NOTICE WHERE NNO = 2;

-- hitup ID = noticeHitUp
UPDATE NOTICE SET NHIT = NHIT + 1 WHERE NNO = 1;

commit;
