USE [TestOnline]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TestID] [int] NULL,
	[QuestionID] [int] NULL,
	[UserAnswer] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionOption]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionOption](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[OptionName] [char](1) NOT NULL,
	[OptionText] [varchar](255) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NULL,
	[QuestionText] [varchar](255) NOT NULL,
	[Points] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[result]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[TestID] [int] NULL,
	[Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](100) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[duration] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/2/2024 4:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[UserRole] [int] NULL,
	[Gender] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 

INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (11, 1, 1, 1, N'A')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (12, 1, 1, 2, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (13, 1, 2, 3, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (14, 2, 3, 4, N'A')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (15, 2, 3, 5, N'A')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (16, 3, 4, 4, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (17, 4, 5, 1, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (18, 4, 5, 5, N'A')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (19, 5, 1, 1, N'A')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (20, 5, 2, 3, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (23, 2, 1, 1, N'B')
INSERT [dbo].[Answers] ([AnswerID], [UserID], [TestID], [QuestionID], [UserAnswer]) VALUES (24, 2, 1, 2, N'B')
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionOption] ON 

INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (1, 1, N'A', N'6', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (2, 1, N'B', N'2', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (3, 1, N'C', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (4, 2, N'A', N'x = 7', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (5, 2, N'B', N'x = 5', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (6, 2, N'C', N'x = 10', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (7, 3, N'A', N'Charles Dickens', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (8, 3, N'B', N'William Shakespeare', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (9, 3, N'C', N'Jane Austen', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (10, 4, N'A', N'Au', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (11, 4, N'B', N'Ag', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (12, 4, N'C', N'Fe', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (13, 5, N'A', N'George Washington', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (14, 5, N'B', N'Thomas Jefferson', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (15, 5, N'C', N'Abraham Lincoln', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (64, 19, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (65, 19, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (66, 19, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (67, 19, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (68, 20, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (69, 20, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (70, 20, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (71, 20, N'D', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (72, 21, N'A', N'1 ', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (73, 21, N'B', N'12312', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (74, 21, N'C', N'3 ', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (75, 21, N'D', N'4', 0)
SET IDENTITY_INSERT [dbo].[QuestionOption] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (1, 1, N'What is 2 + 2?', 5)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (2, 1, N'Solve for x: 3x - 7 = 14', 10)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (3, 2, N'Who wrote Romeo and Juliet?', 8)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (4, 3, N'What is the chemical symbol for gold?', 7)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (5, 4, N'Who was the first president of the United States?', 6)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (19, 67, N'What is 2 + 2 = ?', 3)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (20, 67, N'asdasdasd 2 + 2 = ?', 3)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (21, 67, N'What is 2 + 2 = ????', 30)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[result] ON 

INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (11, 1, 1, 15)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (12, 1, 2, 8)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (13, 2, 3, 13)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (14, 3, 4, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (15, 4, 5, 6)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (16, 5, 1, 5)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (17, 6, 2, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (18, 7, 3, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (19, 8, 4, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (20, 9, 5, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (21, 2, 2, 0)
INSERT [dbo].[result] ([ResultID], [UserID], [TestID], [Score]) VALUES (22, 2, 1, 10)
SET IDENTITY_INSERT [dbo].[result] OFF
GO
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (1, N'Math Test 2', CAST(N'2024-03-01T10:00:00.000' AS DateTime), 60, N'A small test on how you can hanle Mathematic for Engineering', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (2, N'English Test', CAST(N'2024-03-02T14:30:00.000' AS DateTime), 50, N'A small test on how you can hanle Mathematic for Engineering', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (3, N'Science Test', CAST(N'2024-03-03T09:45:00.000' AS DateTime), 50, N'A small test on how you can hanle Mathematic for Engineering', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (4, N'History Test', CAST(N'2024-03-04T11:15:00.000' AS DateTime), 50, N'A small test on how you can hanle Mathematic for Engineering', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (5, N'Programming Test', CAST(N'2024-03-05T13:30:00.000' AS DateTime), 50, N'A small test on how you can hanle Mathematic for Engineering', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (6, N'MAE101', CAST(N'2024-03-01T08:00:00.000' AS DateTime), 60, N'Description for Test 1', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (7, N'PRO192', CAST(N'2024-03-02T09:00:00.000' AS DateTime), 45, N'Description for Test 2', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (8, N'PRJ120', CAST(N'2024-03-03T10:00:00.000' AS DateTime), 30, N'Description for Test 3', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (9, N'ASDA44', CAST(N'2024-03-04T11:00:00.000' AS DateTime), 75, N'Description for Test 4', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (10, N'DFSDFF', CAST(N'2024-03-05T12:00:00.000' AS DateTime), 90, N'Description for Test 5', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (11, N'ASDADDA', CAST(N'2024-03-06T13:00:00.000' AS DateTime), 120, N'Description for Test 6', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (12, N'ASD232', CAST(N'2024-03-07T14:00:00.000' AS DateTime), 60, N'Description for Test 7', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (13, N'ASAR212', CAST(N'2024-03-08T15:00:00.000' AS DateTime), 45, N'Description for Test 8', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (14, N'ASDAD1', CAST(N'2024-03-09T16:00:00.000' AS DateTime), 30, N'Description for Test 9', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (15, N'ASD231', CAST(N'2024-03-10T17:00:00.000' AS DateTime), 75, N'Description for Test 10', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (16, N'ASD232', CAST(N'2024-03-11T18:00:00.000' AS DateTime), 90, N'Description for Test 11', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (17, N'ASDA23', CAST(N'2024-03-12T19:00:00.000' AS DateTime), 120, N'Description for Test 12', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (18, N'ASDA22', CAST(N'2024-03-13T20:00:00.000' AS DateTime), 60, N'Description for Test 13', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (19, N'GHJ768', CAST(N'2024-03-14T21:00:00.000' AS DateTime), 45, N'Description for Test 14', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (20, N'FGHFG898', CAST(N'2024-03-15T22:00:00.000' AS DateTime), 30, N'Description for Test 15', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (21, N'TGHJG', CAST(N'2024-03-16T23:00:00.000' AS DateTime), 75, N'Description for Test 16', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (22, N'GHJGH8', CAST(N'2024-03-17T08:00:00.000' AS DateTime), 90, N'Description for Test 17', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (23, N'GJGHJ6', CAST(N'2024-03-18T09:00:00.000' AS DateTime), 120, N'Description for Test 18', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (24, N'TGHJ5', CAST(N'2024-03-19T10:00:00.000' AS DateTime), 60, N'Description for Test 19', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (25, N'GHJG45', CAST(N'2024-03-20T11:00:00.000' AS DateTime), 45, N'Description for Test 20', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (26, N'DGDF45', CAST(N'2024-03-21T12:00:00.000' AS DateTime), 30, N'Description for Test 21', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (27, N'DFGDF5', CAST(N'2024-03-22T13:00:00.000' AS DateTime), 75, N'Description for Test 22', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (28, N'TDFGD9', CAST(N'2024-03-23T14:00:00.000' AS DateTime), 90, N'Description for Test 23', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (29, N'DFG345', CAST(N'2024-03-24T15:00:00.000' AS DateTime), 120, N'Description for Test 24', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (30, N'DFGD44', CAST(N'2024-03-25T16:00:00.000' AS DateTime), 60, N'Description for Test 25', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (31, N'DFGD53', CAST(N'2024-03-26T17:00:00.000' AS DateTime), 45, N'Description for Test 26', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (32, N'DFGD3', CAST(N'2024-03-27T18:00:00.000' AS DateTime), 30, N'Description for Test 27', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (33, N'DFGDG3', CAST(N'2024-03-28T19:00:00.000' AS DateTime), 75, N'Description for Test 28', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (34, N'TDFGDG', CAST(N'2024-03-29T20:00:00.000' AS DateTime), 90, N'Description for Test 29', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (35, N'T34537', CAST(N'2024-03-30T21:00:00.000' AS DateTime), 120, N'Description for Test 30', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (36, N'MAE101', CAST(N'2024-03-01T08:00:00.000' AS DateTime), 60, N'Description for Test 1', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (37, N'PRO192', CAST(N'2024-03-02T09:00:00.000' AS DateTime), 45, N'Description for Test 2', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (38, N'PRJ120', CAST(N'2024-03-03T10:00:00.000' AS DateTime), 30, N'Description for Test 3', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (39, N'ASDA44', CAST(N'2024-03-04T11:00:00.000' AS DateTime), 75, N'Description for Test 4', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (40, N'DFSDFF', CAST(N'2024-03-05T12:00:00.000' AS DateTime), 90, N'Description for Test 5', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (41, N'ASDADDA', CAST(N'2024-03-06T13:00:00.000' AS DateTime), 120, N'Description for Test 6', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (42, N'ASD232', CAST(N'2024-03-07T14:00:00.000' AS DateTime), 60, N'Description for Test 7', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (43, N'ASAR212', CAST(N'2024-03-08T15:00:00.000' AS DateTime), 45, N'Description for Test 8', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (44, N'ASDAD1', CAST(N'2024-03-09T16:00:00.000' AS DateTime), 30, N'Description for Test 9', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (45, N'ASD231', CAST(N'2024-03-10T17:00:00.000' AS DateTime), 75, N'Description for Test 10', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (46, N'ASD232', CAST(N'2024-03-11T18:00:00.000' AS DateTime), 90, N'Description for Test 11', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (47, N'ASDA23', CAST(N'2024-03-12T19:00:00.000' AS DateTime), 120, N'Description for Test 12', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (48, N'ASDA22', CAST(N'2024-03-13T20:00:00.000' AS DateTime), 60, N'Description for Test 13', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (49, N'GHJ768', CAST(N'2024-03-14T21:00:00.000' AS DateTime), 45, N'Description for Test 14', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (50, N'FGHFG898', CAST(N'2024-03-15T22:00:00.000' AS DateTime), 30, N'Description for Test 15', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (51, N'TGHJG', CAST(N'2024-03-16T23:00:00.000' AS DateTime), 75, N'Description for Test 16', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (52, N'GHJGH8', CAST(N'2024-03-17T08:00:00.000' AS DateTime), 90, N'Description for Test 17', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (53, N'GJGHJ6', CAST(N'2024-03-18T09:00:00.000' AS DateTime), 120, N'Description for Test 18', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (54, N'TGHJ5', CAST(N'2024-03-19T10:00:00.000' AS DateTime), 60, N'Description for Test 19', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (55, N'GHJG45', CAST(N'2024-03-20T11:00:00.000' AS DateTime), 45, N'Description for Test 20', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (56, N'DGDF45', CAST(N'2024-03-21T12:00:00.000' AS DateTime), 30, N'Description for Test 21', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (57, N'DFGDF5', CAST(N'2024-03-22T13:00:00.000' AS DateTime), 75, N'Description for Test 22', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (58, N'TDFGD9', CAST(N'2024-03-23T14:00:00.000' AS DateTime), 90, N'Description for Test 23', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (59, N'DFG345', CAST(N'2024-03-24T15:00:00.000' AS DateTime), 120, N'Description for Test 24', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (60, N'DFGD44', CAST(N'2024-03-25T16:00:00.000' AS DateTime), 60, N'Description for Test 25', 1)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (61, N'DFGD53', CAST(N'2024-03-26T17:00:00.000' AS DateTime), 45, N'Description for Test 26', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (62, N'DFGD3', CAST(N'2024-03-27T18:00:00.000' AS DateTime), 30, N'Description for Test 27', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (63, N'DFGDG3', CAST(N'2024-03-28T19:00:00.000' AS DateTime), 75, N'Description for Test 28', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (64, N'TDFGDG', CAST(N'2024-03-29T20:00:00.000' AS DateTime), 90, N'Description for Test 29', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (65, N'T34537', CAST(N'2024-03-30T21:00:00.000' AS DateTime), 120, N'Description for Test 30', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (66, N'Added Test', CAST(N'2024-03-01T11:20:00.000' AS DateTime), 50, N'update description', 0)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [Description], [status]) VALUES (67, N'Test Test Question', CAST(N'2024-03-01T11:20:00.000' AS DateTime), 70, N'update edfgdfg', 1)
SET IDENTITY_INSERT [dbo].[Tests] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (1, N'admin', N'user1@example.com', N'123', 0, N'Male')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (2, N'User2', N'user2@example.com', N'123', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (3, N'User3', N'user3@example.com', N'123', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (4, N'User4', N'user4@example.com', N'123', 1, N'Male')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (5, N'User5', N'user5@example.com', N'passworddef', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (6, N'User6', N'user6@example.com', N'passwordghi', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (7, N'User7', N'user7@example.com', N'passwordjkl', 1, N'Male')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (8, N'User8', N'user8@example.com', N'passwordmno', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (9, N'User9', N'user9@example.com', N'passwordpqr', 1, N'Female')
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [Password], [UserRole], [Gender]) VALUES (10, N'User10', N'user10@example.com', N'passwordstu', 1, N'Male')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[result] ADD  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[Tests] ADD  CONSTRAINT [df_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([TestID])
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[QuestionOption]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([TestID])
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([TestID])
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
