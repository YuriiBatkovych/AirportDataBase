IF Object_ID('dbo.vw_Przyloty' , 'V') is not null 
Drop view   dbo.vw_Przyloty

GO
CREATE VIEW vw_Przyloty AS
Select L.Id_lotu, L.Id_terminalu, L.Nr_bramki, L.Data, L.Typ_lotu,
Pl.Miasto, Pl.Nazwa_lotniska, Pl.Panstwo,
P.Nazwa [Przewoznik],
S.Marka [Marka samolotu], S.Model [Model samolotu]
from Loty L join Polaczenia_z_lotniskami Pl on L.Skad = Pl.Id_lotniska
join Samoloty S on L.Id_samolotu = S.Id_samolotu
join Przewoznicy P on S.Id_przewoznika = P.Id_przewoznika
where Typ_lotu = 'Przylot'
GO

SELECT * from dbo.vw_Przyloty