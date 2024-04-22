--1. List the names, employee numbers, job titles, salaries, and department numbers of
-- all employees with a CLERK job


--   --always on the top
 SELECT ename,empno,job,sal,deptno
-- --nereden sececegimizi
 FROM emp
WHERE job='CLERK';

--2. Find the names and numbers of employees whose bosses are 7902, 7566, or 7788.
SELECT ename,empno,mgr
FROM emp
WHERE mgr=7902 OR mgr= 7566 OR mgr=7788;


SELECT ename,empno,mgr
FROM emp
WHERE mgr IN(7902,7566,7788);

--%
--3.Find the four-letter names of the employees
SELECT ename
FROM emp
WHERE ename LIKE '____';

--4.Find the data of those employees who have a boss.
-- * means all data
SELECT *
FROM emp
WHERE mgr IS NOT NULL ;


--5.List the names, annual salary, and commission of all those SALESMANs whose monthly salary exceeds
--commission. Sort the results by decreasing salary, then by name (ascending).

SELECT ename,sal*12,NVL(COMM,0)
FROM emp
WHERE SAL>NVL(COMM,0) AND job= 'SALESMAN'
ORDER BY sal DESC,ename ASC;

--6.Select the names of all employees, and the names of the departments in which they are employed. Sort
--the returned records in alphabetical order of the surnames

SELECT ename,dname
FROM  emp,DEPT
WHERE emp.DEPTNO=dept.DEPTNO
ORDER BY ename;

SELECT ename,dname
FROM  emp
JOIN DEPT on emp.DEPTNO=dept.DEPTNO
ORDER BY ename;

--7.List information about employees whose salaries correspond to salary class 3
SELECT ENAME,SAL,grade
from EMP
JOIN SALGRADE on SAL BETWEEN LOSAL AND HISAL
WHERE GRADE=3;



--Tasks
--4 Find all those employees who are employed in the position of MANAGER, or in the position of
--SALESMAN with a salary above 1500.
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR (JOB = 'SALESMAN' AND SAL > 1500);



--10 For employees with a monthly salary over 1500, list their names, the locations of their departments,
--and the names of those departments.
SELECT e.ENAME, d.LOC, d.DNAME
FROM EMP e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.SAL > 1500;



--11  Select employees in department 30 and 40 (name, department no.,
-- department name, location). Also list the information of the department, 40
-- in which there are no employees.
SELECT ENAME, e.DEPTNO, d.DNAME, d.LOC
FROM EMP e
JOIN DEPT d ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO IN (30, 40)
   OR (e.DEPTNO IS NULL AND d.DEPTNO = 40);

--1 List the names of employees whose commission exceeds their monthly salary
SELECT ENAME
FROM EMP
WHERE COMM > SAL / 12;

--2 )Find the data of those employees whose salaries are outside the range <1000, 2000>
SELECT *
FROM EMP
WHERE SAL < 1000 OR SAL > 2000;

--3 Find data of those employees who are employed in the position of CLERK,
-- or their earnings are within
--the range <1000,2000>.
SELECT *
FROM EMP
WHERE JOB = 'CLERK' OR SAL BETWEEN 1000 AND 2000 OR COMM BETWEEN 1000 AND 2000;






