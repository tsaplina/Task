/****** Object:  Table [dbo].[MemberTeam]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTeam](
	[Personid] [int] NOT NULL,
	[Team_id] [int] NOT NULL,
	[Role] [nvarchar](5) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MemberTeam]  WITH CHECK ADD  CONSTRAINT [FK__MemberTea__Perso__498EEC8D] FOREIGN KEY([Personid])
REFERENCES [dbo].[Person] ([personId])
GO
ALTER TABLE [dbo].[MemberTeam] CHECK CONSTRAINT [FK__MemberTea__Perso__498EEC8D]
GO
ALTER TABLE [dbo].[MemberTeam]  WITH CHECK ADD  CONSTRAINT [FK__MemberTea__Team___4A8310C6] FOREIGN KEY([Team_id])
REFERENCES [dbo].[Team] ([team_id])
GO
ALTER TABLE [dbo].[MemberTeam] CHECK CONSTRAINT [FK__MemberTea__Team___4A8310C6]
GO
