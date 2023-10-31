CREATE DATABASE MusicPlayer

USE MusicPlayer

CREATE TABLE [USERS](
	UserId INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) DEFAULT 'XXX',
	Username VARCHAR(50) NOT NULL,
	[Password] VARCHAR(50) NOT NULL,
	Gender VARCHAR(50) NOT NULL
)

CREATE TABLE Artists(
	ArtistId INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) DEFAULT 'XXX',
	Birthday  DATE,
	Gender VARCHAR(50) NOT NULL
)

CREATE TABLE Categories(
	CategoryId INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Musics (
    MusicId INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(100),
    Duration INT,
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryID)
)

CREATE TABLE Playlist (
    PlaylistId INT,
    MusicId INT,
    UserId INT,
    FOREIGN KEY (MusicId) REFERENCES Musics(MusicId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
)

CREATE TABLE MusicArtist (
    MusicId INT,
    ArtistId INT,
    FOREIGN KEY (MusicId) REFERENCES Musics(MusicId),
    FOREIGN KEY (ArtistId) REFERENCES Artists(ArtistId)
)


INSERT INTO Users ([Name], Surname, Username, [Password], Gender)
VALUES ('Ryan', 'Gosling', 'Driver', 'IamjustKen42', 'AttackHelicopter')

INSERT INTO Artists ([Name] , Birthday, Gender)
VALUES ('Vaganich', '1998-05-05', 'Croissant')

INSERT INTO Categories ([Name])
VALUES ('Post-Punk')

INSERT INTO Musics ([Name], Duration, CategoryID)
VALUES ('Toska', 295, 1)

INSERT INTO Playlist (PlaylistID, MusicID, UserID)
VALUES (1, 1, 1)

INSERT INTO MusicArtist (MusicID, ArtistID)
VALUES (1, 1)

CREATE VIEW SongInformation 
AS
SELECT m.[Name] SongName, 
	   m.Duration SongLengt,
	   c.[Name] Category,
	   CONCAT(a.[Name], ' ', a.Surname) Artist
FROM Musics m
JOIN Categories c ON m.CategoryID=c.CategoryId
JOIN MusicArtist ma ON m.MusicId=ma.MusicId
JOIN Artists a ON ma.ArtistId=a.ArtistId

SELECT * FROM SongInformation
