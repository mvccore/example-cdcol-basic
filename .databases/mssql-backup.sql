USE master;
GO

CREATE DATABASE cdcol COLLATE Latin1_General_CS_AS;
GO

USE cdcol;
GO

CREATE TABLE dbo.cds (
	id INT IDENTITY(1,1) NOT NULL,
	title NVARCHAR(200) NOT NULL,
	interpret NVARCHAR(200) NOT NULL,
	[year] INT NULL DEFAULT 0,
	CONSTRAINT PK_cds PRIMARY KEY CLUSTERED (id ASC)
);
GO

SET IDENTITY_INSERT dbo.cds ON;
INSERT dbo.cds (id, title, interpret, [year]) VALUES 
	(1, N'Jump', N'Van Halen', 1984),
	(2, N'Hey Boy Hey Girl', N'The Chemical Brothers', 1999),
	(3, N'Black Light', N'Groove Armada', 2010),
	(4, N'Hotel', N'Moby', 2005),
	(5, N'Berlin Calling', N'Paul Kalkbrenner', 2008);
SET IDENTITY_INSERT dbo.cds OFF;
GO

CREATE NONCLUSTERED INDEX IX_cds_interpret ON dbo.cds (interpret ASC);
CREATE NONCLUSTERED INDEX IX_cds_title ON dbo.cds (title ASC);
CREATE NONCLUSTERED INDEX IX_cds_year ON dbo.cds ([year] ASC);
GO