-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Wrz 2022, 15:48
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `plemiona`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `buildings`
--

INSERT INTO `buildings` (`id`, `name`) VALUES
(1, 'chata drwala'),
(2, 'huta żelaza'),
(3, 'dół z gliną');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `nick` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `playerscol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `nick`, `email`, `password`, `playerscol`) VALUES
(1, 'pawel', 'pawel.lewandowski2004@wp.pl', '1234', NULL),
(2, 'kacper', 'kacper.kaminski2004@wp.pl', '1234', NULL),
(3, 'oskar', 'oskar.stawikowski2004@wp.pl', '1234', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `resources`
--

INSERT INTO `resources` (`id`, `name`, `description`) VALUES
(1, 'żelazo', NULL),
(2, 'glina', NULL),
(3, 'drewno', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `troops`
--

CREATE TABLE `troops` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `distance_damage` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `troops`
--

INSERT INTO `troops` (`id`, `name`, `description`, `damage`, `distance_damage`, `defense`) VALUES
(1, 'rycerz', NULL, NULL, NULL, NULL),
(2, 'łucznik', NULL, NULL, NULL, NULL),
(3, 'kusznik', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages`
--

CREATE TABLE `villages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `players_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages`
--

INSERT INTO `villages` (`id`, `name`, `x`, `y`, `players_id`) VALUES
(2, 'wioska pawel', NULL, NULL, 1),
(3, 'wioska kacper', NULL, NULL, 2),
(4, 'wioska oskar', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_buildings`
--

CREATE TABLE `villages_has_buildings` (
  `Villages_id` int(11) NOT NULL,
  `Villages_players_id` int(11) NOT NULL,
  `Buildings_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_resources`
--

CREATE TABLE `villages_has_resources` (
  `Villages_id` int(11) NOT NULL,
  `Villages_players_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_troops`
--

CREATE TABLE `villages_has_troops` (
  `Villages_id` int(11) NOT NULL,
  `Villages_players_id` int(11) NOT NULL,
  `troops_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `troops`
--
ALTER TABLE `troops`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`,`players_id`),
  ADD KEY `fk_Villages_players` (`players_id`);

--
-- Indeksy dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD PRIMARY KEY (`Villages_id`,`Villages_players_id`,`Buildings_id`),
  ADD KEY `fk_Villages_has_Buildings_Buildings1` (`Buildings_id`);

--
-- Indeksy dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD PRIMARY KEY (`Villages_id`,`Villages_players_id`,`resources_id`),
  ADD KEY `fk_Villages_has_resources_resources1` (`resources_id`);

--
-- Indeksy dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD PRIMARY KEY (`Villages_id`,`Villages_players_id`,`troops_id`),
  ADD KEY `fk_Villages_has_troops_troops1` (`troops_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `troops`
--
ALTER TABLE `troops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages`
--
ALTER TABLE `villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  MODIFY `Villages_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  MODIFY `Villages_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  MODIFY `Villages_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `fk_Villages_players` FOREIGN KEY (`players_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD CONSTRAINT `fk_Villages_has_Buildings_Buildings1` FOREIGN KEY (`Buildings_id`) REFERENCES `buildings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Villages_has_Buildings_Villages1` FOREIGN KEY (`Villages_id`,`Villages_players_id`) REFERENCES `villages` (`id`, `players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD CONSTRAINT `fk_Villages_has_resources_Villages1` FOREIGN KEY (`Villages_id`,`Villages_players_id`) REFERENCES `villages` (`id`, `players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Villages_has_resources_resources1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD CONSTRAINT `fk_Villages_has_troops_Villages1` FOREIGN KEY (`Villages_id`,`Villages_players_id`) REFERENCES `villages` (`id`, `players_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Villages_has_troops_troops1` FOREIGN KEY (`troops_id`) REFERENCES `troops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
