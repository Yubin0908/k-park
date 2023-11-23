-- 예약 가능한 날짜 출력 ID = getCampDate
SELECT RESDATE FROM RESERVED WHERE CAMPNO = 100;

-- 날짜 선택 시 예약 가능한지(REM > 0) ID = get CampDateRem
SELECT RESDATE, REM FROM RESERVED WHERE CAMPNO = 100 AND REM > 0;

-- 예약가능하면 리스트 출력 ID = getCampDetail
SELECT * FROM RESERVED WHERE CAMPNO = 100;

-- 예약 처리 ID = reservationCamp
INSERT INTO BOOKING (BNO, ID, CAMPNO, STATUS, BDATE) VALUES (BOOKING_SQ.NEXTVAL, 'test', 100, 1, '2023-11-24');

-- 예약 성공 시 예약가능한 잔여수 하나빼기 ID = remMinus
UPDATE RESERVED SET REM = REM - 1 WHERE CAMPNO = 100 AND RESDATE = '2023-11-24';

-- 예약 정보 출력 ID = getBookingInfo
SELECT * FROM BOOKING WHERE ID = 'test';

-- 예약 취소 ID = cancleReservation
UPDATE BOOKING SET STATUS = 0 WHERE BNO = 1;

-- 예약 취소 시 예약가능한 잔여수 하나추가 ID = remPlus
UPDATE RESERVED SET REM = REM + 1 WHERE CAMPNO = 100 AND RESDATE = '2023-11-24';
