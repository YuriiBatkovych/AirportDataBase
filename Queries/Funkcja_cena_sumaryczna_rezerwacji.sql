IF Object_ID('dbo.Cena_sumaryczna_rezerwacji' , 'FN') is not null 
Drop function   dbo.Cena_sumaryczna_rezerwacji

GO
Create Function Cena_sumaryczna_rezerwacji (@rezerwacja INT) 
Returns MONEY
AS
BEGIN
 DECLARE @CENA MONEY
 DECLARE @Typ_lotu NVARCHAR(10)
 SET @Typ_lotu = (Select L.Typ_lotu from Rezerwacje R join Loty L on R.Id_lotu = L.Id_lotu
				  where R.Id_Rezerwacji = @rezerwacja)
 IF @Typ_lotu <> 'Odlot' or @Typ_lotu is NULL
	Set @CENA = 0
 ELSE 
	BEGIN
	DECLARE @CENA_polaczenia MONEY
	DECLARE @Przewoznik INT
	DECLARE @Dokad INT
	SET @Przewoznik = (Select S.Id_przewoznika  from Rezerwacje R join Loty L on R.Id_lotu = L.Id_lotu
					   join Samoloty S on L.Id_samolotu = S.Id_samolotu
					   where R.Id_Rezerwacji = @rezerwacja)
	SET @Dokad = (Select L.Dokad  from Rezerwacje R join Loty L on R.Id_lotu = L.Id_lotu
				  where R.Id_Rezerwacji = @rezerwacja)

	SET @CENA_polaczenia = (Select C.Cena from Cennik_lotow C where C.Dokad = @Dokad and C.Id_przewoznika = @Przewoznik)

	DECLARE @CENA_bagazy MONEY
	DECLARE @WAGA real
	SET @Waga = (Select Sum(B.Waga) from Bagaz B where B.Id_Rezerwacji = @rezerwacja)
	SET @Cena_bagazy = (Select MIN(C.Cena) from Cennik_Bagazy C where C.Waga > @WAGA)

	DECLARE @Prowizja real
	SET @Prowizja = (Select K.Prowizja from Rezerwacje R join [Klasa podrozy] K on R.Klasa_podrozy = K.Klasa
				     where R.Id_Rezerwacji = @rezerwacja)

	SET @CENA = (@CENA_polaczenia*(1+@Prowizja) + @CENA_bagazy)
	END

 RETURN @CENA
END
GO

Select dbo.Cena_sumaryczna_rezerwacji(1)
Select dbo.Cena_sumaryczna_rezerwacji(13)
Select dbo.Cena_sumaryczna_rezerwacji(15)

