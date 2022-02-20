IF OBJECT_ID('Tr_gr_obslugi','TR') IS NOT NULL
DROP TRIGGER Tr_gr_obslugi

--Przyjmuje ¿e w jeden dzieñ pracownik mo¿e wykonaæ jeden lot

GO
CREATE TRIGGER TR_gr_obslugi on Gr_Obslugi_lotu
Instead of INSERT
As
	DECLARE K_Pracownik CURSOR
	FOR SELECT I.Id_lotu, I.Id_Pracownika FROM inserted I
	FOR READ ONLY

	DECLARE @Lot INT
	DECLARE @Pracownik INT
	
	OPEN K_Pracownik
	FETCH K_Pracownik INTO @Lot, @Pracownik
	WHILE @@FETCH_STATUS <> -1
	BEGIN
			IF not exists(Select * from LOTY where Id_lotu = @LOT)
			BEGIN
			    PRINT 'Nie istnieje Lot o ID '+CONVERT(VARCHAR(10), @LOT)
				FETCH K_Pracownik INTO @Lot, @Pracownik
				CONTINUE
			END

			IF not exists(SELECT * FROM Pracownicy where ID_Pracownika = @Pracownik)
			BEGIN
			    PRINT 'Nie wystepuje informacja o pracowniku o ID '+CONVERT(VARCHAR(10), @Pracownik)
				FETCH K_Pracownik INTO @Lot, @Pracownik
				CONTINUE
			END

			DECLARE @Stanowisko NVARCHAR(50)
			SET @Stanowisko = (SELECT Stanowisko from Pracownicy where ID_Pracownika = @Pracownik)
			IF @Stanowisko = 'celnik' OR @Stanowisko = 'straznik'
			BEGIN
				PRINT 'Pracowniku o ID '+CONVERT(VARCHAR(10), @Pracownik) + ' nie ma uprawnieñ dla obs³ugi lotu'
				FETCH K_Pracownik INTO @Lot, @Pracownik
				CONTINUE
			END

			DECLARE @DATA DATE
			SET @DATA = (SELECT CAST(DATA as DATE) from Loty where Id_lotu = @Lot)
			
			IF exists (Select * from GR_Obslugi_lotu Gr join Loty L on Gr.Id_lotu = L.Id_lotu
					   where Gr.Id_Pracownika = @Pracownik and Cast(L.Data as Date) = @DATA)
			BEGIN
				DECLARE @LOT2 INT
				SET @LOT2 = (Select L.Id_lotu from GR_Obslugi_lotu Gr join Loty L on Gr.Id_lotu = L.Id_lotu
					         where Gr.Id_Pracownika = @Pracownik and Cast(L.Data as Date) = @DATA)
			    PRINT 'Pracownikowi o ID '+ CONVERT(VARCHAR(10), @Pracownik) + ' LOT '+CONVERT(VARCHAR(10), @Lot)
				+' koliduje siê z lotem '+CONVERT(VARCHAR(10), @Lot2)
				FETCH K_Pracownik INTO @Lot, @Pracownik
				CONTINUE
			END

			INSERT INTO GR_Obslugi_lotu VALUES
			(@Lot, @Pracownik)
			FETCH K_Pracownik INTO @Lot, @Pracownik
	END
	CLOSE K_Pracownik
	DEALLOCATE K_Pracownik
GO

INSERT INTO GR_Obslugi_lotu VALUES
(1009, 34),
(1040, 29),
(1004, 12),
(1028, 9),
(1013, 13)

DELETE FROM GR_Obslugi_lotu
where Id_lotu = 1013 and Id_Pracownika = 13