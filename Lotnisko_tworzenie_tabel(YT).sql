IF OBJECT_ID('Pracownicy', 'U') is not NUll DROP TABLE Pracownicy 

CREATE TABLE Pracownicy(
	ID_Pracownika int not null,
	Imie nvarchar(50) not null,
	Nazwisko nvarchar(50) not null,
	Stanowisko nvarchar(50) not null,
	Stawka money not null
)


IF OBJECT_ID('GR_Obslugi_lotu', 'U') is not NUll DROP TABLE GR_Obslugi_lotu

CREATE TABLE GR_Obslugi_lotu(
	Id_lotu int not null,
	Id_Pracownika int not null
)

IF OBJECT_ID('Osoby niebezpieczne', 'U') is not NUll DROP TABLE [Osoby niebezpieczne]

CREATE TABLE [Osoby niebezpieczne](
	NR_Paszportu varchar(15) not null,
	Imie nvarchar(50) not null,
	Nazwisko nvarchar(50) not null,
)

IF OBJECT_ID('Pasazer', 'U') is not NUll DROP TABLE Pasazer

CREATE TABLE Pasazer(
	Id_Pasazera int not null,
	NR_Paszportu varchar(15) not null UNIQUE,
	Imie nvarchar(50) not null,
	Nazwisko nvarchar(50) not null,
	Panstwo nvarchar(15) null
)

IF OBJECT_ID('Klasa podrozy', 'U') is not NUll DROP TABLE [Klasa podrozy]

CREATE TABLE [Klasa podrozy](
	Klasa int not null,
	Prowizja real not null  
)


IF OBJECT_ID('Rezerwacje', 'U') is not NUll DROP TABLE Rezerwacje

CREATE TABLE Rezerwacje(
	Id_Rezerwacji int not null,
	Id_lotu int not null,
	Id_pasazera int not null,
	Klasa_podrozy int not null
)

IF OBJECT_ID('Bagaz', 'U') is not NUll DROP TABLE Bagaz

CREATE TABLE Bagaz(
	Id_rezerwacji int not null,
	Id_bagazu int not null,
	Waga real not null
)

IF OBJECT_ID('Cennik_Bagazy', 'U') is not NUll DROP TABLE [Cennik_Bagazy]

CREATE TABLE [Cennik_Bagazy](
	Waga int not null, -- do X kg
	Cena money not null,
)

-- PRIMARY KEY :
Alter table [Cennik_Bagazy] add PRIMARY KEY (Waga)
Alter table Bagaz add Primary Key (Id_rezerwacji, Id_bagazu)
Alter table Rezerwacje add Primary Key (Id_Rezerwacji)
Alter table [Klasa podrozy] add Primary Key (Klasa)
Alter table Pasazer add Primary Key (Id_Pasazera)
Alter table [Osoby niebezpieczne] add Primary Key (NR_Paszportu)
Alter table GR_Obslugi_lotu add Primary Key (Id_lotu, ID_Pracownika)
Alter table Pracownicy add Primary Key (ID_Pracownika)

--FOREIGN KEY :

Alter table GR_Obslugi_lotu add Foreign Key (ID_Pracownika) REFERENCES Pracownicy(ID_Pracownika)
ON DELETE CASCADE
ON UPDATE CASCADE

-- Alter table GR_Obslugi_lotu add Foreign Key (ID_lotu) REFERENCES Loty(ID_Lotu)
-- ON DELETE CASCADE
-- ON UPDATE CASCADE

Alter table Rezerwacje add FOREIGN KEY (Id_pasazera) REFERENCES Pasazer(Id_Pasazera)
ON DELETE CASCADE
ON UPDATE CASCADE

Alter table Rezerwacje add FOREIGN KEY (Klasa_podrozy) REFERENCES [Klasa podrozy](Klasa)

--Alter table Rezerwacje add FOREIGN KEY (Id_lotu) REFERENCES [Loty](Id_lotu)
--ON DELETE CASCADE
--ON UPDATE CASCADE

Alter table Bagaz add FOREIGN KEY (Id_rezerwacji) REFERENCES Rezerwacje(Id_rezerwacji)
ON DELETE CASCADE
ON UPDATE CASCADE

-- UNIQUE
Alter TABLE REZERWACJE 
ADD UNIQUE(ID_LOTU, ID_PASAZERA)



