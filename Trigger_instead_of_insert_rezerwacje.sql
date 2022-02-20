
IF OBJECT_ID('Tr_rezerwacje','TR') IS NOT NULL
DROP TRIGGER Tr_rezerwacje

GO
Create TRIGGER Tr_rezerwacje ON Rezerwacje
Instead of insert
AS
	IF EXISTS(SELECT * FROM inserted I join Pasazer P on I.Id_pasazera = P.Id_Pasazera
			  where EXISTS (Select * from [Osoby niebezpieczne] O where O.NR_Paszportu = P.NR_Paszportu))
			  BEGIN 
				DECLARE @Imie NVARCHAR(50)
				DECLARE @Nazwisko NVARCHAR(50)
				DECLARE @Paszport VARCHAR(15)
				DECLARE @KOMUNIKAT NVARCHAR(100)
				SET @Imie = (SELECT P.Imie FROM inserted I join Pasazer P on I.Id_pasazera = P.Id_Pasazera
							where EXISTS (Select * from [Osoby niebezpieczne] O where O.NR_Paszportu = P.NR_Paszportu))
				SET @Nazwisko = (SELECT P.Nazwisko FROM inserted I join Pasazer P on I.Id_pasazera = P.Id_Pasazera
							where EXISTS (Select * from [Osoby niebezpieczne] O where O.NR_Paszportu = P.NR_Paszportu))
				SET @Paszport = (SELECT P.NR_Paszportu FROM inserted I join Pasazer P on I.Id_pasazera = P.Id_Pasazera
							where EXISTS (Select * from [Osoby niebezpieczne] O where O.NR_Paszportu = P.NR_Paszportu))
				SET @Komunikat = 'Pasa¿er '+@Imie + ' '+@Nazwisko + ' o numerze paszportu '+@Paszport+
				' jest osob¹ niebezpieczn¹.'  
				PRINT @KOMUNIKAT
				PRINT 'Odmowa w ca³ej grupie rezerwacji. Proszê slu¿bê bezpieczeñstwa sprawdziæ wszystkich pasa¿erów'
			  END
	ELSE
		BEGIN
		DECLARE K_Rezerwacja CURSOR
		FOR SELECT I.Id_Rezerwacji, I.Id_lotu, I.Id_pasazera, I.Klasa_podrozy FROM inserted i
		FOR READ ONLY
		DECLARE @ID_rezerwacji INT
		DECLARE @Id_lotu INT
		DECLARE @ID_pasazera INT
		DECLARE @Klasa INT
		OPEN K_Rezerwacja
		FETCH K_Rezerwacja INTO @ID_rezerwacji, @Id_lotu, @ID_pasazera, @Klasa
		WHILE @@FETCH_STATUS <> -1
		BEGIN
			IF not EXISTS (SELECT * from [Klasa podrozy] K where K.Klasa = @Klasa)
			BEGIN
				PRINT 'Odmowa rezerwacji o id '+CONVERT(VARCHAR(10), @ID_rezerwacji) + ' z powodu nie istnienia wskazanej klasy podro¿y'
				FETCH K_Rezerwacja INTO @ID_rezerwacji, @Id_lotu, @ID_pasazera, @Klasa
				CONTINUE
			END
			 
			IF not EXISTS(Select * from Pasazer P where P.Id_Pasazera = @ID_pasazera)
			BEGIN
				PRINT 'Pasazer o id '+CONVERT(VARCHAR(10), @ID_pasazera)+' nie zidentyfikowany w bazie pasa¿erow. Odmowa w rezerwacji o id '+CONVERT(VARCHAR(10), @ID_rezerwacji)
				FETCH K_Rezerwacja INTO @ID_rezerwacji, @Id_lotu, @ID_pasazera, @Klasa
				CONTINUE
			END
			 
			IF EXISTS(Select * from Loty L where L.Id_lotu = @Id_Lotu)
			BEGIN
				DECLARE @Data_lotu DATETIME
				SET @Data_lotu = (Select DATA from LOTY where Id_lotu = @Id_lotu) 

				DECLARE @Ilosc_lotow INT -- ilosc lotow danego pasazera w przedziale 4 godzinnym wzgledem zaktualizowanej rezerwacji
	            SET @Ilosc_lotow = (SELECT COUNT(*) FROM Rezerwacje
						JOIN Loty ON Loty.Id_lotu = Rezerwacje.Id_lotu
						WHERE Id_pasazera = @ID_pasazera
						AND Data < DATEADD(HOUR, 4, @Data_lotu)
						AND Data > DATEADD(HOUR, -4, @Data_lotu))

				IF @Ilosc_lotow <> 0 
				BEGIN
					PRINT('Pasazer o id ' +CONVERT(VARCHAR(10), @ID_pasazera)+ ' ma juz rezerwacje na lot w tym samym czasie')
					FETCH K_Rezerwacja INTO @ID_rezerwacji, @Id_lotu, @ID_pasazera, @Klasa
					CONTINUE
				END

				DECLARE @Ilosc_miejsc_w_samolocie INT
				SET @Ilosc_miejsc_w_samolocie = (Select Ss.Ilosc_miejsc from Loty L join Samoloty S on L.Id_samolotu = S.Id_samolotu
											 join Samoloty_szczegoly Ss on S.Marka = Ss.Marka and S.Model = Ss.Model
											 where L.Id_lotu = @Id_lotu)

				DECLARE @Ilosc_rezerwacji INT
				SET @Ilosc_rezerwacji = (Select dbo.Ilosc_rezerwacji_na_lot(@Id_lotu))
				
				DECLARE @Ilosc_miejsc INT
				SET @Ilosc_miejsc = @Ilosc_miejsc_w_samolocie - @Ilosc_rezerwacji

				IF @Ilosc_miejsc <= 0
					PRINT 'Odmowa w rezerwacji o id '+ CONVERT(VARCHAR(10), @ID_rezerwacji)+ ' z powodu braku miejsc w samolocie'
				ELSE 
				BEGIN
				  INSERT INTO Rezerwacje Values
				  (@ID_rezerwacji, @id_lotu, @ID_pasazera, @Klasa)
				END
			END
			ELSE 
			 PRINT 'Odmowa w rezerwacji o id '+ CONVERT(VARCHAR(10), @ID_rezerwacji) + ' z powodu nie isnienia lotu o id '+ CONVERT(VARCHAR(10), @Id_lotu)
			
			FETCH K_Rezerwacja INTO @ID_rezerwacji, @Id_lotu, @ID_pasazera, @Klasa
		END
		CLOSE K_rezerwacja
		DEALLOCATE K_rezerwacja
	END
Go

INSERT INTO Rezerwacje Values
(44, 1022, 27 , 1)	

INSERT INTO Rezerwacje Values
(44, 1022, 23 , 5),
(45, 1050, 23, 1),
(46, 1023, 99, 2),
(47, 1015, 18, 3)	

Select * from Rezerwacje
Delete from Rezerwacje where Id_Rezerwacji = 47	 
