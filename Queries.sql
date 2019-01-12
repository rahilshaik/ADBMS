--How many students of Masters have opted ISDS 
SELECT S.StudentID,S.First_Name FROM Students S
JOIN Degrees D ON S.Degree_ID=D.Degree_ID
JOIN Departments DP ON S.Department_Id=DP.Department_ID
JOIN Student_Courses SC ON S.StudentID=SC.StudentID
WHERE D.Degree='Masters' AND DP.Department_Name='Information Systems and Decision Sciences'
ORDER BY S.StudentID DESC


--How many courses an instructor teaches
SELECT I.InstructorName,D.Department_Name, COUNT(IC.CourseID) AS COURSES FROM Instructor_Courses IC
JOIN Instructors I ON IC.InstructorID=I.InstructorID
JOIN Courses C ON IC.[CourseID]=C.CourseID
JOIN Departments D ON I.Department_ID=D.Department_ID
GROUP BY I.InstructorName,D.Department_Name
ORDER BY COURSES DESC