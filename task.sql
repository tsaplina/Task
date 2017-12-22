USE [task]
GO

CREATE TABLE [dbo].[Blok_user](
[UserID] int IDENTITY(1,1) PRIMARY KEY,
[UserLogin] [varchar] (50) NOT NULL,
[Password] [varchar] (50) NOT NULL,
[Email] [varchar] (50) NOT NULL,
[RegistrationDate] [datetime] NOT NULL,

)

ALTER TABLE Blok_user
ADD CONSTRAINT  Task_Blok_user_Registration DEFAULT (getdate()) FOR RegistrationDate
GO

ALTER TABLE Blok_user
ADD CONSTRAINT  Task_Blok_user_LoginUser_unique UNIQUE (UserLogin)
GO

ALTER TABLE Blok_user
ADD CONSTRAINT  Task_Blok_user_Email_unique UNIQUE (Email)
GO

CREATE TABLE [dbo].[City](
[city_id] int IDENTITY(1,1) PRIMARY KEY,
[City_name] [nvarchar] (50) NOT NULL,
)


CREATE TABLE [dbo].[Person](
[personId] int NOT NULL PRIMARY KEY,
[cityID] int NOT NULL,
[f_name] [nvarchar] (50) NOT NULL,
[l_name] [nvarchar] (50) NOT NULL,
[phone] [varchar] (11) NOT NULL,
[Link_user] [nvarchar] (100) NOT NULL,
FOREIGN KEY (personId) REFERENCES Blok_User(UserID),
FOREIGN KEY (cityID) REFERENCES City(City_id)
)



CREATE TABLE [dbo].[Team](
[team_id] int NOT NULL PRIMARY KEY,
[Name] [nvarchar] (50) NOT NULL,
[lead] int NOT NULL
)

CREATE TABLE [dbo].[MemberTeam](
[Personid] int NOT NULL,
[Team_id] int NOT NULL,
[Role] [nvarchar] (5) NOT NULL,
FOREIGN KEY (personid) REFERENCES Person,
FOREIGN KEY (team_id) REFERENCES Team,
)

CREATE TABLE [dbo].[Puzzle](
[Puzzle_id] int IDENTITY(1,1) PRIMARY KEY,
[puzzle_list] [text] NOT NULL
)

CREATE TABLE [dbo].[AnsPuzzle](
[AnsPuzzle_id] int IDENTITY(1,1) PRIMARY KEY,
[puzzle_answer] [text] NOT NULL
FOREIGN KEY (AnsPuzzle_id) REFERENCES Puzzle
)

CREATE TABLE [dbo].[Game](
[Game_id] int IDENTITY(1,1) PRIMARY KEY,
[list_team] [int] NOT NULL,
[StartDate] [datetime] NOT NULL,
[Puzzle_id] int NOT NULL,
FOREIGN KEY (Puzzle_id) REFERENCES Puzzle,
)

CREATE TABLE [dbo].[GameTeam](
[Game_id] int NOT NULL,
[team_id] int NOT NULL,
FOREIGN KEY (Game_id) REFERENCES Game,
FOREIGN KEY (team_id) REFERENCES Team,
)


CREATE TABLE [dbo].[GamePerson](
[person_id] int NOT NULL,
[game_id] int NOT NULL,
FOREIGN KEY (Game_id) REFERENCES Game,
FOREIGN KEY (person_id) REFERENCES Person,
)


CREATE TABLE [dbo].[Result](
[Game_id] int NOT NULL,
[list_team] [nvarchar] NOT NULL,
[FinishDate] [datetime] NULL,
[Winer] [nvarchar] NULL,
FOREIGN KEY (Game_id) REFERENCES Game,
)


CREATE TRIGGER new_profile 
ON Blok_user
FOR INSERT AS
IF @@ROWCOUNT = 0
BEGIN
    RETURN
	SET NOCOUNT ON
END
ELSE
BEGIN
	UPDATE Person
	SET person.Link_user = Link_user + 
	(SELECT Email FROM Blok_user WHERE
	Blok_user.UserID = Person.personId)
END

CREATE TRIGGER List_start_team 
ON GameTeam
FOR INSERT AS
IF @@ROWCOUNT = 0
BEGIN
    RETURN
	SET NOCOUNT ON
END
ELSE
BEGIN
	UPDATE Game
	SET game.list_team = game.list_team + 
	(SELECT Name FROM Team WHERE
	(Team.team_id = GameTeam.team_id) AND 
	(GameTeam.Game_id = Game.Game_id))
END


