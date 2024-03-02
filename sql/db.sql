USE [TestOnline]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 2/28/2024 12:26:53 AM ******/
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
/****** Object:  Table [dbo].[QuestionOption]    Script Date: 2/28/2024 12:26:53 AM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 2/28/2024 12:26:53 AM ******/
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
/****** Object:  Table [dbo].[result]    Script Date: 2/28/2024 12:26:53 AM ******/
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
/****** Object:  Table [dbo].[Tests]    Script Date: 2/28/2024 12:26:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](100) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[duration] [int] NULL,
	[desciption] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/28/2024 12:26:53 AM ******/
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
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
SET IDENTITY_INSERT [dbo].[QuestionOption] ON 

INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (1, 1, N'A', N'4', 1)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (2, 1, N'B', N'5', 0)
INSERT [dbo].[QuestionOption] ([OptionID], [QuestionID], [OptionName], [OptionText], [IsCorrect]) VALUES (3, 1, N'C', N'6', 0)
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
SET IDENTITY_INSERT [dbo].[QuestionOption] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (1, 1, N'What is 2 + 2?', 5)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (2, 1, N'Solve for x: 3x - 7 = 14', 10)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (3, 2, N'Who wrote Romeo and Juliet?', 8)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (4, 3, N'What is the chemical symbol for gold?', 7)
INSERT [dbo].[Questions] ([QuestionID], [TestID], [QuestionText], [Points]) VALUES (5, 4, N'Who was the first president of the United States?', 6)
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
SET IDENTITY_INSERT [dbo].[result] OFF
GO
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [desciption]) VALUES (1, N'Math Test', CAST(N'2024-03-01T10:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [desciption]) VALUES (2, N'English Test', CAST(N'2024-03-02T14:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [desciption]) VALUES (3, N'Science Test', CAST(N'2024-03-03T09:45:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [desciption]) VALUES (4, N'History Test', CAST(N'2024-03-04T11:15:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Tests] ([TestID], [TestName], [StartTime], [duration], [desciption]) VALUES (5, N'Programming Test', CAST(N'2024-03-05T13:30:00.000' AS DateTime), NULL, NULL)
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
