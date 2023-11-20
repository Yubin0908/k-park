-- PARK
CREATE TABLE PARK ( -- 11/17 ADD
    PARKNAME VARCHAR2(50) PRIMARY KEY,
    PARKLOC VARCHAR2(200) NOT NULL,
    PARKTEL VARCHAR2(50) NOT NULL
    );
    
INSERT INTO PARK VALUES ('설악산', '강원도', '1670-9201');
INSERT INTO PARK VALUES ('북한산', '경기도', '1670-9201');
INSERT INTO PARK VALUES ('지리산', '경상도', '1670-9201');
INSERT INTO PARK VALUES ('태백산', '강원도', '1670-9201');
INSERT INTO PARK VALUES ('덕유산', '전라도', '1670-9201');
INSERT INTO PARK VALUES ('소백산', '충청도', '1670-9201');
INSERT INTO PARK VALUES ('무등산', '광주시', '1670-9201');
INSERT INTO PARK VALUES ('내장산', '전라도', '1670-9201');
COMMIT;

SELECT * FROM PARK;

-- 야영장:설악산, 북한산, 지리산, 태백산
-- 대피소:지리산,설악산,덕유산,소백산
-- 생태탐방원:소백산, 무등산, 내장산,