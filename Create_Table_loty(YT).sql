Create table LOTY (
	Id_lotu int PRIMARY KEY,
	Id_samolotu int not null,
	Dokad int,
	Skad int,
	Id_terminalu NVARCHAR(1) not null,
	Nr_bramki int not null,
	Data DATE NOT NULL,
	Typ_lotu NVARCHAR(10) not null
)

Alter table LOTY 
add FOREIGN KEY (Id_terminalu, Nr_bramki) REFERENCES Bramki(Id_terminalu, Nr_bramki)
ON Delete Cascade
ON UPDATE CASCADE

Alter table LOTY 
add FOREIGN KEY (Id_samolotu) REFERENCES Samoloty(Id_samolotu)
ON Delete Cascade
ON UPDATE CASCADE

Alter table LOTY 
add FOREIGN KEY (Dokad) REFERENCES Polaczenia_z_lotniskami(Id_lotniska)
ON Delete Cascade
ON UPDATE CASCADE

Alter table LOTY 
add FOREIGN KEY (Skad) REFERENCES Polaczenia_z_lotniskami(Id_lotniska)
ON Delete Cascade
ON UPDATE CASCADE

Alter table LOTY 
add CONSTRAINT CK1 CHECK 
((Typ_lotu='Odlot' AND (Dokad is not null) AND (Skad is null)) OR (Typ_lotu='Przylot' AND (Dokad is null) AND (Skad is not null)))

