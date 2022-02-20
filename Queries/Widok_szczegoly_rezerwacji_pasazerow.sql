IF Object_ID('dbo.vw_Szczegoly_rezerwacji_pasazerow' , 'V') is not null 
Drop view   dbo.vw_Szczegoly_rezerwacji_pasazerow

GO
CREATE VIEW vw_Szczegoly_rezerwacji_pasazerow As
SELECT P.Id_Pasazera, P.NR_Paszportu, P.Imie, P.Nazwisko, P.Panstwo [Obywatelstwo], 
R.Id_Rezerwacji, R.Id_lotu, R.Klasa_podrozy, 
L1.Miasto, L1.Panstwo, L1.Data, L1.Typ_lotu,
Count(B.Id_bagazu) [Ilosc bagazy], 
Round(Sum(B.Waga), 2) [Waga sumaryczna bagazy],
ROUND(dbo.Cena_sumaryczna_rezerwacji(R.Id_Rezerwacji), 2) [Cena rezerwacji]
From Pasazer P join Rezerwacje R on P.Id_Pasazera = R.Id_pasazera
join (Select Loty.Data, Loty.Id_lotu, Loty.Id_samolotu, Loty.Typ_lotu, Pl.Miasto, Pl.Panstwo from Loty 
join Polaczenia_z_lotniskami Pl on Loty.Dokad = Pl.Id_lotniska Or Loty.Skad = Pl.Id_lotniska)
L1 on R.Id_lotu = L1.Id_lotu
join Bagaz B on R.Id_Rezerwacji = B.Id_rezerwacji
Group by P.Id_Pasazera, P.NR_Paszportu, P.Imie, P.Nazwisko, P.Panstwo, R.Id_Rezerwacji, 
R.Id_lotu, R.Klasa_podrozy, L1.Miasto, L1.Panstwo, L1.Data, L1.Typ_lotu
Go

Select * from dbo.vw_Szczegoly_rezerwacji_pasazerow
USE Port_lotniczyFULL