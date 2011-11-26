USE [INFO3420_12]
GO

/****** Object:  Table [dbo].[RECIPEASE_RECIPE_TAG]    Script Date: 11/21/2011 17:20:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RECIPEASE_RECIPE_TAG](
	[rec_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [PK_RECIPEASE_RECIPE_TAG] PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RECIPEASE_RECIPE_TAG]  WITH CHECK ADD  CONSTRAINT [FK_RECIPEASE_RECIPE_TAG_RECIPEASE_RECIPE] FOREIGN KEY([rec_id])
REFERENCES [dbo].[RECIPEASE_RECIPE] ([rec_id])
GO

ALTER TABLE [dbo].[RECIPEASE_RECIPE_TAG] CHECK CONSTRAINT [FK_RECIPEASE_RECIPE_TAG_RECIPEASE_RECIPE]
GO

ALTER TABLE [dbo].[RECIPEASE_RECIPE_TAG]  WITH CHECK ADD  CONSTRAINT [FK_RECIPEASE_RECIPE_TAG_RECIPEASE_TAG] FOREIGN KEY([tag_id])
REFERENCES [dbo].[RECIPEASE_TAG] ([tag_id])
GO

ALTER TABLE [dbo].[RECIPEASE_RECIPE_TAG] CHECK CONSTRAINT [FK_RECIPEASE_RECIPE_TAG_RECIPEASE_TAG]
GO

