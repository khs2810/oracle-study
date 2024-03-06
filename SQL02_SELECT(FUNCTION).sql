-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
-- (��, ����� "�й�", "�̸�", "���г⵵"�� ǥ�õǵ��� �Ѵ�.)
SELECT STUDENT_NO AS "�й�", STUDENT_NAME AS "�̸�", 
    TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS "���г⵵"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE ASC;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� �Ѵ�.
-- �� ������ �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����.
-- (* �̶� �ùٸ��� �ۼ��� SQL ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) != 3;

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ���. ��, �̶� ���̰� ���� ������� ���� ��� ������ ���.
-- (��, ���� �� 2000�� ���� ����ڴ� ������, ��� ����� "�����̸�", "����"�� �Ѵ�. ���̴� '��'���� ����Ѵ�.)
SELECT PROFESSOR_NAME �����̸�, EXTRACT(YEAR FROM SYSDATE) - (19 || SUBSTR(PROFESSOR_SSN, 1, 2)) ����
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY ����;
 
-- 4. �������� �̸� ��, ���� ������ �̸��� ���.
-- ��� ����� "�̸�"�� �������� �Ѵ�.(���� 2���� ������ ���ٰ� ����)
SELECT SUBSTR(PROFESSOR_NAME, 2) AS "�̸�"
FROM TB_PROFESSOR;

-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. �̶�, 19�쿡 �����ϸ� ����� ���� ���� ������ �����Ѵ�.

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN, 1, 6))) > 19;

-- 6. 2020�� ũ���������� ���� ����?
SELECT TO_CHAR(TO_DATE(20201225), 'DAY')
FROM DUAL;

-- 7. TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11', 'YY/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11', 'RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�?
SELECT TO_CHAR(TO_DATE('99/10/11', 'YY/MM/DD'),'YYYY'), -- 2099�� 10�� 11��
    TO_CHAR(TO_DATE('49/10/11', 'YY/MM/DD'),'YYYY'), -- 2049�� 10�� 11��
    TO_CHAR(TO_DATE('99/10/11', 'RR/MM/DD'),'YYYY'), -- 1999�� 10�� 11��
    TO_CHAR(TO_DATE('49/10/11', 'RR/MM/DD'),'YYYY') -- 2049�� 10�� 11��
FROM DUAL;

-- 8.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE ENTRANCE_DATE < '2000/01/01';

-- 9.
SELECT ROUND(AVG(POINT),1) AS "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10.
SELECT DEPARTMENT_NO AS "�а���ȣ", COUNT(*) AS "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11.
SELECT COUNT(*) AS "�л���(��)"
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

--12.
SELECT SUBSTR(TERM_NO, 1, 4) AS "�⵵", ROUND(AVG(POINT),1) AS "�⵵�� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4)
ORDER BY 1;

--13.
SELECT DEPARTMENT_NO AS "�а��ڵ��", COUNT(DECODE(ABSENCE_YN, 'Y', 1)) AS "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

--14.
SELECT STUDENT_NAME AS "�����̸�", COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;

--15.
SELECT SUBSTR(TERM_NO, 1, 4) AS "�⵵", SUBSTR(TERM_NO, 5, 2) AS "�б�", ROUND(AVG(POINT),1) AS "�⵵�� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4), SUBSTR(TERM_NO, 5, 2))
ORDER BY 1;