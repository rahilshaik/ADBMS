--How many students of Masters have opted ISDS 
CREATE NONCLUSTERED INDEX [DegreeDeptIndex] ON [dbo].[Students] ([Department_Id]) INCLUDE ([StudentID],[First_Name], [Degree_ID] )
CREATE NONCLUSTERED INDEX [StudentCourse_StudentId] ON [dbo].[Student_Courses]([StudentID] )

--How many courses an instructor teaches
CREATE NONCLUSTERED INDEX [InstructorCourses_CourseId] ON [dbo].[Instructor_Courses]([InstructorID] ) INCLUDE ([CourseID] )

--Index for Stored Procedure
CREATE NONCLUSTERED INDEX [InstructorCourses_CourseId] ON [dbo].[Students]([Email] )