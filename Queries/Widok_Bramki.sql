IF OBJECT_ID('dbo.vw_Bramki' , 'V') is not null DROP VIEW dbo.vw_Bramki

GO
CREATE VIEW vw_BRAMKI AS
SELECT T.Id_terminalu,T.Polozenie, B.Nr_bramki,
L.Id_lotu, L.Typ_lotu, S.Marka [Marka samolotu], S.Model [Model samolotu], L.Data,
Pl.Miasto, Pl.Panstwo, P.Nazwa [Przewoznik]
FROM BRAMKI B join Terminale T on B.Id_terminalu = T.Id_terminalu
JOIN LOTY L on L.Id_terminalu = B.Id_terminalu and L.Nr_bramki = B.Nr_bramki
JOIN Polaczenia_z_lotniskami Pl on (L.Dokad = Pl.Id_lotniska OR L.Skad=Pl.Id_lotniska)
JOIN Samoloty S on L.Id_samolotu = S.Id_samolotu
JOIN Przewoznicy P on S.Id_przewoznika =P.Id_przewoznika
GO

Select * from dbo.vw_BRAMKI