IF OBJECT_ID('Tr_bagaz','TR') IS NOT NULL
DROP TRIGGER Tr_Bagaz

GO 
CREATE TRIGGER Tr_Bagaz ON BAGAZ
AFTER INSERT, UPDATE
AS
	DECLARE @Tab TABLE (ID_rezerwacji INT, Waga_sumaryczna REAL)
	
	INSERT INTO @Tab
	Select B.Id_rezerwacji, SUM(B.Waga) from Bagaz B
	Group by B.Id_rezerwacji
	
	IF EXISTS(SELECT * from @Tab T where Waga_sumaryczna >= 100)
	Begin 
		Delete from Bagaz  
		where ID_rezerwacji in (SELECT T.ID_rezerwacji from @Tab T where Waga_sumaryczna >= 100)
		
		SELECT T.ID_rezerwacji [Bagaz nastepujacych rezerwacji przekroczyl limit] from @Tab T where Waga_sumaryczna >= 100
	END
GO
