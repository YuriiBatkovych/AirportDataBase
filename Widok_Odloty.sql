IF Object_ID('dbo.vw_Odloty' , 'V') is not null 
Drop view   dbo.vw_Odloty

GO
CREATE VIEW vw_Odloty AS
Select L.Id_lotu, L.Id_terminalu, L.Nr_bramki, L.Data, L.Typ_lotu,
Pl.Miasto, Pl.Nazwa_lotniska, Pl.Panstwo,
P.Nazwa [Przewoznik],
S.Marka [Marka samolotu], S.Model [Model samolotu]
from Loty L join Polaczenia_z_lotniskami Pl on L.Dokad = Pl.Id_lotniska
join Samoloty S on L.Id_samolotu = S.Id_samolotu
join Przewoznicy P on S.Id_przewoznika = P.Id_przewoznika
where Typ_lotu = 'Odlot'
GO

SELECT * from dbo.vw_Odloty
