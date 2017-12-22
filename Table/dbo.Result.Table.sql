/****** Object:  Table [dbo].[Result]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[Game_id] [int] NOT NULL,
	[list_team] [nvarchar](1) NOT NULL,
	[FinishDate] [datetime] NULL,
	[Winer] [nvarchar](1) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK__Result__Game_id__65370702] FOREIGN KEY([Game_id])
REFERENCES [dbo].[Game] ([Game_id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK__Result__Game_id__65370702]
GO
