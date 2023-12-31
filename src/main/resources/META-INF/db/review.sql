DROP TABLE REVIEW_CMT;
DROP TABLE REVIEW;
DROP SEQUENCE REVIEW_SQ;
DROP SEQUENCE REVIEW_CMT_SQ;

CREATE SEQUENCE REVIEW_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
CREATE SEQUENCE REVIEW_CMT_SQ MAXVALUE 999999 NOCYCLE NOCACHE;
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

-- DUMMY DATA
INSERT INTO REVIEW VALUES (REVIEW_SQ.NEXTVAL, 'test', '야영장죻아'||REVIEW_SQ.CURRVAL, '리뷰테스트본문', SYSDATE, 0, '192.0.0.2');
INSERT INTO REVIEW_CMT VALUES (REVIEW_CMT_SQ.NEXTVAL, 1, 'TESTER', '도움이 많이되었어여'||REVIEW_CMT_SQ.CURRVAL, REVIEW_CMT_SQ.CURRVAL, 0, 0, '192.168.0.1', SYSDATE);

SELECT * FROM REVIEW;
SELECT * FROM REVIEW_CMT;
COMMIT;



--=================================================원글에 대한 쿼리=========================================================
-- 글목록 ID = reviewList
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM REVIEW ORDER BY RNO DESC) A)
  WHERE RN BETWEEN 1 AND 10;
-- 글 갯수 ID = getReviewTotCnt
SELECT COUNT(*) FROM REVIEW; 
-- 상세보기 ID = getReview
SELECT * FROM REVIEW WHERE RNO = 1;
-- 글작성 ID = insertReview
INSERT INTO REVIEW VALUES (REVIEW_SQ.NEXTVAL, 'test', '야영장죻아'||REVIEW_SQ.CURRVAL, '리뷰테스트본문', SYSDATE, 0, '192.0.0.2');
-- 글수정 ID = modifyReview
UPDATE REVIEW SET
  RTITLE = '수정된 제목',
  RTEXT = '수정된 본문',
  RRDATE = SYSDATE,
  RIP = '192.0.0.0'
  WHERE RNO = 1;
-- 글삭제 ID = deleteReview
DELETE FROM REVIEW WHERE RNO = 2;
-- 조회수 ID = reviewHitUp
UPDATE REVIEW SET RHIT = RHIT + 1 WHERE RNO = 1;
-- 글삭제를 위한 댓글 삭제처리 ID = deleteReviewMoreCmt
DELETE FROM REVIEW_CMT WHERE RNO = 1;


--=================================================댓글에 대한 쿼리=========================================================
SELECT * FROM REVIEW_CMT WHERE RNO = 28;


commit;
-- 댓글 리스트 출력 ID = getReviewCmt
SELECT * FROM
  (SELECT ROWNUM RN, A.* FROM (SELECT * FROM REVIEW_CMT WHERE RNO = 9 ORDER BY CGROUP DESC, CSTEP) A)
  WHERE RN BETWEEN 1 AND 10;
-- 댓글 갯수 ID = getReviewCmtCnt
SELECT COUNT(*) FROM REVIEW_CMT WHERE RNO = 1;
-- 댓글 작성 ID = insertReviewCmt
INSERT INTO REVIEW_CMT VALUES (REVIEW_CMT_SQ.NEXTVAL, 1, 'TESTER', '도움이 많이되었어여'||REVIEW_CMT_SQ.CURRVAL, REVIEW_CMT_SQ.CURRVAL, 0, 0, '192.168.0.1', SYSDATE);
-- 댓글 수정 ID = modifyReviewCmt
UPDATE REVIEW_CMT SET
  CMEMO = '댓글 수정됨.',
  CIP = '192.0.1.2',
  CRDATE = SYSDATE
  WHERE CNO = 1;
  
-- 댓글 삭제 ID= deleteReviewCmt
DELETE FROM REVIEW_CMT WHERE CNO = 1;

-- 답댓글 전처리 작업 ID = cstepUpdate
UPDATE REVIEW_CMT SET CSTEP = CSTEP + 1 WHERE CGROUP = 1 AND CSTEP > 0;

-- 답댓글 작성 ID = insertReviewMoreCmt
INSERT INTO REVIEW_CMT VALUES (REVIEW_CMT_SQ.NEXTVAL, 1, 'TESTER2', '도움이 안되었어여.', 2, 1, 1, '190.81.0.92', SYSDATE);
