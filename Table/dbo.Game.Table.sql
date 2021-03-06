/****** Object:  Table [dbo].[Game]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Game_id] [int] IDENTITY(1,1) NOT NULL,
	[list_team] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Puzzle_id] [int] NOT NULL,
 CONSTRAINT [PK__Game__09300026F215153B] PRIMARY KEY CLUSTERED 
(
	[Game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK__Game__Puzzle_id__5D95E53A] FOREIGN KEY([Puzzle_id])
REFERENCES [dbo].[Puzzle] ([Puzzle_id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK__Game__Puzzle_id__5D95E53A]
GO
