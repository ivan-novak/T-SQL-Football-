USE [master]
GO
/****** Object:  Database [Football]    Script Date: 27.01.2021 19:37:00 ******/
CREATE DATABASE [Football]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Football_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Football] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Football].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Football] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Football] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Football] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Football] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Football] SET ARITHABORT OFF 
GO
ALTER DATABASE [Football] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Football] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Football] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Football] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Football] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Football] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Football] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Football] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Football] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Football] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Football] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Football] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Football] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Football] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Football] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Football] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Football] SET RECOVERY FULL 
GO
ALTER DATABASE [Football] SET  MULTI_USER 
GO
ALTER DATABASE [Football] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Football] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Football] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Football] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Football] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Football] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Football', N'ON'
GO
ALTER DATABASE [Football] SET QUERY_STORE = OFF
GO
USE [Football]
GO
/****** Object:  Table [dbo].[Trainers]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Country] [nvarchar](4) NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Trainer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [nvarchar](4) NOT NULL,
	[Name] [nvarchar](120) NULL,
	[Id_Firm] [nvarchar](50) NULL,
	[Group] [nchar](10) NULL,
	[Score] [int] NULL,
	[Item] [nvarchar](10) NULL,
 CONSTRAINT [PK_Countries_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Members]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[Members]
as

SELECT C.*
  FROM [Football].[dbo].[Countries] as C join (Select distinct Id_Country from Trainers) as T on C.Id = T.Id_Country
GO
/****** Object:  Table [dbo].[Players]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Country] [nvarchar](4) NULL,
	[Id_Position] [nvarchar](4) NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Teams]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[Teams]
as

SELECT C.*
  FROM [Football].[dbo].[Countries] as C join (Select distinct Id_Country from Players) as T on C.Id = T.Id_Country
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Id] [nvarchar](4) NOT NULL,
	[Date] [datetime] NULL,
	[Id_Stadium] [int] NULL,
	[Id_Judge] [int] NULL,
	[Id_CountryA] [nvarchar](4) NULL,
	[Id_CountryB] [nvarchar](4) NULL,
	[GoolsA] [int] NULL,
	[GoolsB] [int] NULL,
	[Viewers] [int] NULL,
	[Winner]  AS (case when [GoolsA]>[GoolsB] then [Id_CountryA] else case when [GoolsA]<[GoolsB] then [Id_CountryB]  end end),
	[Loser]  AS (case when [GoolsA]<[GoolsB] then [Id_CountryA] else case when [GoolsA]>[GoolsB] then [Id_CountryB]  end end),
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ResultAllGames]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[ResultAllGames]
as
SELECT Id as Id_Match, [Id_CountryA] as Country, ISNULL([GoolsA], 0) as Gools ,ISNULL([GoolsB], 0) as Fails FROM [dbo].[Matches] UNION
SELECT Id as Id_Match, [Id_CountryB] as Country ,ISNULL([GoolsB], 0) as Gools, ISNULL([GoolsA], 0) as Fails FROM [dbo].[Matches]
GO
/****** Object:  View [dbo].[ResultGroupGames]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[ResultGroupGames]
as
select *, substring(Id_Match, 2, 1) as [Group] from [dbo].[ResultAllGames] where id_Match like 'G%'

GO
/****** Object:  View [dbo].[SummaryGroups]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












/*результаты группового этапа*/
CREATE view [dbo].[SummaryGroups]
as
	select [Group], Country, sum(Gools) as Gools, sum(Fails) as Fails, sum(iif(Gools > Fails, 1, 0)) as Winner, sum(iif(Gools < Fails, 1, 0)) as Loser 
	from [dbo].[ResultGroupGames] group by Country, [Group]
GO
/****** Object:  View [dbo].[ResultPlayOffGames]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[ResultPlayOffGames]
as
select * from [dbo].[ResultAllGames] where id_Match like '[^G]%'

GO
/****** Object:  View [dbo].[StatisticGames]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[StatisticGames]
as
select 
	sum(GoolsA + GoolsB) as TotalGools, 
	avg(GoolsA + GoolsB) as AvgGools,
	sum(Viewers) as TotalViewers,
	avg(Viewers) as AvgViewers
from Matches
GO
/****** Object:  View [dbo].[StatisticMaxGools]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[StatisticMaxGools]
as
select top(2) Country, sum(Gools) as TotalGools from [dbo].[ResultAllGames] group by Country order by TotalGools desc
GO
/****** Object:  View [dbo].[StatisticMinGools]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMinGools]
as
select top(2) Country, sum(Gools) as TotalGools from [dbo].[ResultAllGames] group by Country order by TotalGools
GO
/****** Object:  View [dbo].[StatisticMaxFails]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMaxFails]
as
select top(2) Country, sum(Fails) as TotalFails from [dbo].[ResultAllGames] group by Country order by TotalFails desc
GO
/****** Object:  View [dbo].[StatisticMinFails]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMinFails]
as
select top(2) Country, sum(Fails) as TotalFails from [dbo].[ResultAllGames] group by Country order by TotalFails
GO
/****** Object:  View [dbo].[StatisticMaxWins]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMaxWins]
as
select top(2) Country, sum(iif(Gools > Fails, 1, 0)) as TotalWins from [dbo].[ResultAllGames] group by Country order by TotalWins desc
GO
/****** Object:  View [dbo].[StatisticMinWins]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMinWins]
as
select top(2) Country, sum(iif(Gools > Fails, 1, 0)) as TotalWins from [dbo].[ResultAllGames] group by Country order by TotalWins
GO
/****** Object:  View [dbo].[StatisticMaxLoses]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMaxLoses]
as
select top(2) Country, sum(iif(Gools < Fails, 1, 0)) as TotalLoses from [dbo].[ResultAllGames] group by Country order by TotalLoses desc
GO
/****** Object:  View [dbo].[StatisticMinLoses]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[StatisticMinLoses]
as
select top(2) Country, sum(iif(Gools < Fails, 1, 0)) as TotalLoses from [dbo].[ResultAllGames] group by Country order by TotalLoses
GO
/****** Object:  Table [dbo].[Gools]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gools](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Player] [int] NULL,
	[Id_Match] [nvarchar](4) NOT NULL,
	[Minute] [int] NOT NULL,
	[Second] [int] NOT NULL,
 CONSTRAINT [PK_DistinguishedPlayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StatisticBestPlayer]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[StatisticBestPlayer]
as
	select FullName, Id_Country, Id_Position, TotalGools from 
	(select top(10) Id_Player, count(Id_Player) as TotalGools from [dbo].[Gools] group by Id_Player order by TotalGools desc) as G
	join Players 
	on Players.Id = Id_Player
GO
/****** Object:  View [dbo].[SummaryFinalysts]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[SummaryFinalysts]
as
select top(3) * from [dbo].[ResultPlayOffGames] where Id_Match like 'F%' order by Id_Match, (Gools - Fails) desc

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firms]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FIrms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Judges]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Association] [nvarchar](70) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Judges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [nvarchar](4) NOT NULL,
	[Position] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadiums]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Id_City] [int] NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Stadiums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Firms] FOREIGN KEY([Id_Firm])
REFERENCES [dbo].[Firms] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Firms]
GO
ALTER TABLE [dbo].[Gools]  WITH CHECK ADD  CONSTRAINT [FK_Gools_Matches] FOREIGN KEY([Id_Match])
REFERENCES [dbo].[Matches] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gools] CHECK CONSTRAINT [FK_Gools_Matches]
GO
ALTER TABLE [dbo].[Gools]  WITH CHECK ADD  CONSTRAINT [FK_Gools_Players] FOREIGN KEY([Id_Player])
REFERENCES [dbo].[Players] ([Id])
GO
ALTER TABLE [dbo].[Gools] CHECK CONSTRAINT [FK_Gools_Players]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Countries] FOREIGN KEY([Id_CountryA])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Countries]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Countries1] FOREIGN KEY([Id_CountryB])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Countries1]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Judges] FOREIGN KEY([Id_Judge])
REFERENCES [dbo].[Judges] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Judges]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Stadiums] FOREIGN KEY([Id_Stadium])
REFERENCES [dbo].[Stadiums] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Stadiums]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Countries1] FOREIGN KEY([Id_Country])
REFERENCES [dbo].[Countries] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Countries1]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Positions] FOREIGN KEY([Id_Position])
REFERENCES [dbo].[Positions] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Positions]
GO
ALTER TABLE [dbo].[Stadiums]  WITH CHECK ADD  CONSTRAINT [FK_Stadiums_Cities] FOREIGN KEY([Id_City])
REFERENCES [dbo].[Cities] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Stadiums] CHECK CONSTRAINT [FK_Stadiums_Cities]
GO
ALTER TABLE [dbo].[Trainers]  WITH CHECK ADD  CONSTRAINT [FK_Trainers_Countries1] FOREIGN KEY([Id_Country])
REFERENCES [dbo].[Countries] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Trainers] CHECK CONSTRAINT [FK_Trainers_Countries1]
GO
/****** Object:  StoredProcedure [dbo].[PlayGame]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PlayGame] 
	@Id_Match nvarchar(4),
	@Id_CountryA nvarchar(2),
	@Id_CountryB nvarchar(2)
AS
BEGIN
   -- генерируем результаты матча в основное время
	
	declare @GoolA int = abs(CHECKSUM(NEWID()))%4
	declare @GoolB int = abs(CHECKSUM(NEWID()))%4
	-- генрируем пинальти после основного времени
	if @GoolA = @GoolB and SUBSTRING(@Id_Match, 1, 1) <> 'G'
	begin
		if CHECKSUM(NEWID())>0 set @GoolA = @GoolA + 1 else set @GoolB = @GoolB + 1;
	end
	--- вносим результат в турнирную таблицу
	update M set 
		Id_CountryA = @Id_CountryA, 
		Id_CountryB = @Id_CountryB,
		GoolsA = @GoolA,
		GoolsB = @GoolB,
		Id_Judge = (select top(1) id from Judges order by NEWID()),
		Viewers = (select cast (Capacity * (rand(abs(CHECKSUM(NEWID())))*0.5 + 0.5) as int)  from Stadiums join Matches on Id_Stadium = Stadiums.Id where Matches.Id = @Id_Match)
	from dbo.Matches as M
	where @Id_Match = M.Id 
	--очищаем предыдущие результаты
	delete from Gools where Id_Match = @Id_Match
    -- вносим голы команды А в базу
	declare @Gool int = 1
	while (@Gool <= @GoolA) 
	begin	
		insert into Gools(Id_Player, Id_Match, [Minute], [Second]) values (
		(select top(1) Id from Players where Id_Country = @Id_CountryA and Id_Position <> 'GK' order by NEWID()),
		 @Id_Match, abs(CHECKSUM(NEWID()))%90,  abs(CHECKSUM(NEWID()))%60)
		 set @Gool = @Gool + 1;
	end
	-- вносим голы команды B в базу
	set @Gool = 1
	while (@Gool <= @GoolB) 
	begin
		insert into Gools(Id_Player, Id_Match, [Minute], [Second]) values (
		(select top(1) Id from Players where Id_Country = @Id_CountryB and Id_Position <> 'GK' order by NEWID()),
		 @Id_Match, abs(CHECKSUM(NEWID()))%90,  abs(CHECKSUM(NEWID()))%60)
		 set @Gool = @Gool + 1;
	end
END


GO
/****** Object:  StoredProcedure [dbo].[ReplayFinal]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReplayFinal]
AS
BEGIN
	---- выбираем пару победитилей предыдущего этапа
	declare @Team1 nvarchar(4) = (Select Winner from dbo.Matches where Id = 'SF1')
	declare @Team2 nvarchar(4) = (Select Winner from dbo.Matches where Id = 'SF2')
	---- проводим матч между этими командами
	exec PlayGame 'F1', @Team1, @Team2
END
GO
/****** Object:  StoredProcedure [dbo].[ReplayFromGroups]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReplayFromGroups]
as
begin
	--Очистка статистики голов
	delete from Gools
    -- Жеребьевка команд по 8 группам
	update dbo.Teams set 
		dbo.Teams.[Group] = I % 8 + 1,
		dbo.Teams.Item = (I - 1) / 8 + 1,
		dbo.Teams.Id_Firm = (select top(1) Id from dbo.Firms order by NEWID())
	from dbo.Teams join (select id, ROW_NUMBER() OVER (order by NEWID())  as I from dbo.Teams) as G  on dbo.Teams.id = G.Id

	--проводим отборочные игры в восьми группах
	declare @groupN int = 1
	declare @itemA int = 1
	declare @itemB int = 1
	while @groupN <= 8
	begin
		set @itemA = 1
		while @itemA <= 4
		begin			
			set @itemB = 1
			while @itemB <= 4
			begin
			if @itemA <> @itemB
				begin
					declare @match nvarchar(10) = 'G' + format(@groupN, 'd') + format(@itemA, 'd') + format(@itemB, 'd')
					declare @teamA nvarchar(10) = (select Id from Teams where Teams.[Group] = @groupN and Item = @itemA)
					declare @teamB nvarchar(10) = (select Id from Teams where Teams.[Group] = @groupN and Item = @itemB)
					--print @match + ' ' + @teamA + ' ' + @teamB
					exec PlayGame @match, @teamA, @teamB
				end	
				set @itemB = @itemB +1
			end
			set @itemA  = @itemA + 1
		end
		set @groupN  = @groupN + 1
	end
	--играем следующий этап
	exec RePlayOff8
end
GO
/****** Object:  StoredProcedure [dbo].[RePlayOff2]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RePlayOff2]
AS
BEGIN
	declare @Match nvarchar(8)
	declare @Game int = 0 
	declare @PreMatch1 nvarchar(8)
	declare @PreMatch2 nvarchar(8)
	---  повторить для каждой пары в группе
	while (@Game < 2 ) begin
		---- генерируем код матча
		set @PreMatch1 = 'QF' + format(@Game*2+1, 'd')
		set @PreMatch2 = 'QF' + format(@Game*2+2, 'd')	
		set @Game = @Game + 1
		set @Match = 'SF' + format(@Game, 'd')
		print @Match
		---- выбираем пару победитилей предыдущего этапа
		declare @Team1 nvarchar(4) = (Select Winner from dbo.Matches where Id = @PreMatch1)
		declare @Team2 nvarchar(4) = (Select Winner from dbo.Matches where Id = @PreMatch2)
		---- проводим матч между этими командами
		exec PlayGame @Match, @Team1, @Team2
	end
	--играем следующий этап
	exec RePlayThirdPlace
	exec ReplayFinal
END
GO
/****** Object:  StoredProcedure [dbo].[RePlayOff4]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[RePlayOff4]
AS
BEGIN
	declare @Match nvarchar(8)
	declare @Game int = 0 
	declare @PreMatch1 nvarchar(8)
	declare @PreMatch2 nvarchar(8)
	---  повторить для каждой пары в группе
	while (@Game<4) begin
		---- генерируем код матча
		set @PreMatch1 = 'A0' + format(@Game*2+1, 'd')
		set @PreMatch2 = 'A0' + format(@Game*2+2, 'd')	
		set @Game = @Game + 1
		set @Match = 'QF' + format(@Game, 'd')
		print @Match
		---- выбираем пару победитилей предыдущего этапа
		declare @Team1 nvarchar(4) = (Select Winner from dbo.Matches where Id = @PreMatch1)
		declare @Team2 nvarchar(4) = (Select Winner from dbo.Matches where Id = @PreMatch2)
		---- проводим матч между этими командами
		exec PlayGame @Match, @Team1, @Team2
	end
	--играем следующий этап
	exec RePlayOff2
END
GO
/****** Object:  StoredProcedure [dbo].[RePlayOff8]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[RePlayOff8] 
AS
BEGIN
	declare @Match nvarchar(8)
	declare @Group int = 0 
	---  повторить для каждой пары в группе
	while (@Group<8) begin
		---- генерируем код матча
		set @Group = @Group + 1
		set @Match = 'A0' + format(@Group, 'd')
		---- выбираем пару победитилей предыдущего этапа
		declare @Team1 nvarchar(4) = (Select top(1) Country from [dbo].[SummaryGroups] where [Group] = @Group order by Winner - Loser desc, Gools - Fails desc, Gools desc)
		declare @Team2 nvarchar(4) = (Select top(1) Country from [dbo].[SummaryGroups] where [Group] = @Group and Country <> @Team1  order by Winner - Loser desc, Gools - Fails desc, Gools desc)
		---- проводим матч между этими командами
		exec PlayGame @Match, @Team1, @Team2
	end
	--играем следующий этап
	exec RePlayOff4
END



GO
/****** Object:  StoredProcedure [dbo].[RePlayThirdPlace]    Script Date: 27.01.2021 19:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RePlayThirdPlace]
AS
BEGIN
	---- выбираем пару победитилей предыдущего этапа
	declare @Team1 nvarchar(4) = (Select Loser from dbo.Matches where Id = 'SF1')
	declare @Team2 nvarchar(4) = (Select Loser from dbo.Matches where Id = 'SF2')
	---- проводим матч между этими командами
	exec PlayGame 'F3', @Team1, @Team2

END
GO
USE [master]
GO
ALTER DATABASE [Football] SET  READ_WRITE 
GO
