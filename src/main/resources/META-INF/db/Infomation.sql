DROP TABLE INFOMATION;
DROP SEQUENCE INFOMATION_SQ;

CREATE SEQUENCE INFOMATION_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE TABLE INFOMATION ( -- 11/17 MODIFY
    INO NUMBER(6) PRIMARY KEY,
    AID VARCHAR2(50) REFERENCES ADMIN(AID) NOT NULL,
    PARKNAME VARCHAR2(50) REFERENCES PARK(PARKNAME) NOT NULL,
    ITYPE VARCHAR2(50),
    ITITLE VARCHAR2(200) NOT NULL,
    ITEXT CLOB NOT NULL,
    IRDATE DATE DEFAULT SYSDATE NOT NULL
);
-- dummy data
INSERT INTO INFOMATION (INO, AID, PARKNAME, ITYPE, ITITLE, ITEXT)
    VALUES (INFOMATION_SQ.NEXTVAL, 'admin', '지리산', '타입', '제목', '본문');
INSERT INTO INFOMATION (INO, AID, PARKNAME, ITYPE, ITITLE, ITEXT)
    VALUES (INFOMATION_SQ.NEXTVAL, 'admin', '북한산', '유형', '제목2', '본문2');
INSERT INTO INFOMATION (INO, AID, PARKNAME, ITYPE, ITITLE, ITEXT)
    VALUES (INFOMATION_SQ.NEXTVAL, 'admin', '설악산', '유형', '제목3', '본문3');
INSERT INTO INFOMATION (INO, AID, PARKNAME, ITYPE, ITITLE, ITEXT)
    VALUES (INFOMATION_SQ.NEXTVAL, 'admin', '덕유산', '타입', '제목4', '본문4');

SELECT * FROM INFOMATION;


-- infomation.xml에 들어갈 query 
-- infomation 글목록 id = infoList 
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM INFOMATION ORDER BY ITITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    
-- option이 all일 때 검색 (제목, 본문)
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM INFOMATION WHERE ITITLE LIKE '%'||'제'||'%' OR ITEXT LIKE '%'||'본'||'%'  ORDER BY ITITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;

-- option이 ititle일 때
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM INFOMATION WHERE ITITLE LIKE '%'||'제'||'%' ORDER BY ITITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;

-- option이 itext일 때
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM INFOMATION WHERE ITEXT LIKE '%'||'본'||'%' ORDER BY ITITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    

    
-- 글 상세보기 id = infoDetail
SELECT * FROM INFOMATION WHERE INO=3;

-- 글 갯수 qna.xml id = getInfoTotCnt 
SELECT COUNT(*) FROM INFOMATION;
-- option이 all일 때
SELECT COUNT(*) FROM INFOMATION WHERE ITITLE LIKE '%'||'제'||'%' OR ITEXT LIKE '%'||'s'||'%';

-- option이 ititle일 때
SELECT COUNT(*) FROM INFOMATION WHERE ITITLE LIKE '%'||'제'||'%';
-- option이 itext일 때
SELECT COUNT(*) FROM INFOMATION WHERE ITEXT LIKE '%'||'본'||'%';

    
-- DTO 가져오기 ID = getInfo
SELECT * FROM INFOMATION WHERE INO = 1;

-- 글 작성 id = infoInsert
INSERT INTO INFOMATION (INO, AID, PARKNAME, ITYPE, ITITLE, ITEXT)
    VALUES (INFOMATION_SQ.NEXTVAL, 'admin', '무등산', '타입', '제목4', '본문5');
    
-- 글 수정 id = infoModify
UPDATE INFOMATION
    SET PARKNAME = '소백산',
        ITYPE = '타입',
        ITITLE = '제목이다',
        ITEXT = '본문이다'
    WHERE INO = 5;
-- 글 삭제 id = infoDelete
COMMIT;
DELETE FROM INFOMATION WHERE INO = 5;
ROLLBACK;
