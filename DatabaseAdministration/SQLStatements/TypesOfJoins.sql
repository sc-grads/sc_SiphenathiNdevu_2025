 SELECT * FROM DBO.STUDENT
 
 SELECT * FROM DBO.Course
    ----------------------------------------------------
  SELECT * FROM STUDENT s
  inner join course c
  on s.rollno = c.rollno

     ----------------------------------------------------
  SELECT * FROM STUDENT s
  left join course c
  on s.rollno = c.rollno
   ----------------------------------------------------
  select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
  inner join [dbo].[Course] c 
  on s.RollNo = c.RollNO

   ----------------------------------------------------
  select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
  right join [dbo].[Course] c 
  on s.RollNo = c.RollNO
   ----------------------------------------------------
   select s.RollNo,s.StudentName,c.CourseID from [dbo].[Student] s
   full join [dbo].[Course] c 
   on s.RollNo = c.RollNO