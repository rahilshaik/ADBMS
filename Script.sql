USE [master]
GO
/****** Object:  Database [University]    Script Date: 11/13/2018 10:54:23 PM ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\University.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\University_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
USE [University]
GO

/****** Object:  Table [dbo].[Courses]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Course_TypeID] [int] NULL,
	[Department_ID] [int] NULL,
	[No_of_Credits] [int] NULL,
	[Course_Name] [varchar](150) NULL
 )
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Degrees]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Degrees](
	[Degree_ID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Degree_Type] [varchar](100) NULL,
	[Degree] [varchar](150) NULL
 ) 

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[Department_ID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Department_Name] [varchar](200) NULL,
	[College_Id] [INT] NOT NULL)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Instructors](
	[InstructorID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Department_ID] [int] NULL,
	[InstructorName] [varchar](200) NULL,
	[Email] [varchar](200) NULL)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instructor_Courses]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Courses](
	[IC_ID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[InstructorID] [int] NULL,
	[CourseID] [int] NULL)

GO

/****** Object:  Table [dbo].[Student_Courses]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Courses](
	[StdCse_ID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL)

GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/13/2018 10:54:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[First_Name] [varchar](150) NULL,
	[Last_Name] [varchar](150) NULL,
	[Email] [varchar](100) NULL,
	[Degree_ID] [int] NULL,
	[Department_Id] [int] NULL)

GO
SET ANSI_PADDING OFF
GO

CREATE TABLE [dbo].[Colleges](
	[CollegeID] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Coll_Abbrv] VARCHAR(10) NOT NULL,
	[Coll_Name] VARCHAR(100) NULL)
GO
SET ANSI_PADDING OFF
GO



ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK2_Colleges] FOREIGN KEY([College_Id])
REFERENCES [dbo].[Colleges] ([CollegeID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK2_Colleges]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK2_Departments] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([Department_ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK2_Departments]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK1_Departments] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Departments] ([Department_ID])
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK1_Departments]
GO
ALTER TABLE [dbo].[Instructor_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Instructor_Courses] CHECK CONSTRAINT [FK_Courses]
GO
ALTER TABLE [dbo].[Instructor_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[InstructorS] ([InstructorID])
GO
ALTER TABLE [dbo].[Instructor_Courses] CHECK CONSTRAINT [FK_Instructor]
GO
ALTER TABLE [dbo].[Student_Courses]  WITH CHECK ADD CONSTRAINT [FK_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Student_Courses] CHECK CONSTRAINT [FK_Students]
GO
ALTER TABLE [dbo].[Student_Courses]  WITH CHECK ADD  CONSTRAINT [FK1_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Student_Courses] CHECK CONSTRAINT [FK1_Courses]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Degrees] FOREIGN KEY([Degree_ID])
REFERENCES [dbo].[Degrees] ([Degree_ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Degrees]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO



SET IDENTITY_INSERT Colleges ON
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (101,'CAS','College of Arts and Sciences')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (102,'CBCS','College of Behavioral & Community Sciences')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (103,'MCOB','Muma College of Business')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (104,'COEDU','College of Education')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (105,'COE','College of Engineering')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (106,'PCOS','Patel College of Global Sustainability')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (107,'CGS','College of Graduate Studies')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (108,'HON','Honors College')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (109,'CMS','College of Marine Science')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (110,'MCOM','Morsani College of Medicine')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (111,'CON','College of Nursing')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (112,'COP','College of Pharmacy')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (113,'COPH','College of Public Health')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (114,'COTA','College of The Arts')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (115,'UGS','College of Undergraduate Studies')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (116,'CHT','College of Hospitality & Tourism Leadership')
INSERT INTO Colleges ([CollegeID],[Coll_Abbrv],[Coll_Name]) VALUES (117,'LAS','College of Liberal Arts & Social Sciences')
SET IDENTITY_INSERT Colleges OFF

SET IDENTITY_INSERT [Degrees] ON
INSERT [dbo].[Degrees] ([Degree_ID], [Degree_Type], [Degree]) VALUES (1, N'Under Graduation', N'Bachelors')
GO
INSERT [dbo].[Degrees] ([Degree_ID], [Degree_Type], [Degree]) VALUES (2, N'Graduation', N'Masters')
GO
INSERT [dbo].[Degrees] ([Degree_ID], [Degree_Type], [Degree]) VALUES (3, N'Post Graduation', N'Doctorial Program')
GO
INSERT [dbo].[Degrees] ([Degree_ID], [Degree_Type], [Degree]) VALUES (4, N'Post Graduation', N'Business Doctorial')
SET IDENTITY_INSERT [Degrees] OFF