IF OBJECT_ID('Usun_rezerwacje', 'P') is not null 
DROP PROC Usun_rezerwacje

GO 
CREATE PROCEDURE Usun_rezerwacje (
	@ID_Rezerwacji INT
)
AS
	BEGIN TRY
		IF NOT EXISTS (SELECT ID_rezerwacji From Rezerwacje where ID_rezerwacji = @ID_Rezerwacji)
		 RAISERROR('Rezerwacja jak¹ nalezy usun¹æ ( o id %i ) nie istnieje', 16, 1, @ID_Rezerwacji)

		DECLARE @DATA DATETIME
		SET @DATA = (SELECT DATA FROM Rezerwacje R join Loty L on R.Id_lotu = L.Id_lotu
					 where R.Id_Rezerwacji = @ID_Rezerwacji)

		IF @DATA < CURRENT_TIMESTAMP
		 RAISERROR('Nie mo¿na usuwaæ rezerwacji na lot który ju¿ siê odby³', 16, 1)
		
		DELETE FROM Rezerwacje
		where Id_Rezerwacji = @ID_Rezerwacji
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

