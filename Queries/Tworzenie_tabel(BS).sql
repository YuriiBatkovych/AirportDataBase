CREATE DATABASE Port_lotniczy

--teraz uruchamianie kwerendy z poziomy bazy danych Port_lotniczy
CREATE TABLE Przewoznicy (
	Id_przewoznika INT PRIMARY KEY,
	Nazwa NVARCHAR(50) NOT NULL,
	Panstwo NVARCHAR(50) NOT NULL,
	Nr_telefonu NVARCHAR(13) NOT NULL   
);


CREATE TABLE Samoloty_szczegoly (
	Marka NVARCHAR(20),
	Model NVARCHAR(20),
	Ilosc_miejsc INT NOT NULL,
	PRIMARY KEY(Marka, Model)
)

CREATE TABLE Samoloty (
	Id_samolotu INT PRIMARY KEY,
	Marka NVARCHAR(20) NOT NULL,
	Model NVARCHAR(20) NOT NULL,
	Id_przewoznika INT NOT NULL,
	FOREIGN KEY (Marka, Model) REFERENCES Samoloty_szczegoly(Marka, Model) ON DELETE CASCADE ON UPDATE CASCADE
)

ALTER TABLE Samoloty
ADD CONSTRAINT FK_Samoloty FOREIGN KEY(Id_przewoznika) REFERENCES Przewoznicy(Id_przewoznika)
ON DELETE CASCADE  
ON UPDATE CASCADE;   
--te cascade to mozna w sumie dac przy tworzeniu tabeli

CREATE TABLE Umowy_z_przewoznikami (
	Id_przewoznika INT NOT NULL,
	Nr_umowy INT PRIMARY KEY,
	Od_kiedy DATE,
	Do_kiedy DATE,
	CHECK (Do_kiedy >= Od_kiedy),
	FOREIGN KEY (Id_przewoznika) REFERENCES Przewoznicy(Id_przewoznika) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Polaczenia_z_lotniskami (
	Id_lotniska INT PRIMARY KEY,
	Nazwa_lotniska NVARCHAR(50) NOT NULL,
	Panstwo NVARCHAR(50) NOT NULL,
	Miasto NVARCHAR(50) NOT NULL
);

CREATE TABLE Cennik_lotow (
	Dokad INT NOT NULL,
	Cena MONEY NOT NULL,
	Id_przewoznika INT NOT NULL,
	PRIMARY KEY(Dokad, Id_przewoznika),
	FOREIGN KEY(Dokad) REFERENCES Polaczenia_z_lotniskami(Id_lotniska) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Id_przewoznika) REFERENCES Przewoznicy(Id_przewoznika) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Terminale (
	Id_terminalu NVARCHAR(1) PRIMARY KEY,
	Kierunek_lotu NVARCHAR(2) NOT NULL
);


CREATE TABLE Bramki (
	Id_terminalu NVARCHAR(1) NOT NULL,
	Nr_bramki INT NOT NULL,
	PRIMARY KEY (Id_terminalu, Nr_bramki),
	FOREIGN KEY(Id_terminalu) REFERENCES Terminale(Id_terminalu) ON DELETE CASCADE ON UPDATE CASCADE
);