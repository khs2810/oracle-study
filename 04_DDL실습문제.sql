-- 1. �迭 ������ ������ ī�װ� ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�.
-- ���̺� �̸�
--  TB_CATEGORY
--�÷�
--  NAME, VARCHAR2(10)
--  USE_YN, CHAR(1), �⺻���� Y�� ������
DROP TABLE TB_CATEGORY;
DROP TABLE TB_CLASS_TYPE;

CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

SELECT * FROM TB_CATEGORY;

-- 2. ���� ������ ������ ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�
-- ���̺��̸�
--  TB_CLASS_TYPE
-- �÷�
--  NO, VARCHAR2(5), PRIMARY KEY
--  NAME, VARCHAR2(10)
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5),
    NAME VARCHAR2(10) PRIMARY KEY
);

SELECT * FROM TB_CLASS_TYPE;

--3. TB_CATEGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
-- (KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� �Ѵٸ� �̸��� ������ �˾Ƽ� ������ �̸��� ����Ѵ�.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);

-- 4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

-- 5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10����,
-- �÷����� NAME�� ���� ���������� ����Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);

-- 6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� ���� TB_ �� ������ ���̺� �̸��� �տ� ���� ���·� �����Ѵ�
-- EX) CATEGORY_NAME
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_TYPE_NAME;

-- 7. TB_CATEGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ���� �����Ͻÿ�.
-- PRIMARY KEY �� �̸��� "PK_ + �÷��̸�" ���� �����Ͻÿ�.
-- EX) PK_CATEGORY_NAME 
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C007346 TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C007343 TO PK_CLASS_TYPE_NO;

-- 8. ������ ���� INSERT ���� �����Ѵ�.
INSERT INTO TB_CATEGORY VALUES('����', 'Y');
INSERT INTO TB_CATEGORY VALUES('�ڿ�����', 'Y');
INSERT INTO TB_CATEGORY VALUES('����', 'Y');
INSERT INTO TB_CATEGORY VALUES('��ü��', 'Y');
INSERT INTO TB_CATEGORY VALUES('�ι���ȸ', 'Y');
COMMIT;

-- 9. TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷���
-- �θ����� �����ϵ��� FOREIGN KEY�� �����Ͻÿ�. �� �� KEY �̸���
-- FK_���̺��̸�_�÷��̸� ���� �����Ѵ�.( EX) FK_DEPARTMENT_CATEGORY)




