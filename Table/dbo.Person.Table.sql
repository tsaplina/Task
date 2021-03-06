/****** Object:  Table [dbo].[Person]    Script Date: 21.12.2017 19:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[personId] [int] NOT NULL,
	[cityID] [int] NOT NULL,
	[f_name] [nvarchar](50) NOT NULL,
	[l_name] [nvarchar](50) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[Link_user] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Person__EC7D7D4DF7E5C14D] PRIMARY KEY CLUSTERED 
(
	[personId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK__Person__cityID__45BE5BA9] FOREIGN KEY([cityID])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK__Person__cityID__45BE5BA9]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK__Person__personId__44CA3770] FOREIGN KEY([personId])
REFERENCES [dbo].[Blok_user] ([UserID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK__Person__personId__44CA3770]
GO
