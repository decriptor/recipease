USE [INFO3420_12]
GO

/****** Object:  Table [dbo].[RECIPEASE_RECIPE]    Script Date: 11/21/2011 17:19:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RECIPEASE_RECIPE](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[rec_name] [varchar](50) NOT NULL,
	[rec_desc] [varchar](256) NULL,
	[rec_prep_time] [varchar](20) NULL,
	[rec_cook_time] [varchar](20) NULL,
	[rec_cook_temp] [varchar](20) NULL,
	[rec_ready_time] [varchar](20) NULL,
	[rec_serving_size] [varchar](20) NULL,
	[rec_date] [datetime] NULL,
	[rec_image_path] [varchar](50) NULL,
	[rec_owner] [varchar](50) NOT NULL,
	[rec_rating] [tinyint] NULL,
	[rec_directions] [varchar](max) NULL,
 CONSTRAINT [PK_RECIPEASE_RECIPE] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

