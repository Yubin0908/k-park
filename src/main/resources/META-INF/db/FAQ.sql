-- FAQ 게시판 query
DROP TABLE FAQ;
DROP SEQUENCE FAQ_SQ;
CREATE SEQUENCE FAQ_SQ MAXVALUE 999999 NOCYCLE NOCACHE;

CREATE TABLE FAQ ( -- 11/17 MODIFY
      FNO NUMBER(6) PRIMARY KEY,
      AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
      PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
      FTITLE VARCHAR2(200) NOT NULL,
      FTEXT CLOB NOT NULL,
      FRDATE DATE DEFAULT SYSDATE NOT NULL
      );
  
-- dummy data (3개 이상 - 2개원글+1개답변글)
INSERT INTO FAQ (FNO, AID, PARKNAME, FTITLE, FTEXT, FRDATE)
  VALUES (FAQ_SQ.NEXTVAL, 'admin', '설악산', '강원도', '입니다', SYSDATE);--글1
INSERT INTO FAQ (FNO, AID, PARKNAME, FTITLE, FTEXT, FRDATE)
    VALUES (FAQ_SQ.NEXTVAL, 'admin', '지리산', '경상도', '입니다', SYSDATE);--글2
INSERT INTO FAQ (FNO, AID, PARKNAME, FTITLE, FTEXT, FRDATE)
  VALUES (FAQ_SQ.NEXTVAL, 'admin', '내장산',  '충청도', '입니다', SYSDATE);--글3

COMMIT;

-- FAQ.xml에 들어갈 query
-- 1. 글목록(startRow부터 endRow) id = faqList
SELECT * 
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM FAQ ORDER BY FNO DESC) A)
  WHERE RN BETWEEN 2 AND 3;
 
-- schItem이 all일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM FAQ 
                WHERE FTITLE LIKE '%'||'도'||'%' OR FTEXT LIKE '%' || '답변' || '%'  ORDER BY FNO) A)
          WHERE RN BETWEEN 1 AND 4;
-- schItem이 parkName일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM FAQ 
                WHERE PARKNAME LIKE '%'||'산'||'%' ORDER BY FNO) A)
          WHERE RN BETWEEN 2 AND 3;
-- schItem이 ftitle일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM FAQ 
                WHERE FTITLE LIKE '%'||'도'||'%' ORDER BY FNO) A)
          WHERE RN BETWEEN 1 AND 6;  
-- schItem이 ftext일 때
SELECT * 
    FROM (SELECT ROWNUM RN, A.* 
          FROM (SELECT * FROM FAQ 
                WHERE FTEXT LIKE '%'||'입니다'||'%' ORDER BY FNO) A)
          WHERE RN BETWEEN 1 AND 6; 

-- 2. 글갯수 id = getfaqTotCnt
SELECT COUNT(*) CNT FROM FAQ;
SELECT COUNT(*) FROM FAQ WHERE FTITLE LIKE '%'||'질문'||'%' OR FTEXT LIKE '%'||'도'||'%';

SELECT COUNT(*) FROM FAQ WHERE FTITLE LIKE '%'||'질문'||'%';

SELECT COUNT(*) FROM FAQ WHERE FTEXT LIKE '%'||'도'||'%';

-- 3. 원글쓰기 id=faqInsert
INSERT INTO FAQ (FNO, AID, PARKNAME, FTITLE, FTEXT, FRDATE)
  VALUES (FAQ_SQ.NEXTVAL, 'admin', '북한산', '경기도', '입니다', SYSDATE);
         
-- 4. fno로 dto가져오기 id=getFaq
SELECT * FROM FAQ WHERE FNO=3;

-- 6. 글수정 id=faqModify
UPDATE FAQ 
  SET AID = 'admin',
      PARKNAME = '한라산',
      FTITLE = '위치는',
      FTEXT = '몰라요',
      FRDATE = SYSDATE
    WHERE FNO=3;

COMMIT;

-- 7. 글삭제 id=faqDelete
DELETE FROM FAQ WHERE FNO=2;
ROLLBACK;

SELECT * FROM FAQ; -- 확인
