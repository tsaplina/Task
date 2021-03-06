/****** Object:  Table [dbo].[GamePerson]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePerson](
	[person_id] [int] NOT NULL,
	[game_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GamePerson]  WITH CHECK ADD  CONSTRAINT [FK__GamePerso__game___625A9A57] FOREIGN KEY([game_id])
REFERENCES [dbo].[Game] ([Game_id])
GO
ALTER TABLE [dbo].[GamePerson] CHECK CONSTRAINT [FK__GamePerso__game___625A9A57]
GO
ALTER TABLE [dbo].[GamePerson]  WITH CHECK ADD  CONSTRAINT [FK__GamePerso__perso__634EBE90] FOREIGN KEY([person_id])
REFERENCES [dbo].[Person] ([personId])
GO
ALTER TABLE [dbo].[GamePerson] CHECK CONSTRAINT [FK__GamePerso__perso__634EBE90]
GO
