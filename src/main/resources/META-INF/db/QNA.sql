-- qna.xml에 들어갈 query

-- qna.xml id = qnaList
SELECT *
    FROM (SELECT ROWNUM RN, A.* FROM (SELECT *FROM QNA ORDER BY QTITLE DESC) A)
    WHERE RN BETWEEN 2 AND 3;
    
-- qna.xml id = getQnaTotCnt 글 갯수
SELECT COUNT(*) CNT FROM QNA;

-- qna.xml id = qnaWriter (원글쓰기)
INSERT INTO QNA (QNO, ID, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, 'aaa', '지리산공원', '유형','제목', '본문', '2023-11-16', 0, 0, '192.30.1.103');
SELECT * FROM QNA;
INSERT INTO QNA (QNO, PARKNAME, QTYPE, QTITLE, QTEXT, QRDATE, QSTATUS, QGROUP, QIP)
    VALUES(QNA_SQ.NEXTVAL, '관악산', '유형','제목1', '본문', '2023-11-15', 0, 0, '192.30.1.2');
    
-- qna.xml id = getQnaDto 
SELECT * FROM QNA WHERE QNO=5;

-- qna.xml id = qnaMODIFY
UPDATE QNA 
    SET PARKNAME = '구름산',
        QTITLE = '타이틀',
        QTEXT = 'TEXT',
        QRDATE = SYSDATE,
        QIP = '192.0.0.1'
    WHERE QNO = 6;

-- qna.xml id = qnaDelete
COMMIT;
DELETE FROM QNA WHERE QNO=6;
ROLLBACK;