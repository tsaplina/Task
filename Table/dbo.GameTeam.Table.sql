/****** Object:  Table [dbo].[GameTeam]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTeam](
	[Game_id] [int] NOT NULL,
	[team_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GameTeam]  WITH CHECK ADD  CONSTRAINT [FK__GameTeam__Game_i__5F7E2DAC] FOREIGN KEY([Game_id])
REFERENCES [dbo].[Game] ([Game_id])
GO
ALTER TABLE [dbo].[GameTeam] CHECK CONSTRAINT [FK__GameTeam__Game_i__5F7E2DAC]
GO
ALTER TABLE [dbo].[GameTeam]  WITH CHECK ADD  CONSTRAINT [FK__GameTeam__team_i__607251E5] FOREIGN KEY([team_id])
REFERENCES [dbo].[Team] ([team_id])
GO
ALTER TABLE [dbo].[GameTeam] CHECK CONSTRAINT [FK__GameTeam__team_i__607251E5]
GO
