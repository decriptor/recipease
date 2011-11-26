USE [INFO3420_12]
GO

/****** Object:  Table [dbo].[RECIPEASE_MEAL]    Script Date: 11/26/2011 08:36:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RECIPEASE_MEAL](
	[meal_date] [varchar](50) NOT NULL,
	[rec_id] [int] NOT NULL,
	[meal_type] [varchar](50) NULL,
	[meal_subtype] [varchar](50) NULL,
	[meal_owner] [varchar](50) NULL,
	[meal_timestamp] [datetime] NULL,
 CONSTRAINT [PK_RECIPEASE_MEAL] PRIMARY KEY CLUSTERED 
(
	[meal_date] ASC,
	[rec_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RECIPEASE_MEAL]  WITH CHECK ADD  CONSTRAINT [FK_RECIPEASE_MEAL_RECIPEASE_RECIPE] FOREIGN KEY([rec_id])
REFERENCES [dbo].[RECIPEASE_RECIPE] ([rec_id])
GO

ALTER TABLE [dbo].[RECIPEASE_MEAL] CHECK CONSTRAINT [FK_RECIPEASE_MEAL_RECIPEASE_RECIPE]
GO

