-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `Songs`
 (
	`songName`			varchar (255), 
	`songDuration`			datetime, 
	`genreID`			int, 
	`albumID`			int, 
	`languageID`			int, 
	`releaseYearID`			int, 
	`songSample`			blob, 
	`SID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Songs` ADD INDEX `albumID` (`albumID`);
ALTER TABLE `Songs` ADD INDEX `genreID` (`genreID`);
ALTER TABLE `Songs` ADD INDEX `languageID` (`languageID`);
ALTER TABLE `Songs` ADD PRIMARY KEY (`SID`);
ALTER TABLE `Songs` ADD INDEX `releaseYearID` (`releaseYearID`);
ALTER TABLE `Songs` ADD INDEX `SID1` (`SID`);

CREATE TABLE `AlbumEditions`
 (
	`edition`			varchar (100), 
	`AEID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `AlbumEditions` ADD INDEX `AEID` (`AEID`);
ALTER TABLE `AlbumEditions` ADD PRIMARY KEY (`AEID`);

CREATE TABLE `Albums`
 (
	`albumName`			varchar (255), 
	`albumDuration`			datetime, 
	`albumPrice`			float, 
	`editionID`			int, 
	`typeID`			int, 
	`artistID`			int, 
	`recordLabelID`			int, 
	`genreID`			int, 
	`releaseYearID`			int, 
	`totalTracks`			smallint, 
	`isExplicit`			boolean NOT NULL, 
	`coverArt`			blob, 
	`ALID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Albums` ADD INDEX `ALID1` (`ALID`);
ALTER TABLE `Albums` ADD INDEX `artistID` (`artistID`);
ALTER TABLE `Albums` ADD INDEX `editionID` (`editionID`);
ALTER TABLE `Albums` ADD INDEX `genreID` (`genreID`);
ALTER TABLE `Albums` ADD PRIMARY KEY (`ALID`);
ALTER TABLE `Albums` ADD INDEX `recordLabelID` (`recordLabelID`);
ALTER TABLE `Albums` ADD INDEX `releaseYearID` (`releaseYearID`);
ALTER TABLE `Albums` ADD INDEX `typeID` (`typeID`);

CREATE TABLE `AlbumTypes`
 (
	`typeName`			varchar (100), 
	`ATID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `AlbumTypes` ADD INDEX `ATID1` (`ATID`);
ALTER TABLE `AlbumTypes` ADD PRIMARY KEY (`ATID`);

CREATE TABLE `Countries`
 (
	`countryName`			varchar (200), 
	`CID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Countries` ADD INDEX `CID1` (`CID`);
ALTER TABLE `Countries` ADD PRIMARY KEY (`CID`);

CREATE TABLE `FollowingUsers`
 (
	`followerID`			int, 
	`followedID`			int, 
	`ID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `FollowingUsers` ADD INDEX `followedID` (`followedID`);
ALTER TABLE `FollowingUsers` ADD INDEX `followerID` (`followerID`);
ALTER TABLE `FollowingUsers` ADD INDEX `ID1` (`ID`);
ALTER TABLE `FollowingUsers` ADD PRIMARY KEY (`ID`);

CREATE TABLE `Genres`
 (
	`genreName`			varchar (100), 
	`GID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Genres` ADD INDEX `GID1` (`GID`);
ALTER TABLE `Genres` ADD PRIMARY KEY (`GID`);

CREATE TABLE `Languages`
 (
	`languageName`			varchar (100), 
	`LID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Languages` ADD INDEX `LID1` (`LID`);
ALTER TABLE `Languages` ADD PRIMARY KEY (`LID`);

CREATE TABLE `ReleaseYears`
 (
	`year`			int, 
	`RYID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `ReleaseYears` ADD PRIMARY KEY (`RYID`);
ALTER TABLE `ReleaseYears` ADD INDEX `RYID1` (`RYID`);

CREATE TABLE `Users`
 (
	`username`			varchar (255), 
	`emailAddress`			varchar (255), 
	`password`			varchar (255), 
	`userFirstName`			varchar (255), 
	`userLastName`			varchar (255), 
	`userDOB`			datetime, 
	`registerDate`			datetime, 
	`UID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Users` ADD PRIMARY KEY (`UID`);
ALTER TABLE `Users` ADD INDEX `UID1` (`UID`);

CREATE TABLE `RecordLabels`
 (
	`labelName`			varchar (255), 
	`website`			text, 
	`countryID`			int, 
	`RLID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `RecordLabels` ADD INDEX `countryID` (`countryID`);
ALTER TABLE `RecordLabels` ADD PRIMARY KEY (`RLID`);
ALTER TABLE `RecordLabels` ADD INDEX `RLID1` (`RLID`);

CREATE TABLE `Artists`
 (
	`artistName`			varchar (255), 
	`monthlyListener`			int, 
	`recordLabelID`			int, 
	`genreID`			int, 
	`countryOriginID`			int, 
	`dateOfBirth`			int, 
	`AID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Artists` ADD INDEX `AID1` (`AID`);
ALTER TABLE `Artists` ADD INDEX `countryOriginID` (`countryOriginID`);
ALTER TABLE `Artists` ADD INDEX `genreID` (`genreID`);
ALTER TABLE `Artists` ADD PRIMARY KEY (`AID`);
ALTER TABLE `Artists` ADD INDEX `recordLabelID` (`recordLabelID`);

CREATE TABLE `~TMPCLP132341`
 (
	`SIPID`			int NOT NULL, 
	`addedDate`			datetime, 
	`playlistID`			int, 
	`songID`			int, 
	`songOrder`			smallint, 
	`artistID`			int
);

-- CREATE INDEXES ...
ALTER TABLE `~TMPCLP132341` ADD INDEX `artistID` (`artistID`);
ALTER TABLE `~TMPCLP132341` ADD INDEX `playlistID` (`playlistID`);
ALTER TABLE `~TMPCLP132341` ADD PRIMARY KEY (`SIPID`);
ALTER TABLE `~TMPCLP132341` ADD INDEX `songID` (`songID`);

CREATE TABLE `SongsToArtists`
 (
	`songID`			int, 
	`artistID`			int, 
	`artistRole`			varchar (100), 
	`STAID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `SongsToArtists` ADD INDEX `artistID` (`artistID`);
ALTER TABLE `SongsToArtists` ADD PRIMARY KEY (`STAID`);
ALTER TABLE `SongsToArtists` ADD INDEX `songID` (`songID`);
ALTER TABLE `SongsToArtists` ADD INDEX `STAID1` (`STAID`);

CREATE TABLE `SavedArtists`
 (
	`artistID`			int, 
	`userID`			int, 
	`SAID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `SavedArtists` ADD INDEX `artistID` (`artistID`);
ALTER TABLE `SavedArtists` ADD PRIMARY KEY (`SAID`);
ALTER TABLE `SavedArtists` ADD INDEX `SAID1` (`SAID`);
ALTER TABLE `SavedArtists` ADD INDEX `userID` (`userID`);

CREATE TABLE `Playlists`
 (
	`playlistName`			varchar (255), 
	`creationDate`			datetime, 
	`description`			text, 
	`userID`			int, 
	`isPrivate`			boolean NOT NULL, 
	`PID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `Playlists` ADD INDEX `PID1` (`PID`);
ALTER TABLE `Playlists` ADD PRIMARY KEY (`PID`);
ALTER TABLE `Playlists` ADD INDEX `userID` (`userID`);

CREATE TABLE `SongsInPlaylists`
 (
	`addedDate`			datetime, 
	`playlistID`			int, 
	`songID`			int, 
	`artistID`			int, 
	`songOrder`			smallint, 
	`SIPID`			int not null auto_increment unique
);

-- CREATE INDEXES ...
ALTER TABLE `SongsInPlaylists` ADD INDEX `artistID` (`artistID`);
ALTER TABLE `SongsInPlaylists` ADD INDEX `playlistID` (`playlistID`);
ALTER TABLE `SongsInPlaylists` ADD PRIMARY KEY (`SIPID`);
ALTER TABLE `SongsInPlaylists` ADD INDEX `SIPID1` (`SIPID`);
ALTER TABLE `SongsInPlaylists` ADD INDEX `songID` (`songID`);


-- CREATE Relationships ...
ALTER TABLE `MSysNavPaneGroups` ADD CONSTRAINT `MSysNavPaneGroups_GroupCategoryID_fk` FOREIGN KEY (`GroupCategoryID`) REFERENCES `MSysNavPaneGroupCategories`(`Id`) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `MSysNavPaneGroupToObjects` ADD CONSTRAINT `MSysNavPaneGroupToObjects_GroupID_fk` FOREIGN KEY (`GroupID`) REFERENCES `MSysNavPaneGroups`(`Id`) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE `Songs` ADD CONSTRAINT `Songs_albumID_fk` FOREIGN KEY (`albumID`) REFERENCES `Albums`(`ALID`);
