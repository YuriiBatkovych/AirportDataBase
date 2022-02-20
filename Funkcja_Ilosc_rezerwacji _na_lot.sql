IF Object_ID('dbo.Ilosc_rezerwacji_na_lot' , 'FN') is not null 
Drop function   dbo.Ilosc_rezerwacji_na_lot

Go
Create Function Ilosc_rezerwacji_na_lot (@Lot INT)
Returns INT
As
BEGIN
	DECLARE @Ilosc_rezerwacji INT
	Set @Ilosc_rezerwacji = (Select Count(R.Id_Rezerwacji) from Rezerwacje R
							 where R.Id_lotu = @Lot)
	Return @Ilosc_rezerwacji
END
GO

Select dbo.Ilosc_rezerwacji_na_lot(1000)