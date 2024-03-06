-- 1. 계열 정보를 저장할 카테고리 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
-- 테이블 이름
--  TB_CATEGORY
--컬럼
--  NAME, VARCHAR2(10)
--  USE_YN, CHAR(1), 기본값은 Y가 들어가도록
DROP TABLE TB_CATEGORY;
DROP TABLE TB_CLASS_TYPE;

CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

SELECT * FROM TB_CATEGORY;

-- 2. 과목 구분을 저장할 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오
-- 테이블이름
--  TB_CLASS_TYPE
-- 컬럼
--  NO, VARCHAR2(5), PRIMARY KEY
--  NAME, VARCHAR2(10)
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5),
    NAME VARCHAR2(10) PRIMARY KEY
);

SELECT * FROM TB_CLASS_TYPE;

--3. TB_CATEGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오.
-- (KEY 이름을 생성하지 않아도 무방함. 만일 KEY 이를 지정하고자 한다면 이름은 본인이 알아서 적당한 이름을 사용한다.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);

-- 4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

-- 5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10으로,
-- 컬럼명이 NAME인 것은 마찬가지로 기존타입을 유지하면서 크기 20 으로 변경하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);

-- 6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각각 TB_ 를 제외한 테이블 이름이 앞에 붙은 형태로 변경한다
-- EX) CATEGORY_NAME
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;

-- 7. TB_CATEGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이 변경하시오.
-- PRIMARY KEY 의 이름은 "PK_ + 컬럼이름" 으로 지정하시오.
-- EX) PK_CATEGORY_NAME 
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C007346 TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C007343 TO PK_CLASS_TYPE_NO;

-- 8. 다음과 같은 INSERT 문을 수행한다.
INSERT INTO TB_CATEGORY VALUES('공학', 'Y');
INSERT INTO TB_CATEGORY VALUES('자연과학', 'Y');
INSERT INTO TB_CATEGORY VALUES('의학', 'Y');
INSERT INTO TB_CATEGORY VALUES('예체능', 'Y');
INSERT INTO TB_CATEGORY VALUES('인문사회', 'Y');
COMMIT;

-- 9. TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을
-- 부모값으로 참조하도록 FOREIGN KEY를 지정하시오. 이 때 KEY 이름은
-- FK_테이블이름_컬럼이름 으로 지정한다.( EX) FK_DEPARTMENT_CATEGORY)




