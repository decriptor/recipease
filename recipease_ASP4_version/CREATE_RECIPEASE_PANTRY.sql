USE [INFO3420_12]
GO

/****** Object:  Table [dbo].[RECIPEASE_PANTRY]    Script Date: 11/21/2011 17:19:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RECIPEASE_PANTRY](
	[rec_owner] [varchar](50) NOT NULL,
	[pantry_item] [varchar](50) NOT NULL,
	[pantry_item_quantity] [decimal](18, 2) NULL,
	[unit_id] [int] NULL,
	[pantry_type_id] [int] NULL,
	[pantry_date] [datetime] NULL,
 CONSTRAINT [PK_RECIPEASE_PANTRY] PRIMARY KEY CLUSTERED 
(
	[rec_owner] ASC,
	[pantry_item] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RECIPEASE_PANTRY]  WITH CHECK ADD  CONSTRAINT [FK_RECIPEASE_PANTRY_RECIPEASE_PANTRY_TYPE] FOREIGN KEY([pantry_type_id])
REFERENCES [dbo].[RECIPEASE_PANTRY_TYPE] ([pantry_type_id])
GO

ALTER TABLE [dbo].[RECIPEASE_PANTRY] CHECK CONSTRAINT [FK_RECIPEASE_PANTRY_RECIPEASE_PANTRY_TYPE]
GO

ALTER TABLE [dbo].[RECIPEASE_PANTRY]  WITH CHECK ADD  CONSTRAINT [FK_RECIPEASE_PANTRY_RECIPEASE_UNIT] FOREIGN KEY([unit_id])
REFERENCES [dbo].[RECIPEASE_UNIT] ([unit_id])
GO

ALTER TABLE [dbo].[RECIPEASE_PANTRY] CHECK CONSTRAINT [FK_RECIPEASE_PANTRY_RECIPEASE_UNIT]
GO

