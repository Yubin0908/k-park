-- admin query
CREATE TABLE ADMIN (
    AID VARCHAR2(50) PRIMARY KEY,
    APW VARCHAR2(50) NOT NULL,
    ANAME VARCHAR2(50) NOT NULL,
    AGROUP VARCHAR2(200) NOT NULL,
    ARDATE DATE DEFAULT SYSDATE NOT NULL
    );

INSERT INTO ADMIN VALUES('admin', '1', '관리자', '관리부', SYSDATE);


-- 회원가입 id중복체크 ID = aidConfirm
SELECT COUNT(*) FROM ADMIN WHERE AID = 'admin';


-- 관리자 회원가입 ID = insertAdmin
INSERT INTO ADMIN VALUES ('sulak23', '111', '설악산관리자', '설악산', SYSDATE);

-- 관리자 정보수정 ID = modifyAdmin
UPDATE ADMIN SET APW = '1', ANAME = '메인관리자', AGROUP = '태백산' WHERE AID = 'admin';





SELECT * FROM ADMIN WHERE AID='admin';

COMMIT;
SELECT * FROM ADMIN;
