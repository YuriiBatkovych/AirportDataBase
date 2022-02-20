IF OBJECT_ID('Zmien_bramke', 'P') is not null 
DROP PROC Zmien_bramke

GO
CREATE PROCEDURE Zmien_bramke (
	@ID_lotu INT,
	@Nowy_terminal VARCHAR(1),
	@Nowa_bramka INT
)
AS 
	BEGIN TRY
		IF NOT EXISTS (SELECT Id_lotu FROM LOTY WHERE Id_lotu = @ID_lotu)
		 RAISERROR ('Nie istnieje Lot o id %i', 16, 1, @ID_lotu)

		IF NOT EXISTS (SELECT Id_terminalu FROM Terminale WHERE Id_terminalu = @Nowy_terminal)
		 RAISERROR ('Nie istnieje Terminal o id %s', 16, 1, @Nowy_terminal)

		IF NOT EXISTS (SELECT Nr_bramki FROM Bramki WHERE Id_terminalu = @Nowy_terminal and Nr_bramki = @Nowa_bramka)
		 RAISERROR ('Nie istnieje Bramka o numerze %i w terminale %s', 16, 1, @Nowa_bramka, @Nowy_terminal)

		DECLARE @DATA DATETIME
		SET @DATA = (SELECT DATA from Loty where Id_lotu = @ID_lotu)

		IF @DATA < CURRENT_TIMESTAMP
		 RAISERROR('Lot o id %i juz siê odby³, nie mo¿na zmienaæ dane archiwum', 16, 1 , @ID_lotu)

		DECLARE @Typ_lotu VARCHAR(12)
		SET @Typ_lotu = (Select Typ_lotu from Loty where Id_lotu = @ID_lotu)

		IF @Typ_lotu = 'Odlot' 
		BEGIN
			IF EXISTS (SELECT ID_Lotu FROM LOTY where ID_terminalu = @Nowy_terminal and Nr_bramki = @Nowa_bramka
		           and (Data BETWEEN DATEADD(HOUR, -2, @DATA) and DATEADD(MINUTE, 30, @DATA)))
		    RAISERROR ('Bramka o numerze %i w terminale %s jest zajêta w czasie potrzebnym dla obslugi
		    lotu o id %i', 16, 1, @Nowa_bramka, @Nowy_terminal, @Id_lotu)
		END
		ELSE
		BEGIN
			IF EXISTS (SELECT ID_Lotu FROM LOTY where ID_terminalu = @Nowy_terminal and Nr_bramki = @Nowa_bramka
		           and (Data BETWEEN DATEADD(MINUTE, -30, @DATA) and DATEADD(HOUR, 1, @DATA)))
		    RAISERROR ('Bramka o numerze %i w terminale %s jest zajêta w czasie potrzebnym dla obslugi
		    lotu o id %i', 16, 1, @Nowa_bramka, @Nowy_terminal, @Id_lotu)
		END
		
		UPDATE LOTY
		SET Nr_Bramki = @Nowa_bramka, ID_terminalu = @Nowy_terminal
		where Id_lotu = @ID_lotu
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT
		SET @ErrorMessage = ERROR_MESSAGE()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
GO

EXEC Zmien_bramke @ID_Lotu = 1067 , @Nowy_Terminal = 'A', @Nowa_bramka = 2
EXEC Zmien_bramke @ID_Lotu = 1002 , @Nowy_Terminal = 'F', @Nowa_bramka = 2
EXEC Zmien_bramke @ID_Lotu = 1002 , @Nowy_Terminal = 'B', @Nowa_bramka = 8
EXEC Zmien_bramke @ID_Lotu = 1067 , @Nowy_Terminal = 'A', @Nowa_bramka = 2

INSERT INTO LOTY VALUES
(1035, 81, 9, null, 'A', 3, '2021-01-31 10:20:00.000' , 'Odlot')


EXEC Zmien_bramke @ID_Lotu = 1035 , @Nowy_Terminal = 'C', @Nowa_bramka = 1
EXEC Zmien_bramke @ID_Lotu = 1034 , @Nowy_Terminal = 'D', @Nowa_bramka = 5

SELECT * FROM LOTY
DELETE FROM LOTY where Id_lotu = 1035