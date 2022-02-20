--------wstawianie danych
--Wstawianie danych
--(id, nazwa, panstwo, nr_telefonu)
INSERT INTO Przewoznicy VALUES
(1, 'Ryanair', 'Irlandia', '+48221522001'),
(2, 'Lufthansa', 'Niemcy', '+48225123917'),
(3, 'easyJet', 'Wielka Brytania', '+48616262022'),
(4, 'Emirates', 'Zjednoczone Emiraty Arabskie', '+48223060808'),
(5, 'Air France', 'Francja', '+48225123949'),
(6, 'British Airways', 'Wielka Brytania', '+48223060850'),
(7, 'Air Berlin', 'Niemcy', '+493034340'),
(8, 'KLM', 'Holandia', '+48225123947'),
(9, 'Delta Air Lines', 'Stany Zjednoczone', '+14047152600'),
(10, 'American Airlines', 'Stany Zjednoczone', '+48226253002'),
(11, 'Air China', 'Chiny', '00861095583'),
(12, 'Singapore Airlines', 'Singapur', '+6562238888'),
(13, 'Turkish Airlines', 'Turcja', '+48225297700'),
(14, 'LOT Polish Airlines', 'Polska', '+48225777755'),
(15, 'Ukraine International Airlines', 'Ukraina', '+444865486'),
(16, 'Qatar Airways', 'Katar', '+48717564055'),
(17, 'ANA All Nippon Airways', 'Japonia', '0367411120'),
(18, 'Qantas Airways', 'Australia', '1300650729'),
(19, 'Wizz Air', 'Węgry', '+48703703003'),
(20, 'Air Canada', 'Kanada', '+48226968520');


--(idprzewoznika, nr umowy, od kiedy, do kiedy)
INSERT INTO Umowy_z_przewoznikami VALUES
(1, 1001, '20150115', '20250101'),
(2, 1002, '20160315', '20210205'),
(3, 1003, '20160215', '20220211'),
(4, 1012, '20100425', '20300709'),
(5, 1005, '20100224', '20251111'),
(6, 1023, '20190102', '20220421'),
(7, 1007, '20200101', '20201231'),  --ten juz niewazny
(8, 1008, '20190717', '20220202'),
(9, 1009, '20100110', '20300110'),
(10, 1034, '20170108', '20250125'),
(11, 1011, '20190105', '20240404'),
(12, 1056, '20160119', '20270101'),
(13, 1067, '20000616', '20210202'),
(14, 1078, '20150115', '20240212'),
(15, 1089, '20180701', '20300101'),
(16, 1016, '20100110', '20290908'),
(17, 1017, '20100110', '20201231'),  --ten tez niewazny
(18, 1018, '20150115', '20220213'),
(19, 2001, '20191231', '20211231'),
(20, 1020, '20120112', '20230307');

INSERT INTO Samoloty_szczegoly VALUES 
('Boeing', '737-300', 133),
('Boeing', '737-900', 215),
('Boeing', '747-8', 467),
('Boeing', '767-200', 216),
('Boeing', '777-300', 297),
('Boeing', '787-9', 275),
('Boeing', '787-10', 310),
('Airbus', 'A300', 266),
('Airbus', 'A310', 262),
('Airbus', 'A330', 330),
('Airbus', 'A340', 350),
('Airbus', 'A350', 325),
('Airbus', 'A380', 853), 
('Airbus', 'A318', 132),
('Airbus', 'A320', 180),
('Airbus', 'A321', 220),
('Embraer', '170', 70),
('Embraer', '175', 80),
('Embraer', '190', 98),
('Embraer', '190LR', 106),
('Embraer', '195', 108),
('Embraer', '195LR', 122),
('Saab', '2000', 58),
('ATR', '42-300', 50),
('Cessna', 'Citation I', 8),
('Cessna', 'Citation X', 12)

INSERT INTO Samoloty VALUES 
(1, 'Boeing', '737-300', 1),
(2, 'Boeing', '737-900', 2),
(3, 'Boeing', '747-8', 2),
(4, 'Boeing', '767-200', 1),
(5, 'Boeing', '777-300', 1),
(6, 'Boeing', '787-9', 1),
(7, 'Boeing', '787-10', 3),
(8, 'Airbus', 'A300', 1),
(9, 'Airbus', 'A310', 1),
(10, 'Airbus', 'A330', 3),
(11, 'Airbus', 'A340', 1),
(12, 'Airbus', 'A350', 3),
(13, 'Airbus', 'A380', 4), 
(14, 'Airbus', 'A318', 1),
(15, 'Airbus', 'A320', 4),
(16, 'Airbus', 'A321', 1),
(17, 'Embraer', '170', 5),
(18, 'Embraer', '175', 1),
(19, 'Embraer', '190', 1),
(20, 'Embraer', '190LR', 1),
(21, 'Embraer', '195', 5),
(22, 'Embraer', '195LR', 7),
(23, 'Saab', '2000', 1),
(24, 'ATR', '42-300', 7),
(25, 'Cessna', 'Citation I', 8),
(26, 'Cessna', 'Citation X', 8),
-----
(27, 'Boeing', '737-300', 6),
(28, 'Boeing', '737-900', 6),
(29, 'Boeing', '747-8', 6),
(30, 'Boeing', '767-200', 4),
(31, 'Boeing', '777-300', 6),
(32, 'Boeing', '787-9', 6),
(33, 'Boeing', '787-10', 6),
(34, 'Airbus', 'A300', 6),
(35, 'Airbus', 'A310', 6),
(36, 'Airbus', 'A330', 9),
(37, 'Airbus', 'A340', 6),
(38, 'Airbus', 'A350', 6),
(39, 'Airbus', 'A380', 8), 
(40, 'Airbus', 'A318', 6),
(41, 'Airbus', 'A320', 6),
(42, 'Airbus', 'A321', 6),
--
(43, 'Boeing', '737-300', 10),
(44, 'Boeing', '737-900', 10),
(45, 'Boeing', '747-8', 11),
(46, 'Boeing', '767-200', 10),
(47, 'Boeing', '777-300', 11),
(48, 'Boeing', '787-9', 10),
(49, 'Boeing', '787-10', 10),
(50, 'Airbus', 'A300', 10),
(51, 'Airbus', 'A310', 10),
(52, 'Airbus', 'A330', 10),
(53, 'Airbus', 'A340', 11),
(54, 'Airbus', 'A350', 10),
(55, 'Airbus', 'A380', 10), 
(56, 'Airbus', 'A318', 10),
(57, 'Airbus', 'A320', 10),
(58, 'Airbus', 'A321', 10),
--
(59, 'Boeing', '737-300', 13),
(60, 'Boeing', '737-900', 12),
(61, 'Boeing', '747-8', 13),
(62, 'Boeing', '767-200', 13),
(63, 'Boeing', '777-300', 12),
(64, 'Boeing', '787-9', 12),
(65, 'Boeing', '787-10', 12),
(66, 'Airbus', 'A300', 12),
(67, 'Airbus', 'A310', 13),
(68, 'Airbus', 'A330', 12),
(69, 'Airbus', 'A340', 13),
(70, 'Airbus', 'A350', 12),
(71, 'Airbus', 'A380', 12), 
(72, 'Airbus', 'A318', 13),
(73, 'Airbus', 'A320', 12),
(74, 'Airbus', 'A321', 12),
--
(75, 'Boeing', '737-300', 14),
(76, 'Boeing', '737-900', 14),
(77, 'Boeing', '747-8', 14),
(78, 'Boeing', '767-200', 14),
(79, 'Boeing', '777-300', 15),
(80, 'Boeing', '787-9', 14),
(81, 'Boeing', '787-10', 14),
(82, 'Airbus', 'A300', 14),
(83, 'Airbus', 'A310', 15),
(84, 'Airbus', 'A330', 14),
(85, 'Airbus', 'A340', 14),
(86, 'Airbus', 'A350', 15),
(87, 'Airbus', 'A380', 14), 
(88, 'Airbus', 'A318', 15),
(89, 'Airbus', 'A320', 14),
(90, 'Airbus', 'A321', 14),
(91, 'Embraer', '170', 15),
(92, 'Embraer', '175', 14),
(93, 'Embraer', '190', 15),
(94, 'Embraer', '190LR', 14),
(95, 'Embraer', '195', 14),
(96, 'Embraer', '195LR', 14),
(97, 'Saab', '2000', 15),
(98, 'ATR', '42-300', 14),
(99, 'Cessna', 'Citation I', 15),
(100, 'Cessna', 'Citation X', 14),
--
(101, 'Airbus', 'A300', 16),
(102, 'Airbus', 'A310', 16),
(103, 'Airbus', 'A330', 16),
(104, 'Airbus', 'A340', 16),
(105, 'Airbus', 'A350', 16),
(106, 'Airbus', 'A380', 16), 
(107, 'Airbus', 'A318', 16),
(108, 'Airbus', 'A320', 16),
(109, 'Airbus', 'A321', 16),
--
(110, 'Boeing', '737-300', 17),
(111, 'Boeing', '737-900', 17),
(112, 'Boeing', '747-8', 18),
(113, 'Boeing', '767-200', 19),
(114, 'Boeing', '777-300', 20),
(115, 'Boeing', '787-9', 17),
(116, 'Boeing', '787-10', 19),
(117, 'Airbus', 'A300', 18),
(118, 'Airbus', 'A310', 19),
(119, 'Airbus', 'A330', 20),
(120, 'Airbus', 'A340', 20),
(121, 'Airbus', 'A350', 19),
(122, 'Airbus', 'A380', 19), 
(123, 'Airbus', 'A318', 19),
(124, 'Airbus', 'A320', 19),
(125, 'Airbus', 'A321', 18),
(126, 'Embraer', '170', 17),
(127, 'Embraer', '175', 18),
(128, 'Embraer', '190', 18),
(129, 'Embraer', '190LR', 19),
(130, 'Embraer', '195', 20),
(131, 'Embraer', '195LR', 20),
(132, 'Saab', '2000', 19),
(133, 'ATR', '42-300', 19),
(134, 'Cessna', 'Citation I', 19),
(135, 'Cessna', 'Citation X', 19)


--polaczenia_z_lotniskami
--(id_lotniska, nazwa_lotniska, panstwo, miasto)
INSERT INTO Polaczenia_z_lotniskami VALUES
(1, 'Hartsfield-Jackson Atlanta International Airport', 'Stany Zjednoczone', 'Atlanta'),
(2, 'Beijing Capital International Airport', 'Chiny', 'Pekin'),
(3, 'Dubai International Airport', 'Zjednoczone Emiraty Arabskie', 'Dubaj'),
(4, 'Haneda Airport', 'Japonia', 'Tokio'),
(5, 'Los Angeles International Airport', 'Stany Zjednoczone', 'Los Angeles'),
(6, 'Chicago-O’Hare', 'Stany Zjednoczone', 'Chicago'),
(7, 'London Heathrow', 'Wielka Brytania', 'Londyn'),
(8, 'Hong Kong International Airport', 'Chiny', 'Hongkong'),
(9, 'Shanghai Pudong International Airport', 'Chiny', 'Szanghaj'),
(10, 'Charles de Gaulle International Airport', 'Francja', 'Roissy-en-France'),
(11, 'Amsterdam Airport Schiphol', 'Holandia', 'Amsterdam'),
(12, 'Dallas/Fort Worth International Airport', 'Stany Zjednoczone', 'Dallas'),
(13, 'Guangzhou Baiyun International Airport', 'Chiny', 'Kanton'),
(14, 'Frankfurt am Main Airport', 'Niemcy', 'Frankfurt'),
(15, 'Ataturk Airport', 'Turcja', 'Stambul'),
(16, 'Indira Gandhi International Airport', 'Indie', 'Nowe Delhi'),
(17, 'Soekarno–Hatta International Airport', 'Indonezja', 'Dzakarta'),
(18, 'Singapore Changi Airport', 'Singapur', 'Singapur'),
(19, 'Incheon International Airport', 'Korea Południowa', 'Inczon'),
(20, 'Denver International Airport', 'Stany Zjednoczone', 'Denver'),
(21, 'Warsaw Chopin Airport', 'Polska', 'Warszawa'),
(22, 'Boryspil International Airport', 'Ukraina', 'Boryspol')


--cennik_lotow
--(dokad, cena, id_przewoznika)
INSERT INTO Cennik_lotow VALUES 
(1, 3000, 9),
(1, 3500, 10),
(1, 3300, 1),
(1, 3200, 14),
(2, 4400, 17),
(2, 3900, 11),
(2, 4800, 15),
(3, 5000, 4),
(4, 4000, 17),
(4, 4500, 2),
(4, 3990, 18),
(5, 2990, 19),
(5, 3450, 20),
(6, 2500, 6),
(6, 3500, 10),
(6, 4400, 14),
(6, 3150, 15),
(7, 2000, 6),
(7, 2500, 3),
(7, 2750, 5),
(8, 4400, 11),
(9, 4500, 11),
(10, 1800, 5),
(11, 2100, 8),
(12, 2900, 7),
(13, 4100, 16),
(14, 2150, 9),
(14, 2500, 7),
(15, 3900, 13),
(15, 4100, 14),
(16, 4500, 15),
(16, 4250, 20),
(16, 4300, 19),
(17, 2900, 18),
(17, 3300, 12),
(18, 4500, 12),
(18, 4110, 13),
(18, 3400, 3),
(19, 4700, 17),
(19, 4500, 14),
(20, 3900, 9),
(20, 3600, 1),
(21, 1800, 10),
(21, 2100, 14),
(21, 2700, 12),
(22, 2500, 15),
(22, 2000, 6),
(22, 2900, 4)

--terminale
INSERT INTO Terminale VALUES 
('A', 'N'),
('B', 'E'),
('C', 'S'),
('D', 'W')


--bramki
INSERT INTO Bramki VALUES
('A', 1),
('A', 2),
('A', 3),
('B', 1),
('B', 2),
('B', 3),
('B', 4),
('B', 5),
('C', 1),
('C', 2),
('D', 1),
('D', 2),
('D', 3),
('D', 4),
('D', 5),
('D', 6)
