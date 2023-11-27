-- Member query
SELECT * FROM MEMBER;
-- 1. 회원가입시 : Member.xml id=idConfirm (resultType=int)
SELECT COUNT(*) FROM MEMBER WHERE ID='aaa';

-- 2. 회원가입 Member.xml id=insertMember
INSERT INTO MEMBER VALUES('aaa', '1', '차길동', '오산시', '010-5555-5555', 'cha@gildong.com', 'm','2023-12-12', SYSDATE);

-- dummy data
INSERT INTO MEMBER VALUES('bbb', '1', '신길동', '마산시', '010-8888-8888', 'shin@gildong.com', 'm','2010-11-11', SYSDATE);
INSERT INTO MEMBER VALUES('ccc', '1', '박길동', '수원시', '010-7777-7777', 'park@gildong.com', 'm','2000-10-10', SYSDATE);
INSERT INTO MEMBER VALUES('ddd', '1', '최길동', '인천시', '010-6666-6666', 'choi@gildong.com', 'm','1990-09-09', SYSDATE);
INSERT INTO MEMBER VALUES('zzz', '1', '김제니', '서울시', '010-5555-5555', 'kim@naver.com', 'f','1980-08-08', SYSDATE);

-- 3. 로그인 : Member.xml id=getMember
SELECT * FROM MEMBER , ADMIN WHERE ID='aaa' ;

-- 4. 회원정보 수정 : Member.xml id=modifyMember
UPDATE MEMBER
    SET PW = '1',
        NAME = '홍길동',
        ADDRESS = '수원시',
        PHONE = '010-7777-7777',
        EMAIL = 'hong@naver.com',
        GENDER = 'm',
        BIRTH = '1991-02-02'
    WHERE ID = 'aaa';
COMMIT;

-- 5. id찾기 : Member.xml id=findIDAccount
SELECT ID FROM MEMBER WHERE NAME='홍길동' AND EMAIL='hong@naver.com';

-- 6. pw찾기 : Member.xml id=findPWAccount
SELECT PW FROM MEMBER WHERE ID='aaa' AND NAME='홍길동' AND EMAIL='hong@naver.com';

-- 7. 회원탈퇴 : Member.xml id=deleteMember
DELETE FROM MEMBER WHERE ID='qqq';
ROLLBACK;

COMMIT;
SELECT * FROM MEMBER;













