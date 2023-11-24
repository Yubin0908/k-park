-- qna.xml에 들어갈 query
  
-- qna.xml id = getQnaTotCnt 글 갯수
SELECT COUNT(*) CNT FROM QNA;

-- qna.xml id = qnaWriter (원글쓰기)
INSERT INTO QNA (QNO, ID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'aaa', '지리산공원', '유형','제목', '본문', '2023-11-16', 0, 0, '192.30.1.103');

-- qna.xml id = qnaList
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE, QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;

    
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

select * from QNA;

SELECT A.* FROM
    (SELECT ROWNUM RN, RPAD(SUBSTR(Q.ID,0,1),LENGTH(Q.ID)-1, '*') || SUBSTR(Q.ID,LENGTH(Q.ID))  cryptId, Q.* FROM QNA Q, MEMBER M
        WHERE Q.ID = M.ID ORDER BY Q.ID DESC) A
    WHERE RN BETWEEN 1 AND 4;
    
SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE
     , QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;

SELECT M.RN, M.QNO, RPAD(SUBSTR(M.ID,0,1),LENGTH(M.ID)-1, '*') || SUBSTR(M.ID,LENGTH(M.ID)) AS ID
     , M.AID, M.PARKNAME, M.QTYPE, M.QTITLE, M.QTEXT, M.QRDATE
     , DECODE(M.QSTATUS, '0', '접수', '1', '처리완료', '오류') AS QSTATUS, M.QGROUP, M.QIP
  FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY QNO DESC) A) M
 WHERE RN BETWEEN 1 AND 10;
 