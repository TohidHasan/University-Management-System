USE [master]
GO
/****** Object:  Database [VarsityDB]    Script Date: 6/20/2017 11:58:26 PM ******/
CREATE DATABASE [VarsityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onik', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\onik.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onik_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\onik_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VarsityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VarsityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VarsityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VarsityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VarsityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VarsityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VarsityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VarsityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VarsityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VarsityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VarsityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VarsityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VarsityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VarsityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VarsityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VarsityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VarsityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VarsityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VarsityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VarsityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VarsityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VarsityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VarsityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VarsityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VarsityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VarsityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VarsityDB] SET  MULTI_USER 
GO
ALTER DATABASE [VarsityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VarsityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VarsityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VarsityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VarsityDB]
GO
/****** Object:  Table [dbo].[allocateClassroom]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[allocateClassroom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departmentId] [int] NOT NULL,
	[courseId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	[dayId] [int] NOT NULL,
	[fromTime] [varchar](50) NOT NULL,
	[toTime] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_allocateClassroom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[assignCourses]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[assignCourses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [int] NOT NULL,
	[teacherId] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_assignCourses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[classroom]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[classroom](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roomNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_classroom] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[course]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseCode] [varchar](50) NOT NULL,
	[courseName] [varchar](50) NOT NULL,
	[credit] [decimal](18, 2) NOT NULL,
	[description] [varchar](50) NULL,
	[departmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[day]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[day](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day] [varchar](50) NOT NULL,
	[code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_day] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[department]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[departmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[designation]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[designation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[enrollCourse]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[enrollCourse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[regNo] [varchar](50) NOT NULL,
	[courseId] [varchar](50) NOT NULL,
	[enrollDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_enrollTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[resultGrades]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resultGrades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gradeLetter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_gradeLetters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[semester]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[semester](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[semester] [varchar](50) NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[registrationNo] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contactNo] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[address] [varchar](50) NULL,
	[departmentId] [int] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[studentResult]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[studentResult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[regNo] [varchar](50) NOT NULL,
	[courseId] [int] NOT NULL,
	[gradeId] [int] NOT NULL,
 CONSTRAINT [PK_studentResult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](500) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contactNo] [varchar](50) NOT NULL,
	[designationId] [int] NOT NULL,
	[departmentId] [int] NOT NULL,
	[allottedCredit] [decimal](18, 2) NOT NULL,
	[remainingCredit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[classScheduleInfo]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[classScheduleInfo]
AS
SELECT        d.id AS departmentId, d.departmentName, c.id AS courseId, c.courseCode, c.courseName, r.roomNo, da.code AS dayCode, da.day AS dayName, a.fromTime, a.toTime, a.status
FROM            dbo.allocateClassroom AS a FULL OUTER JOIN
                         dbo.course AS c ON c.id = a.courseId LEFT OUTER JOIN
                         dbo.department AS d ON d.id = c.departmentId LEFT OUTER JOIN
                         dbo.classroom AS r ON r.id = a.roomId LEFT OUTER JOIN
                         dbo.day AS da ON da.id = a.dayId


GO
/****** Object:  View [dbo].[courseDetailsWithTeacherSemesterDepartment]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[courseDetailsWithTeacherSemesterDepartment]
AS
SELECT        c.courseCode, c.courseName, c.id AS courseId, t.name AS teacherName, t.id AS teacherId, s.semester, c.departmentId, dbo.assignCourses.status
FROM            dbo.assignCourses FULL OUTER JOIN
                         dbo.course AS c ON c.id = dbo.assignCourses.courseId LEFT OUTER JOIN
                         dbo.teacher AS t ON t.id = dbo.assignCourses.teacherId INNER JOIN
                         dbo.semester AS s ON s.id = c.SemesterId


GO
/****** Object:  View [dbo].[courseWithAllocation]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[courseWithAllocation]
AS
SELECT        c.id, c.courseName, c.courseCode, a.id AS allocationId, d.id AS departmentId
FROM            dbo.allocateClassroom AS a FULL OUTER JOIN
                         dbo.course AS c ON c.id = a.courseId LEFT OUTER JOIN
                         dbo.department AS d ON d.id = c.departmentId


GO
/****** Object:  View [dbo].[courseWithAssignedTeacher]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[courseWithAssignedTeacher]
AS
SELECT        a.id AS assignId, c.id AS courseId, a.status, t.id AS teacherId, t.name, s.semester
FROM            dbo.assignCourses AS a INNER JOIN
                         dbo.teacher AS t ON a.teacherId = t.id INNER JOIN
                         dbo.course AS c ON c.id = a.courseId INNER JOIN
                         dbo.semester AS s ON s.id = c.SemesterId


GO
/****** Object:  View [dbo].[courseWithSemester]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[courseWithSemester]
AS
SELECT course.id, courseCode, course.courseName, semester.semester, departmentId
FROM course JOIN semester ON course.SemesterId = Semester.Id

GO
/****** Object:  View [dbo].[enrolledCourseByStudent]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[enrolledCourseByStudent]
AS
SELECT        s.registrationNo, s.id AS studentId, c.id AS courseId, c.courseName, c.courseCode, c.departmentId, dbo.enrollCourse.enrollDate, dbo.enrollCourse.id AS enrollId
FROM            dbo.enrollCourse INNER JOIN
                         dbo.student AS s ON s.registrationNo = dbo.enrollCourse.regNo FULL OUTER JOIN
                         dbo.course AS c ON c.id = dbo.enrollCourse.courseId


GO
/****** Object:  View [dbo].[studentResultDetails]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[studentResultDetails]
AS
SELECT        s.id AS studentId, s.registrationNo, s.name, s.email, d.departmentName, c.courseName, c.courseCode, g.gradeLetter
FROM            dbo.studentResult AS sr INNER JOIN
                         dbo.student AS s ON s.id = sr.studentId INNER JOIN
                         dbo.department AS d ON d.id = s.departmentId INNER JOIN
                         dbo.course AS c ON c.id = sr.courseId INNER JOIN
                         dbo.resultGrades AS g ON g.id = sr.gradeId


GO
/****** Object:  View [dbo].[studentWithDepartmentName]    Script Date: 6/20/2017 11:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[studentWithDepartmentName]
AS
SELECT        dbo.student.name, dbo.student.id, dbo.student.email, dbo.student.contactNo, dbo.student.registrationNo, dbo.student.date, dbo.student.address, dbo.department.id AS departmentId, 
                         dbo.department.departmentName, dbo.department.code
FROM            dbo.student INNER JOIN
                         dbo.department ON dbo.department.id = dbo.student.departmentId


GO
SET IDENTITY_INSERT [dbo].[allocateClassroom] ON 

INSERT [dbo].[allocateClassroom] ([id], [departmentId], [courseId], [roomId], [dayId], [fromTime], [toTime], [status]) VALUES (26, 19, 28, 12, 1, N'12:00 PM', N'01:00 AM', N'active')
INSERT [dbo].[allocateClassroom] ([id], [departmentId], [courseId], [roomId], [dayId], [fromTime], [toTime], [status]) VALUES (27, 19, 29, 12, 1, N'01:00 AM', N'02:00 AM', N'active')
SET IDENTITY_INSERT [dbo].[allocateClassroom] OFF
SET IDENTITY_INSERT [dbo].[assignCourses] ON 

INSERT [dbo].[assignCourses] ([id], [courseId], [teacherId], [status]) VALUES (1009, 28, 1006, N'inactive')
INSERT [dbo].[assignCourses] ([id], [courseId], [teacherId], [status]) VALUES (1010, 28, 1006, N'active')
INSERT [dbo].[assignCourses] ([id], [courseId], [teacherId], [status]) VALUES (1011, 29, 1007, N'active')
SET IDENTITY_INSERT [dbo].[assignCourses] OFF
SET IDENTITY_INSERT [dbo].[classroom] ON 

INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (12, N'FS-101')
INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (13, N'FS-102')
INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (14, N'AB-101')
INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (15, N'AB-102')
INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (16, N'FS-201')
INSERT [dbo].[classroom] ([id], [roomNo]) VALUES (17, N'FS-202')
SET IDENTITY_INSERT [dbo].[classroom] OFF
SET IDENTITY_INSERT [dbo].[course] ON 

INSERT [dbo].[course] ([id], [courseCode], [courseName], [credit], [description], [departmentId], [SemesterId]) VALUES (28, N'CSE-101', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Basic Computer Knowledge', 19, 1)
INSERT [dbo].[course] ([id], [courseCode], [courseName], [credit], [description], [departmentId], [SemesterId]) VALUES (29, N'CSE-102', N'Fundamental Lab', CAST(2.00 AS Decimal(18, 2)), N'sessional subject  ', 19, 1)
SET IDENTITY_INSERT [dbo].[course] OFF
SET IDENTITY_INSERT [dbo].[day] ON 

INSERT [dbo].[day] ([id], [day], [code]) VALUES (1, N'Saturday', N'Sat')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (2, N'Sunday', N'Sun')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (3, N'Monday', N'Mon')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (4, N'Tuesday', N'Tue')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (5, N'Wednesday', N'Wed')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (6, N'Thursday', N'Thu')
INSERT [dbo].[day] ([id], [day], [code]) VALUES (7, N'Friday', N'Fri')
SET IDENTITY_INSERT [dbo].[day] OFF
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([id], [code], [departmentName]) VALUES (19, N'CSE', N'Computer Science And Engineering')
INSERT [dbo].[department] ([id], [code], [departmentName]) VALUES (20, N'EEE', N'Electronics And Electrical Engineering')
INSERT [dbo].[department] ([id], [code], [departmentName]) VALUES (21, N'BBA', N'Bachelor Of Business Administration')
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[designation] ON 

INSERT [dbo].[designation] ([id], [designation]) VALUES (1, N'Professor')
INSERT [dbo].[designation] ([id], [designation]) VALUES (2, N'Associate Professor')
INSERT [dbo].[designation] ([id], [designation]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[designation] ([id], [designation]) VALUES (4, N'Lecturer')
INSERT [dbo].[designation] ([id], [designation]) VALUES (5, N'Assistant Lecturer')
SET IDENTITY_INSERT [dbo].[designation] OFF
SET IDENTITY_INSERT [dbo].[enrollCourse] ON 

INSERT [dbo].[enrollCourse] ([id], [regNo], [courseId], [enrollDate]) VALUES (8, N'CSE-2017-001', N'28', N'2017-06-15')
INSERT [dbo].[enrollCourse] ([id], [regNo], [courseId], [enrollDate]) VALUES (9, N'CSE-2017-002', N'29', N'2017-06-13')
SET IDENTITY_INSERT [dbo].[enrollCourse] OFF
SET IDENTITY_INSERT [dbo].[resultGrades] ON 

INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (14, N'A+')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (15, N'A')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (16, N'A-')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (17, N'B')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (18, N'B-')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (19, N'C')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (20, N'D')
INSERT [dbo].[resultGrades] ([id], [gradeLetter]) VALUES (21, N'F')
SET IDENTITY_INSERT [dbo].[resultGrades] OFF
SET IDENTITY_INSERT [dbo].[semester] ON 

INSERT [dbo].[semester] ([id], [semester]) VALUES (1, N'1st')
INSERT [dbo].[semester] ([id], [semester]) VALUES (2, N'2nd')
INSERT [dbo].[semester] ([id], [semester]) VALUES (3, N'3rd')
INSERT [dbo].[semester] ([id], [semester]) VALUES (4, N'4th')
INSERT [dbo].[semester] ([id], [semester]) VALUES (5, N'5th')
INSERT [dbo].[semester] ([id], [semester]) VALUES (6, N'6th')
INSERT [dbo].[semester] ([id], [semester]) VALUES (7, N'7th')
INSERT [dbo].[semester] ([id], [semester]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[semester] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [name], [registrationNo], [email], [contactNo], [date], [address], [departmentId]) VALUES (20, N'Md.Rakibul Hasan', N'CSE-2017-001', N'rkhasan@gmail.com', N'01857333667', CAST(0xEE3C0B00 AS Date), N'Chittagong', 19)
INSERT [dbo].[student] ([id], [name], [registrationNo], [email], [contactNo], [date], [address], [departmentId]) VALUES (21, N'Akib', N'CSE-2017-002', N'akib@mail.com', N'01857963254', CAST(0xE63C0B00 AS Date), N'Chittagong', 19)
SET IDENTITY_INSERT [dbo].[student] OFF
SET IDENTITY_INSERT [dbo].[studentResult] ON 

INSERT [dbo].[studentResult] ([id], [studentId], [regNo], [courseId], [gradeId]) VALUES (3, 20, N'CSE-2017-001', 28, 14)
INSERT [dbo].[studentResult] ([id], [studentId], [regNo], [courseId], [gradeId]) VALUES (4, 21, N'CSE-2017-002', 29, 14)
SET IDENTITY_INSERT [dbo].[studentResult] OFF
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([id], [name], [address], [email], [contactNo], [designationId], [departmentId], [allottedCredit], [remainingCredit]) VALUES (1006, N'Mahadi Hossain', N'Chittagong', N'mahadi@mail.com', N'01918312275', 1, 19, CAST(21.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)))
INSERT [dbo].[teacher] ([id], [name], [address], [email], [contactNo], [designationId], [departmentId], [allottedCredit], [remainingCredit]) VALUES (1007, N'Abdullah Kafi', N'Chittagong', N'kafi@mail.com', N'01859785265', 2, 19, CAST(23.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_department]    Script Date: 6/20/2017 11:58:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_department] ON [dbo].[department]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_department_1]    Script Date: 6/20/2017 11:58:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_department_1] ON [dbo].[department]
(
	[departmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assignCourses]  WITH CHECK ADD  CONSTRAINT [FK_assignCourses_course] FOREIGN KEY([courseId])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[assignCourses] CHECK CONSTRAINT [FK_assignCourses_course]
GO
ALTER TABLE [dbo].[assignCourses]  WITH CHECK ADD  CONSTRAINT [FK_assignCourses_Teacher] FOREIGN KEY([teacherId])
REFERENCES [dbo].[teacher] ([id])
GO
ALTER TABLE [dbo].[assignCourses] CHECK CONSTRAINT [FK_assignCourses_Teacher]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [FK_course_department] FOREIGN KEY([departmentId])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [FK_course_department]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [FK_course_semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[semester] ([id])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [FK_course_semester]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_department] FOREIGN KEY([departmentId])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_department]
GO
ALTER TABLE [dbo].[teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_department] FOREIGN KEY([departmentId])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[teacher] CHECK CONSTRAINT [FK_Teacher_department]
GO
ALTER TABLE [dbo].[teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([designationId])
REFERENCES [dbo].[designation] ([id])
GO
ALTER TABLE [dbo].[teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 250
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "da"
            Begin Extent = 
               Top = 234
               Left = 38
               Bottom = 347
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'classScheduleInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'classScheduleInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'classScheduleInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "assignCourses"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 138
               Left = 251
               Bottom = 234
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseDetailsWithTeacherSemesterDepartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseDetailsWithTeacherSemesterDepartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseWithAllocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseWithAllocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 459
               Bottom = 136
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 667
               Bottom = 102
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseWithAssignedTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'courseWithAssignedTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "enrollCourse"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'enrolledCourseByStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'enrolledCourseByStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 259
               Bottom = 268
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 252
               Left = 38
               Bottom = 348
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentResultDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentResultDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "department"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentWithDepartmentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'studentWithDepartmentName'
GO
USE [master]
GO
ALTER DATABASE [VarsityDB] SET  READ_WRITE 
GO
